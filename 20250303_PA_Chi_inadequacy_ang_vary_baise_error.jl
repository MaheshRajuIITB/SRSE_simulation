using MAT,LinearAlgebra, Statistics, Plots, Clustering, Distributions, Dates, DataFrames, XLSX

include("fun_20250115_SRSE_functions.jl")
today_date = Dates.format(today(), "yyyymmdd")


Test_system = 30

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

elseif Test_system == 118

    ##### Data of IEEE - 118bus system #####
    data = matread("data_20250104_IEEE_118bus.mat")
    P = [1, 3, 4, 5, 6, 8, 9, 11, 12, 15, 17, 19, 21, 23, 25, 26, 28, 30, 34, 35, 37, 40, 43, 45, 46, 49, 52, 54, 56, 59, 62, 63, 65, 68, 70, 71, 75, 76, 77, 78, 80, 83, 85, 86, 89, 90, 92, 94, 96, 100, 105, 108, 110, 114];
    PA_threshold = 0.1028
    no_of_spoofed_PMUs = [0 5 11 16 22 27 32 38 43 49 53 54] #for 118 bus system
    
else
    println("Type the test system number with in 14, 30 and 118")
end

println("Simulatino of IEEE $(Test_system) system")

All_bus_measurements = data["z"]; H = data["H"]; Fb = Int.(data["Fb"]); Tb = Int.(data["Tb"]); R = data["R"]; X = data["X"]; b = data["b"]; Nb = Int.(data["Nb"]); Nl = Int.(data["Nl"]); V_true = data["V_true"]
####  Calculate impedance and admittance
z = R + im*X; Y = 1 ./ z; G = real(Y); B2 = imag(Y); B1 = imag(Y + b)
Np = 1:length(P)

Flow_indices = Array{Vector{Int64}}(undef, length(P), 2)
for pmu in 1:length(P)
    From_end_indices = []
    To_end_indices = []
    From_end = findall(x -> x == P[pmu], Fb)
    Flow_indices[pmu,1] = [I[1] for I in From_end]
    To_end = findall(x -> x == P[pmu], Tb)
    Flow_indices[pmu,2]  = [I[1] for I in To_end]
    Flow_indices
end


Z = All_bus_measurements[P]
H_pmu = H[P]
W_pmu = []


#####^^^^ Standard deviations ^^^######
StandardDeviation_V = 0.001
StandardDeviation_I = 0.002

#####^^^^ Initialize variance matrix ^^^#####
StandardDeviation_matrix = []
for z_entry in Z
    sd = [StandardDeviation_V; fill(StandardDeviation_I, size(z_entry, 1) - 1)]
    push!(StandardDeviation_matrix, sd)
    [push!(W_pmu, sd.^2)]
end


H_meas = vcat(H_pmu...)
W_vect = vcat(W_pmu...)
W = Diagonal(W_vect)
Wanna_add_noise = "yes"

# MCF = -0.11/100;
# MCF = collect(-0.06:0.001:0.22)/100
# # MCF = collect(-1:0.001:1)/100
# # PACF = -0.01
# PACF = collect(-0.018:0.001:0.014)
# # PACF = collect(-1:0.001:1)
# # Baise_error = 0.998899 - (1im*1.74e-4)

# ####^^^^^^ Adding the Baise Error ^^^^^^######
# # Z_pmu = copy(Z)

# # # Z_pmu = [Baise_error*(Z[u]) for u in Np]

# for u in rand(Np,3)
#     # Baise_error = 1
#     Baise_error = (1-rand(MCF))*(cis(deg2rad(rand(PACF))))
#     println("Baise error : ", Baise_error)
#     global Z[u] = ((Z[u]).*Baise_error)
# end

MCF =[0.95 1.02 0.97]
PACF = [-1 -0.5 -1.2]
No_of_PMUS_are_having_high_baise_error = 3
PMUs_CVT_error = sample(1:length(P),No_of_PMUS_are_having_high_baise_error,replace=false)
# PMUs_CVT_error = [5]
Baise_error = [(1/MCF[o])*(cis(deg2rad(PACF[o]))) for o in 1:length(MCF)]



for u in 1:length(PMUs_CVT_error)
    global Z[PMUs_CVT_error[u]][1] = ((Z[PMUs_CVT_error[u]][1])*Baise_error[u])
end

no_of_cases = 1 # for multiple cases
monte_simulation = 1000

# Spoofed_pmu_positions = [3 10 15 19 24 28 31 35 45 50] #only for IEEE 118 bus system

Spoofed_pmu_positions = 1:length(P)
# Spf_angle = collect(-1:0.05:1)
# Spf_angle = 0*ones(length(P))
# Spf_angle = collect(0:0.1:1)
Spf_angle = collect(0:1:10)
Spf_var_length = length(Spf_angle)
# Spf_angle = -1 # for fixed angle




