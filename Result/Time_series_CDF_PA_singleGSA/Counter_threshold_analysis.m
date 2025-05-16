clc; clear all; close all;

load('res_20250405_no_GSA_IEEE_30.mat')
LSE_PA_nspf = LSE_PA;
NLS_PA_nspf = NLS_PA;


false_postives_after_counter_no_GSA = zeros(6,5)
false_negative_after_counter_single_GSA = zeros(6,5)

p = 1;
for o = 1:5
    if o == 1
        load('res_20250405_Single_GSA_IEEE_30_with_0.6deg.mat')
    elseif o == 2 
        load('res_20250405_Single_GSA_IEEE_30_with_0.7deg.mat')
    elseif o == 3 
        load('res_20250405_Single_GSA_IEEE_30_with_0.8deg.mat')
    elseif o == 4 
        load('res_20250405_Single_GSA_IEEE_30_with_0.9deg.mat')
    elseif o == 5 
        load('res_20250405_Single_GSA_IEEE_30_with_1deg.mat')
    end
    for u = 1:3
        if u == 1
            PA_threshold = 0.1249;
        elseif u==2
            PA_threshold = 0.133544832;
        else
            PA_threshold = 0.144324;
        end
        for counter_set = 4:6
            false_postives_after_counter_no_GSA(p,o) = (fun_20250405_PA_computation_with_counter(LSE_PA_nspf,PA_threshold,counter_set))/100
            f = fun_20250405_PA_computation_with_counter(LSE_PA,PA_threshold,counter_set);
            false_negative_after_counter_single_GSA(p,o) = (1000 - f)/100
            p = p+1;
        end

    end
    p = 1;

end
x = 0.6:0.1:1;

for q = 1:6
    plot(x,false_postives_after_counter_no_GSA(q,:))
    hold on
end

for q = 1:6
    plot(x,false_postives_after_counter_no_GSA(q,:))
    hold on
end

return

%% Computation of PA for non-spoofed, spoofed and correction scenarios

false_postives = sum(LSE_PA_nspf > PA_threshold)
false_negative =  sum(LSE_PA < PA_threshold)
false_postives_after_correction = sum(NLS_PA > PA_threshold)

false_postives_after_counter_no_GSA = fun_20250405_PA_computation_with_counter(LSE_PA_nspf,PA_threshold,counter_set)
% NLS_PA_nspf_spoofed_instants = fun_20250405_PA_computation_with_counter(NLS_PA_nspf,PA_threshold,counter_set)
false_negative_after_counter_single_GSA = fun_20250405_PA_computation_with_counter(LSE_PA,PA_threshold,counter_set);
false_negative_after_counter_single_GSA = 1000 - false_negative_after_counter_single_GSA
false_postives_after_counter_correction = fun_20250405_PA_computation_with_counter(NLS_PA,PA_threshold,counter_set)
