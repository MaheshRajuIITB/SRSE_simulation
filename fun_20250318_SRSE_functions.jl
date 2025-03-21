function Spoofed_measurement_vector(Position_Spoofed_PMUs::Any,Spoofing_anlge::Any, Z ::Any)
    Z_spf = copy(Z)
    for q in Position_Spoofed_PMUs
        Spf_angle = deg2rad(Spoofing_anlge[findfirst(x -> x == q, Position_Spoofed_PMUs)])
        Z_spf[q] =  Z_spf[q] .*exp(Spf_angle * im)
    end
    return Z_spf
end

function Correction_measurment(Position_Idenfied_spoofed_PMUs::Any,Estimated_spoofed_angles::Any, Z ::Any)
    Z_corr = copy(Z)
    for q in Position_Idenfied_spoofed_PMUs
        Corr_angle = deg2rad(Estimated_spoofed_angles[findfirst(x -> x == q, Position_Idenfied_spoofed_PMUs)])
        Z_corr[q] =  Z_corr[q] .*exp(-Corr_angle * im)
    end
    return Z_corr
end


function NLS_measurement_vector(Z_spf::Any)
    NLS_matrix = []
    for PMU_measurements in Z_spf
        PMU_meas_real = real(PMU_measurements)
        PMU_meas_imag = imag(PMU_measurements)
        NLS_matrix = [NLS_matrix; abs(PMU_measurements[1])]
        NLS_matrix = [NLS_matrix; [PMU_meas_real[1] * PMU_meas_real[p] + PMU_meas_imag[1] * PMU_meas_imag[p] for p in 2:length(PMU_measurements)]]
        NLS_matrix = [NLS_matrix; [PMU_meas_imag[1] * PMU_meas_real[p] - PMU_meas_real[1] * PMU_meas_imag[p] for p in 2:length(PMU_measurements)]]
    end
    return NLS_matrix
end


function NonLinear_State_Estimation(tolerance::Any,NLS_matrix::Any,P::Any, V_k::Any, Y::Any,b::Any,Fb::Any,Tb::Any,Nl::Any,Nb::Any,G::Any,B1::Any,B2::Any,Flow_indices::Any)
    for ite = 1:10000
        l = length(NLS_matrix)
        inti_matrix, Jac = Intial_matrix(P,V_k,Y,b,Fb,Tb,Flow_indices,l,Nb,G,B1,B2)
        delta_meas = NLS_matrix - inti_matrix
        # Jac_pinv = pinv(Jac)
        # delta = Jac_pinv * delta_meas
        # Jac = Jac[:,Reach_bus_indices]
        # V_k_reach = V_k[Reach_bus]
        delta = Jac \ delta_meas
        V_delta = delta[1:2:end] .+ delta[2:2:end]*im
        V_k = V_k + V_delta
        if maximum(abs.(delta)) <= tolerance
            break
        end    
    end
    return V_k
end




function Intial_matrix(PMU::Any,V_k::Any,Y::Any,b::Any,Fb::Any,Tb::Any,Flow_indices::Any,l::Any,Nb::Any,G::Any,B1::Any,B2::Any)
    Intial_matrix = Float64[]
    Jac = zeros(Float64, l, 2*Nb)
    k = 1
    for (pmu,q) in zip(1:length(PMU), PMU)
        Intial_matrix = [Intial_matrix; abs(V_k[q])]
        V_k_real = real(V_k[q])
        V_k_imag = imag(V_k[q])
        Jac[k,(q*2)-1:(q*2)] = [V_k_real / sqrt(V_k_real^2 + V_k_imag^2), V_k_imag / sqrt(V_k_real^2 + V_k_imag^2)];
        k = k+1
        If = [((V_k[Fb[v]] - V_k[Tb[v]])*Y[v]) + (b[v] * V_k[Fb[v]]) for v in Flow_indices[pmu,1]]
        It = [((V_k[Tb[v]] - V_k[Fb[v]])*Y[v]) + (b[v] * V_k[Tb[v]]) for v in Flow_indices[pmu,2]]
        Curren = [If; It]
        Active_powers = real(V_k[q].*(conj.(Curren)))
        Reactive_powers = imag(V_k[q].*(conj.(Curren)))
        Intial_matrix = [Intial_matrix; Active_powers;Reactive_powers]
        If_k_real = real(If)
        If_k_imag = imag(If)
        It_k_real = real(It)
        It_k_imag = imag(It)
        for (p,Fe) in zip(1:length(If),Flow_indices[pmu,1])
            Jac[k,((Fb[Fe])*2-1):(Fb[Fe])*2] = [If_k_real[p] + V_k_real * G[Fe] + V_k_imag * B1[Fe], If_k_imag[p] - V_k_real * B1[Fe] + V_k_imag * G[Fe]]
            Jac[k,((Tb[Fe])*2-1):(Tb[Fe])*2] = [-G[Fe] * V_k_real - B2[Fe] * V_k_imag, B2[Fe] * V_k_real - G[Fe] * V_k_imag]
            k = k+1
        end
        for (p,Te) in zip(1:length(It),Flow_indices[pmu,2])
            Jac[k,((Tb[Te])*2-1):(Tb[Te])*2] = [It_k_real[p] + V_k_real * G[Te] + V_k_imag * B1[Te], It_k_imag[p] - V_k_real * B1[Te] + V_k_imag * G[Te]]
            Jac[k,((Fb[Te])*2-1):(Fb[Te])*2] = [-G[Te] * V_k_real - B2[Te] * V_k_imag, B2[Te] * V_k_real - G[Te] * V_k_imag]
            k = k+1
        end
        for (p,Fe) in zip(1:length(If),Flow_indices[pmu,1])
            Jac[k,((Fb[Fe])*2-1):(Fb[Fe])*2] = [-If_k_imag[p] + V_k_imag * G[Fe] - V_k_real * B1[Fe], If_k_real[p] - V_k_imag * B1[Fe] - V_k_real * G[Fe]]
            Jac[k,((Tb[Fe])*2-1):(Tb[Fe])*2] = [-G[Fe] * V_k_imag + B2[Fe] * V_k_real,  B2[Fe] * V_k_imag + G[Fe] * V_k_real]
            k = k+1
        end
        for (p,Te) in zip(1:length(It),Flow_indices[pmu,2])
            Jac[k,((Tb[Te])*2-1):(Tb[Te])*2] = [-It_k_imag[p] + V_k_imag * G[Te] - V_k_real * B1[Te], It_k_real[p] - V_k_imag * B1[Te] - V_k_real * G[Te]]
            Jac[k,((Fb[Te])*2-1):(Fb[Te])*2] = [-G[Te] * V_k_imag + B2[Te] * V_k_real, B2[Te] * V_k_imag + G[Te] * V_k_real]
            k = k+1            
        end
    end
    return Intial_matrix, Jac
    
end