weig = collect(0.1:0.1:2)
# weig = collect(1:2)
# weig = collect(0.1:0.1:0.9)


Spoofed_PMUs_for_case = Array{Vector{Float64}}(undef,no_of_cases,Spf_var_length)
Spoofing_angles_for_case = Array{Vector{Float64}}(undef,no_of_cases,Spf_var_length)



PA_with_correct_weights_mean = zeros(Float32, no_of_cases,Spf_var_length)
PA_with_inadequate_weights_mean = zeros(Float32, no_of_cases,Spf_var_length)
PA_without_weights_mean = zeros(Float32, no_of_cases, Spf_var_length)

Chi_with_correct_weights_mean = zeros(Float32, no_of_cases, Spf_var_length)
Chi_with_inadequate_weights_mean = zeros(Float32, no_of_cases, Spf_var_length)
Chi_without_weights_mean = zeros(Float32, no_of_cases, Spf_var_length)


PA_with_correct_weights = Array{Vector{Float64}}(undef,no_of_cases,Spf_var_length)
PA_with_inadequate_weights = Array{Vector{Float64}}(undef,no_of_cases,Spf_var_length)
PA_without_weights =Array{Vector{Float64}}(undef,no_of_cases,Spf_var_length)

Chi_with_correct_weights = Array{Vector{Float64}}(undef,no_of_cases,Spf_var_length)
Chi_with_inadequate_weights = Array{Vector{Float64}}(undef,no_of_cases,Spf_var_length)
Chi_without_weights = Array{Vector{Float64}}(undef,no_of_cases,Spf_var_length)


