using MAT,LinearAlgebra, Statistics, Plots, Clustering, Distributions, Dates, DataFrames, XLSX

include("fun_20250318_SRSE_functions.jl")
today_date = Dates.format(today(), "yyyymmdd")


Test_system = 118

if Test_system == 14

    ##### Data of IEEE - 14bus system #####
    data = matread("data_20250104_IEEE_14bus.mat")
    P = [2, 4, 6 ,7 ,10 ,14]
    PA_threshold = 0.1080
    no_of_spoofed_PMUs = [0 1 1 2 2 3 3 4 5 5 6] #for 14 bus system
    

elseif Test_system == 30

    ##### Data of IEEE - 30bus system #####
    data = matread("data_20250104_IEEE_30bus.mat")
    P = [2, 3, 6, 10, 11, 12, 15, 20, 23, 25, 27, 28, 29]
    PA_threshold = 0.125
    no_of_spoofed_PMUs = [0 1 3 4 5 7 8 9 10 12 13] #for 30 bus system
    V_previous = matread("Previous_SE_30bus.mat")["V_previous"]

elseif Test_system == 118

    ##### Data of IEEE - 118bus system #####
    data = matread("data_20250104_IEEE_118bus.mat")
    P = [1, 3, 4, 5, 6, 8, 9, 11, 12, 15, 17, 19, 21, 23, 25, 26, 28, 30, 34, 35, 37, 40, 43, 45, 46, 49, 52, 54, 56, 59, 62, 63, 65, 68, 70, 71, 75, 76, 77, 78, 80, 83, 85, 86, 89, 90, 92, 94, 96, 100, 105, 108, 110, 114];
    PA_threshold = 0.1028
    no_of_spoofed_PMUs = [0 5 11 16 22 27 32 38 43 49 53 54] #for 118 bus system
    V_previous = matread("Previous_SE_118bus.mat")["V_previous"]    
else
    println("Type the test system number with in 14, 30 and 118")
end

println("Simulatino of IEEE $(Test_system) system")

G1_PMUs = [1, 6, 12, 21, 28, 37, 46, 56, 65, 75, 80, 89, 96, 110]
# G1_PMUs = [1, 6, 12, 21, 28, 37, 46]
NO_PMUs_G1 = 14
G1_Buses = [1, 6, 12, 21, 28, 37, 46, 56, 65, 75, 80, 89, 96, 110, 103, 93, 107, 72, 61, 118, 87, 88, 24, 22, 53, 2, 38, 99, 64]
NO_buses_G1 = 29

G2_PMUs = [3, 8, 15, 23, 30, 40, 49, 59, 68, 76, 83, 90, 100, 114]
NO_PMUs_G2 = 14
G2_Buses =  [3, 8, 15, 23, 30, 40, 49, 59, 68, 76, 83, 90, 100, 114, 60, 111, 33, 58, 101, 42, 116, 115, 81, 47, 109, 51, 55, 102, 7]
NO_buses_G2 = 29

G3_PMUs = [4, 9, 17, 25, 34, 43, 52, 62, 70, 77, 85, 92, 105]
NO_PMUs_G3 = 13
G3_Buses = [4, 9, 17, 25, 34, 43, 52, 62, 70, 77, 85, 92, 105, 39, 18, 84, 14, 104, 95, 20, 79, 113, 44, 66, 36, 50, 48, 29, 69]
NO_buses_G3 = 29

G4_PMUs = [5, 11, 19, 26, 35, 45, 54, 63, 71, 78, 86, 94, 108]
NO_PMUs_G4 = 13
G4_Buses = [5, 11, 19, 26, 35, 45, 54, 63, 71, 78, 86, 94, 108, 106, 10, 73, 31, 82, 67, 16, 13, 41, 98, 32, 97, 112, 74, 91, 117, 27, 57]
NO_buses_G4 = 31

Group_PMU = []
Group_PMU = push!(Group_PMU,G1_PMUs,G2_PMUs, G3_PMUs, G4_PMUs)

Group_Buses = []
Group_Buses = push!(Group_Buses,G1_Buses,G2_Buses, G3_Buses, G4_Buses)


P = Group_PMU[2]

