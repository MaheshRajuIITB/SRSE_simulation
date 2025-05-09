function SRSE_algorithm(PA_threshold::Any, Z_spf::Any, V_pmu::Any, tolerance::Any, epsi::Any, dig::Any, P::Any, V_k::Any, Y::Any, b::Any, Fb::Any, Tb::Any, Nl::Any, Nb::Any, G::Any, B1::Any, B2::Any, Flow_indices::Any, W_inv::Any, W_inv_sd::Any, H_meas::Any, H_scal::Any,m::Any)
NLS_Chi = 0
Principal_angle = 0 
NLS_RMSE_abs = 0
Z_correction = copy(Z_spf)
    for pa_te in 1:10
        NLS_matrix = NLS_measurement_vector(Z_spf)
        V_estimation_NLS = NonLinear_State_Estimation(tolerance,NLS_matrix,P, V_k, Y,b,Fb,Tb,Nl,Nb,G,B1,B2,Flow_indices)
        V_estimate_NLS_PMUs = V_estimation_NLS[P]
        Angle_diff = rad2deg.(angle.(V_pmu)) - rad2deg.(angle.(V_estimate_NLS_PMUs))
        ####### Clustering algorithm ##################
        Angle_diff_matrix = reshape(Angle_diff, 1, :)
        result_dbscan = dbscan(Angle_diff_matrix,epsi, min_neighbors = 1, min_cluster_size = 1)
        dbscan_cluster = result_dbscan.clusters
        Indices_clusters = []
        PMUs_cluster = []
        Cluster_with_values = []
        size_of_the_clsuters = Int64[]
        for clust in 1:length(dbscan_cluster)
            size_of_the_clsuters = [size_of_the_clsuters;dbscan_cluster[clust].size]
            Core_indices = dbscan_cluster[clust].core_indices
            push!(Indices_clusters,Core_indices)
            Core_indices_PMUs = P[Core_indices]
            push!(PMUs_cluster,Core_indices_PMUs)
            push!(Cluster_with_values,Angle_diff_matrix[Core_indices])
        end
        correction_delta_index = argmax(size_of_the_clsuters)
        corrction_delta = median(round.(Cluster_with_values[correction_delta_index], digits = dig))
        Clusters_with_spoofed_PMUs = [PMUs_cluster[i] for i in 1:length(size_of_the_clsuters) if i != correction_delta_index]
        Clusters_with_spoofed_angles = [Cluster_with_values[i].- corrction_delta for i in 1:length(size_of_the_clsuters) if i != correction_delta_index]

        # for (p1, p2) in zip(Clusters_with_spoofed_PMUs,Clusters_with_spoofed_angles)
        #     println("The cluster $p1 is spoofed with $(mean(p2)) ")
        # end



        Idenfied_spoofed_PMUs = vcat([vector for (i, vector) in enumerate(PMUs_cluster) if i != correction_delta_index]...)
        Estimated_spoofed_angles = [vector .- corrction_delta for (i, vector) in enumerate(Cluster_with_values) if i != correction_delta_index]
        Estimated_spoofed_angles = [item for subarray in Estimated_spoofed_angles for item in subarray]
        ####### Correction algorithm
        Correction_V_estimation_NLS = V_estimation_NLS*exp(deg2rad(corrction_delta)*im)
        Position_Idenfied_spoofed_PMUs = findall(x -> x in Idenfied_spoofed_PMUs, P)
        Z_correction = Correction_measurment(Position_Idenfied_spoofed_PMUs,Estimated_spoofed_angles,Z_spf)
        Z_correction_meas = vcat(Z_correction...)            

        # PA test after correction
        Z_scal_correction = W_inv*Z_correction_meas
        Qm, Rm = qr(H_scal)
        Principal_angle_corre = acosd((norm(inv(Rm')*(H_scal')*Z_scal_correction))/(norm(Z_scal_correction)))
        # println("Principal angle after correction :", Principal_angle_corre)
        

        if Principal_angle_corre <= PA_threshold || pa_te == 1 #pa_te should be 10 for accurate PA result and it should be 1 for RMSE result

            Residula_vector_NLS = Z_correction_meas - (H_meas*Correction_V_estimation_NLS)

            NLS_Chi = abs.(((Residula_vector_NLS')*W_inv_sd*Residula_vector_NLS)[1,1])
            Principal_angle = Principal_angle_corre

            NLS_RMSE_abs = norm(abs.(Z_correction_meas) - abs.(H_meas*Correction_V_estimation_NLS))/sqrt(m)
            # NLS_RMSE_ang_monte[monte] = norm(angle.(Z_correction_meas) - angle.(H_meas*Correction_V_estimation_NLS))/sqrt(m)
            break
        else
            Principal_angle = Principal_angle_corre
            Z_spf = copy(Z_correction)
            V_pmu = [Z_spf[u][1] for u in Np]
            tolerance = 1e-6
            epsi /= 2
        end

    end

    return  NLS_Chi, Principal_angle, NLS_RMSE_abs, Z_correction
end