# Monte_result = Array{Array{Vector{Float64}}}(undef, 8, 1)
for spf_var in 1:Spf_var_length
    for nsd in 1:1

        ns = 1;
        # Position_Spoofed_PMUs = []
        Position_Spoofed_PMUs = sample(1:length(P),nsd,replace=false)
        Spoofed_PMUs_for_case[ns,spf_var] = P[Position_Spoofed_PMUs]
        println("Spoofed PMU:", P[Position_Spoofed_PMUs])  
        
        Spoofing_angles = Spf_angle[spf_var]
        Spoofing_angles_for_case[ns,spf_var] = [Spoofing_angles]
        println("Spoofed Angle:", Spoofing_angles)


        PA_with_correct_weights_monte = zeros(Float32, monte_simulation)
        PA_with_inadequate_weights_monte = zeros(Float32, monte_simulation)
        PA_without_weights_monte = zeros(Float32, monte_simulation)

        Chi_with_correct_weights_monte  = zeros(Float32, monte_simulation)
        Chi_with_adequate_weights_monte  = zeros(Float32, monte_simulation)
        Chi_without_weights_monte  = zeros(Float32, monte_simulation)


        
        for monte in 1:monte_simulation
            println(monte)
            
            if Wanna_add_noise == "yes"
               Z_pmu = [(Z[u]) + StandardDeviation_matrix[u] .*(randn(ComplexF64, size(Z[u])) + 1im * randn(ComplexF64, size(Z[u]))) for u in Np]
               W_inad = [W_pmu[u].*rand(weig) for u in Np]
            else
                Z_pmu = [Z[u] for u in Np]
            end

            W_inv = W^(-1/2)
            W_inv_sd = inv(W)
            H_scal = W_inv*H_meas  
            
            Z_spf = Spoofed_measurement_vector(Position_Spoofed_PMUs,Spoofing_angles,Z_pmu)
            V_pmu = [Z_spf[u][1] for u in Np]
            Z_meas = vcat(Z_spf...)
            m = length(Z_meas) # no of measurements
            Z_scal = W_inv*Z_meas

            W_inad_vect = vcat(W_inad...)
            Winad = Diagonal(W_inad_vect)
            W_inv_sd_inad = inv(Winad)
            W_inv_inad = Winad^(-1/2)

            H_scal_inad = W_inv_inad*H_meas
            Z_scal_inad = W_inv_inad*Z_meas

        
            ########^^^^^^^^^^PA test with correct weights ^^^^^^^^^^^######
            Qm, Rm = qr(H_scal)
            Principal_angle = acosd((norm(inv(Rm')*(H_scal')*Z_scal))/(norm(Z_scal)))
            PA_with_correct_weights_monte[monte] = Principal_angle
            println("Principal angle with correct weights :", Principal_angle)

            ########^^^^^^^^^^PA test with inadequate weights ^^^^^^^^^^^######
            Qm1, Rm1 = qr(H_scal_inad)
            Principal_angle1 = acosd((norm(inv(Rm1')*(H_scal_inad')*Z_scal_inad))/(norm(Z_scal_inad)))
            PA_with_inadequate_weights_monte[monte] = Principal_angle1
            println("Principal angle with inadequate weights :", Principal_angle1)

            ########^^^^^^^^^^PA without weights ^^^^^^^^^^^^^^######
            Qm2, Rm2 = qr(H_meas)
            Principal_angle2 = acosd((norm(inv(Rm2')*(H_meas')*Z_meas))/(norm(Z_meas)))
            PA_without_weights_monte[monte] = Principal_angle2
            println("Principal angle without weights:", Principal_angle2)
            

            ##### Linear State Estimation with correct weights
            # println("The weight matrix : \n", W_vect)
            V_estimation = H_scal \ Z_scal
            Residula_vector = Z_meas - (H_meas*V_estimation)

            ########^^^^^^^^^^Chi squre with correct weights^^^^^^^^^^############## 
            Chi_with_correct_weights_monte[monte] = abs.(((Residula_vector')*W_inv_sd*Residula_vector)[1,1])
            println("Chi square with correct weights : ", Chi_with_correct_weights_monte[monte])


            ##### Linear State Estimation with inadequate weights
            # println("The inadequate weight matrix :\n", W_inad_vect)
            V_estimation_inad = H_scal_inad \ Z_scal_inad
            Residula_vector_inad = Z_meas - (H_meas*V_estimation_inad)

            ########^^^^^^^^^^Chi squre with inadequate weights^^^^^^^^^^^##########
            Chi_with_adequate_weights_monte[monte] = abs.(((Residula_vector_inad')*W_inv_sd_inad*Residula_vector_inad)[1,1])
            println("Chi square with inadequate weights : ", abs.(((Residula_vector_inad')*W_inv_sd_inad*Residula_vector_inad)[1,1]))

            # Linear State Estimation with inadequate weights
            V_estimation_meas = H_meas \ Z_meas
            Residula_vector_meas = Z_meas - (H_meas*V_estimation_meas)

            ########^^^^^^^^^^Chi squre without weights^^^^^^^^^^^^^######
            Chi_without_weights_monte[monte] = abs.(((Residula_vector_meas')*Residula_vector_meas)[1,1])
            println("Chi square without weights : ", Chi_without_weights_monte[monte])


            
        end


        PA_with_correct_weights_mean[ns,spf_var] = mean(PA_with_correct_weights_monte)
        PA_with_inadequate_weights_mean[ns,spf_var] = mean(PA_with_inadequate_weights_monte)
        PA_without_weights_mean[ns,spf_var] = mean(PA_without_weights_monte)

        Chi_with_correct_weights_mean[ns,spf_var]  = mean(Chi_with_correct_weights_monte)
        Chi_with_inadequate_weights_mean[ns,spf_var]  = mean(Chi_with_adequate_weights_monte)
        Chi_without_weights_mean[ns,spf_var]  = mean(Chi_without_weights_monte)


        PA_with_correct_weights[ns,spf_var] = PA_with_correct_weights_monte
        PA_with_inadequate_weights[ns,spf_var] = PA_with_inadequate_weights_monte
        PA_without_weights[ns,spf_var] =  PA_without_weights_monte

        Chi_with_correct_weights[ns,spf_var] = Chi_with_correct_weights_monte
        Chi_with_inadequate_weights[ns,spf_var] = Chi_with_adequate_weights_monte
        Chi_without_weights[ns,spf_var] = Chi_without_weights_monte
        


        
    end

end





dict_data = Dict(
    "Spoofed_PMUs_for_case" => Spoofed_PMUs_for_case,
    "Spoofing_angles_for_case" => Spoofing_angles_for_case,

    "PA_with_correct_weights_mean" => PA_with_correct_weights_mean,
    "PA_with_inadequate_weights_mean" => PA_with_inadequate_weights_mean,
    "PA_without_weights_mean" => PA_without_weights_mean,

    "Chi_with_correct_weights_mean" => Chi_with_correct_weights_mean,
    "Chi_with_inadequate_weights_mean" => Chi_with_inadequate_weights_mean,
    "Chi_without_weights_mean" => Chi_without_weights_mean,

    "PA_with_correct_weights" => PA_with_correct_weights,
    "PA_with_inadequate_weights" => PA_with_inadequate_weights,
    "PA_without_weights" =>  PA_without_weights,

    "Chi_with_correct_weights" => Chi_with_correct_weights,
    "Chi_with_inadequate_weights" => Chi_with_inadequate_weights,
    "Chi_without_weights" => Chi_without_weights

    )
# matwrite("res_$(today_date)_PA_Chi_inadequate_weights_ang_vary_IEEE_$(Test_system).mat", dict_data)
matwrite("PA_Chi_inadequate_weights_baise_error.mat", dict_data)