All_bus_measurements = data["z"]; H = data["H"]; Fb = Int.(data["Fb"]); Tb = Int.(data["Tb"]); R = data["R"]; X = data["X"]; b = data["b"]; Nb = Int.(data["Nb"]); Nl = Int.(data["Nl"]); V_true = data["V_true"]
####  Calculate impedance and admittance
z = R + im*X; Y = 1 ./ z; G = real(Y); B2 = imag(Y); B1 = imag(Y + b)
Np = 1:length(P)

#Extracting flow_indides for entire system based on PMU installation
Flow_indices = Array{Vector{Int64}}(undef, length(P), 2)
for pmu in Np
    From_end_indices = []
    To_end_indices = []
    From_end = findall(x -> x == P[pmu], Fb)
    Flow_indices[pmu,1] = [I[1] for I in From_end]
    To_end = findall(x -> x == P[pmu], Tb)
    Flow_indices[pmu,2]  = [I[1] for I in To_end]
    Flow_indices
end


######^^^^^^selecting the states accordin to reach of PMUs^^^^^#####
idx_Fb = findall(x -> x in P, Fb)
idx_Tb = findall(x -> x in P, Tb)

# Extract corresponding elements
Reach_bus = unique(vcat(Tb[idx_Fb], Fb[idx_Tb],P))

# Reach_bus_indices = []
# # Reach_bus_indices = [[Reach_bus_indices, Reach_bus_indices[h]*2 - 1, Reach_bus_indices[h]*2] for h in 1:length(Reach_bus)]
# for h in Reach_bus
#     global Reach_bus_indices = sort([Reach_bus_indices; h*2 - 1; h*2])
# end

# Reach_bus = sort(intersect(Reach_bus, G1_Buses))
# Nb = length(Reach_bus)
# Assigning the only PMU measurements to "Z" and rows related to PMU measurements of whole H to H_pmu
# Z = All_bus_measurements[P]
# H_pmu = H[P]
# W_pmu = []
Z = All_bus_measurements[P]
H_pmu = H[P]
W_pmu = []


# Standard Deviations
StandardDeviation_V = 0.001 #for voltage measurements
StandardDeviation_I = 0.002 #for current measurements


# Initialize variance matrix
StandardDeviation_matrix = []

for z_entry in Z
    sd = [StandardDeviation_V; fill(StandardDeviation_I, size(z_entry, 1) - 1)]
    push!(StandardDeviation_matrix, sd)
    [push!(W_pmu, sd.^2)]
end


H_meas = vcat(H_pmu...)
H_meas = H_meas[:,Reach_bus]
W_vect = vcat(W_pmu...)
W = Diagonal(W_vect)
W_inv = W^(-1/2)
H_scal = W_inv*H_meas
# H_scal = H_scal[:,Reach_bus]
Wanna_add_noise = "yes"


monte_simulation = 1000


Multi_percent = "Mulitple_GSAs"
# Multi_percent = "Percetange_Mulitple_GSAs"

if Multi_percent == "Mulitple_GSAs"
    no_of_cases = 6 # for multiple cases
else
    no_of_cases = length(no_of_spoofed_PMUs)    
end

# Spoofing_angles = [2.5, -1.5, -2, 2.5]
Spf_angle = 0.7*ones(length(P)) # fixed spoofing angle i.e., 0.7
# Spf_angle = collect(-1:0.05:1) # spoofing angle varies between -1 t: 0.05 : 1

Spoofed_PMUs_for_case = Array{Vector{Float64}}(undef,no_of_cases,1) #what are the PMUs are spoofed in different cases
Spoofing_angles_for_case = Array{Vector{Float64}}(undef,no_of_cases,1) #what are the spoofing angles in different cases


##Storing the mean values for all 6 cases
LSE_PA_mean = zeros(Float32, no_of_cases)
LSE_Chi_mean = zeros(Float32, no_of_cases)
LSE_Chi_mean2 = zeros(Float32, no_of_cases)
LSE_RMSE_abs_mean = zeros(Float32, no_of_cases) 
LSE_RMSE_ang_mean = zeros(Float32, no_of_cases)

NLS_PA_mean = zeros(Float32, no_of_cases)
NLS_Chi_mean = zeros(Float32, no_of_cases)
NLS_RMSE_abs_mean = zeros(Float32, no_of_cases) 
NLS_RMSE_ang_mean = zeros(Float32, no_of_cases)

##Storing entire monte simulation into one variable in MAT file
LSE_PA = Array{Vector{Float64}}(undef,no_of_cases,1)
LSE_Chi = Array{Vector{Float64}}(undef,no_of_cases,1)
LSE_Chi2 = Array{Vector{Float64}}(undef,no_of_cases,1)
LSE_RMSE_abs = Array{Vector{Float64}}(undef,no_of_cases,1)
LSE_RMSE_ang = Array{Vector{Float64}}(undef,no_of_cases,1)

NLS_PA = Array{Vector{Float64}}(undef,no_of_cases,1)
NLS_Chi = Array{Vector{Float64}}(undef,no_of_cases,1)
NLS_RMSE_abs = Array{Vector{Float64}}(undef,no_of_cases,1)
NLS_RMSE_ang = Array{Vector{Float64}}(undef,no_of_cases,1)




for nsd in 0:no_of_cases-1

    ns = nsd+1;
    if Multi_percent == "Mulitple_GSAs"
        ####### 5 PMUs are spoofed case study with one non-spoofing case
        Position_Spoofed_PMUs = sample(Np,nsd,replace=false) #selecting PMU positions for spoofing and no pmu should not be repitative
        Spoofing_angles = rand(Spf_angle,nsd)
    else
        ####### Percetange spoofed PMUs case study with one non-spoofing case
        Position_Spoofed_PMUs = sample(Np,no_of_spoofed_PMUs[ns],replace=false)
        Spoofing_angles = rand(Spf_angle,no_of_spoofed_PMUs[ns])
    end

    Spoofed_PMUs_for_case[ns] = P[Position_Spoofed_PMUs]
    println("Spoofed PMU:", P[Position_Spoofed_PMUs])  
    
    
    Spoofing_angles_for_case[ns] = Spoofing_angles
    println("Spoofed Angle:", Spoofing_angles)


    # storing all monte values
    LSE_PA_monte = zeros(Float32, monte_simulation)
    LSE_Chi_monte  = zeros(Float32, monte_simulation)
    LSE_RMSE_abs_monte = zeros(Float32, monte_simulation)
    LSE_RMSE_ang_monte = zeros(Float32, monte_simulation)
    
    NLS_PA_monte = zeros(Float32, monte_simulation)
    NLS_Chi_monte = zeros(Float32, monte_simulation)
    NLS_RMSE_abs_monte = zeros(Float32, monte_simulation)
    NLS_RMSE_ang_monte = zeros(Float32, monte_simulation)

    
    for monte in 1:monte_simulation
        println(monte)
        
        if Wanna_add_noise == "yes"
            Z_pmu = [Z[u] + StandardDeviation_matrix[u] .*(randn(ComplexF64, size(Z[u])) + 1im * randn(ComplexF64, size(Z[u]))) for u in Np] #forming the measurement vector by adding noise of standard deviation
        else
            Z_pmu = [Z[u] for u in Np]
        end
    
                
        Z_spf = Spoofed_measurement_vector(Position_Spoofed_PMUs,Spoofing_angles,Z_pmu) #Introducing the spoofing angles
        V_pmu = [Z_spf[u][1] for u in Np] # Voltage measurements of PMU
        Z_meas = vcat(Z_spf...)
        m = length(Z_meas) # no of measurements
        Z_scal = W_inv*Z_meas
    
        ########^^^^^^^^^^PA test with spf ^^^^^^^^^^^######
        Qm, Rm = qr(H_scal)
        Principal_angle = acosd((norm(inv(Rm')*(H_scal')*Z_scal))/(norm(Z_scal)))
        LSE_PA_monte[monte] = Principal_angle
        println("Principal angle before correction :", Principal_angle)
        
        # Linear State Estimation with PMU measurements
        V_estimation = H_scal \ Z_scal

        Residula_vector = Z_meas - (H_meas*V_estimation)

        ###### Chi squre with spoofing ############
        # W_inv_sd = inv(W)
        # LSE_Chi_monte[monte] = abs.(((Residula_vector')*W_inv_sd*Residula_vector)[1,1])

        #######^^^^^^^RMSE with Spoofing^^^^^^########
        # LSE_RMSE_abs_monte[monte] = norm(abs.(Z_meas) - abs.(H_meas*V_estimation))/sqrt(m)
        # LSE_RMSE_ang_monte[monte] = norm(angle.(Z_meas) - angle.(H_meas*V_estimation))/sqrt(m)

    
        tolerance = 1e-3
        epsi = 0.1
        # V_k = copy(V_previous)
        V_k = copy(V_true)
        dig = 3
            
        for pa_te in 1:10
    
            # if Principal_angle < PA_threshold
            #     println("The Estimated voltage:",V_estimation)
            #     break
            # else
                NLS_matrix = NLS_measurement_vector(Z_spf)
                V_estimation_NLS = NonLinear_State_Estimation(tolerance,NLS_matrix, P, V_k, Y,b,Fb,Tb,Nl,Nb,G,B1,B2,Flow_indices)
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

                for (p1, p2) in zip(Clusters_with_spoofed_PMUs,Clusters_with_spoofed_angles)
                    println("The cluster $p1 is spoofed with $(mean(p2)) ")
                end

                Idenfied_spoofed_PMUs = vcat([vector for (i, vector) in enumerate(PMUs_cluster) if i != correction_delta_index]...)
                Estimated_spoofed_angles = [vector .- corrction_delta for (i, vector) in enumerate(Cluster_with_values) if i != correction_delta_index]
                Estimated_spoofed_angles = [item for subarray in Estimated_spoofed_angles for item in subarray]

    
                println("Idenfied spoofed PMUs are :", Idenfied_spoofed_PMUs)
                println("Estimated spoofing angels are :", Estimated_spoofed_angles)
    
                ####### Correction algorithm
                Correction_V_estimation_NLS = V_estimation_NLS*exp(deg2rad(corrction_delta)*im)
                Correction_V_estimation_NLS_reach = Correction_V_estimation_NLS[Reach_bus] 
                Position_Idenfied_spoofed_PMUs = findall(x -> x in Idenfied_spoofed_PMUs, P)
    
                Z_correction = Correction_measurment(Position_Idenfied_spoofed_PMUs,Estimated_spoofed_angles,Z_spf)
                Z_correction_meas = vcat(Z_correction...)


                # PA test after correction
                Z_scal_correction = W_inv*Z_correction_meas
                Qm, Rm = qr(H_scal)
                Principal_angle_corre = acosd((norm(inv(Rm')*(H_scal')*Z_scal_correction))/(norm(Z_scal_correction)))
                println("Principal angle aftter correction :", Principal_angle_corre)


                if Principal_angle_corre <= PA_threshold || pa_te == 10

                    Residula_vector_NLS = Z_correction_meas - (H_meas*Correction_V_estimation_NLS_reach)
                    Chi_sq_NLS = 0;
                    for (res,var) in zip(Residula_vector_NLS,W_vect)
                        Chi_up_sq_NLS = (abs.(res))^2/var;
                        Chi_sq_NLS += Chi_up_sq_NLS;
                    end
    
                    NLS_Chi_monte[monte] = Chi_sq_NLS
                    NLS_PA_monte[monte] = Principal_angle_corre
                    NLS_RMSE_abs_monte[monte] = norm(abs.(Z_correction_meas) - abs.(H_meas*Correction_V_estimation_NLS_reach))/sqrt(m)
                    NLS_RMSE_ang_monte[monte] = norm(angle.(Z_correction_meas) - angle.(H_meas*Correction_V_estimation_NLS_reach))/sqrt(m)
                    break
                else
                    Principal_angle = Principal_angle_corre
                    Z_spf = copy(Z_correction)
                    V_pmu = [Z_spf[u][1] for u in Np]
                    tolerance = 1e-6
                    epsi /= 2
                    # digits += 1 
                    # matwrite("V_estimation_NLS.mat", Dict("V_estimation_NLS" => V_estimation_NLS))
                end
    
                
            # end
        end
    
        
    
        
    end


    LSE_PA_mean[ns] = mean(LSE_PA_monte)
    LSE_Chi_mean[ns]  = mean(LSE_Chi_monte)
    LSE_RMSE_abs_mean[ns] = mean(LSE_RMSE_abs_monte) 
    LSE_RMSE_ang_mean[ns] = mean(LSE_RMSE_ang_monte) 

    NLS_PA_mean[ns] = mean(NLS_PA_monte) 
    NLS_Chi_mean[ns] = mean(NLS_Chi_monte) 
    NLS_RMSE_abs_mean[ns] = mean(NLS_RMSE_abs_monte) 
    NLS_RMSE_ang_mean[ns] = mean(NLS_RMSE_ang_monte) 


    LSE_PA[ns] = LSE_PA_monte
    LSE_Chi[ns]  = LSE_Chi_monte
    LSE_RMSE_abs[ns] = LSE_RMSE_abs_monte 
    LSE_RMSE_ang[ns] = LSE_RMSE_ang_monte 

    NLS_PA[ns] = NLS_PA_monte
    NLS_Chi[ns] = NLS_Chi_monte 
    NLS_RMSE_abs[ns] = NLS_RMSE_abs_monte 
    NLS_RMSE_ang[ns] = NLS_RMSE_ang_monte

    
end

println("LSE_PA_mean : ", LSE_PA_mean)
println("LSE_Chi_mean : ", LSE_Chi_mean)
println("LSE_RMSE_abs_mean : ", LSE_RMSE_abs_mean) 
println("LSE_RMSE_ang_mean : ",LSE_RMSE_ang_mean)

println("NLS_PA_mean : ",NLS_PA_mean)
println("NLS_Chi_mean : ",NLS_Chi_mean)
println("NLS_RMSE_abs_mean : ", NLS_RMSE_abs_mean)  
println("NLS_RMSE_ang_mean : ", NLS_RMSE_ang_mean)




dict_data = Dict(
    "Spoofed_PMUs_for_case" => Spoofed_PMUs_for_case,
    "Spoofing_angles_for_case" => Spoofing_angles_for_case,
    "LSE_PA_mean" => LSE_PA_mean,
    "LSE_Chi_mean" => LSE_Chi_mean,
    "LSE_RMSE_abs_mean" => LSE_RMSE_abs_mean,
    "LSE_RMSE_ang_mean" => LSE_RMSE_ang_mean,
    "NLS_PA_mean" => NLS_PA_mean,
    "NLS_Chi_mean" => NLS_Chi_mean,
    "NLS_RMSE_abs_mean" => NLS_RMSE_abs_mean,
    "NLS_RMSE_ang_mean" => NLS_RMSE_ang_mean,
    "LSE_PA" => LSE_PA,
    "LSE_Chi" => LSE_Chi,
    "LSE_RMSE_abs" => LSE_RMSE_abs,
    "LSE_RMSE_ang" => LSE_RMSE_ang,
    "NLS_PA" => NLS_PA,
    "NLS_Chi" => NLS_Chi,
    "NLS_RMSE_abs" => NLS_RMSE_abs,
    "NLS_RMSE_ang" => NLS_RMSE_ang
    )



matwrite("res_$(today_date)_$(Multi_percent)_IEEE_$(Test_system).mat", dict_data)


df = DataFrame(
    "LSE_PA_mean" => LSE_PA_mean,
    "LSE_Chi_mean" => LSE_Chi_mean,
    "LSE_RMSE_abs_mean" => LSE_RMSE_abs_mean,
    "LSE_RMSE_ang_mean" => LSE_RMSE_ang_mean,
    "NLS_PA_mean" => NLS_PA_mean,
    "NLS_Chi_mean" => NLS_Chi_mean,
    "NLS_RMSE_abs_mean" => NLS_RMSE_abs_mean,
    "NLS_RMSE_ang_mean" => NLS_RMSE_ang_mean,
)


XLSX.openxlsx("res_$(today_date)_$(Multi_percent)_IEEE_$(Test_system).xlsx", mode="w") do xf
    sheet = xf[1]
    XLSX.rename!(sheet, "ieee$(Test_system)")
    
    # Write headers
    headers = names(df)
    for (col, header) in enumerate(headers)
        sheet[XLSX.encode_column_number(col) * "1"] = header
    end
    
    # Write data
    for (row, data_row) in enumerate(eachrow(df))
        for (col, value) in enumerate(data_row)
            sheet[XLSX.encode_column_number(col) * string(row + 1)] = value
        end
    end
end



