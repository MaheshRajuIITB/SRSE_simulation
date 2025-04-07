function spoofed_scenarios = fun_20250405_PA_computation_with_counter(PA_matrix,PA_threshold,counter_set)
    spoofed_scenarios = 0;
    for u = 1:size(PA_matrix,2)
        PA = PA_matrix(:,u);
        counter = 0;
         for y = 1:length(PA)
            if PA(y) > PA_threshold
                counter = counter+1;
            elseif counter ~= 0
                counter = counter-1;
            end
            if counter == counter_set
                counter = 0;
                spoofed_scenarios = spoofed_scenarios+counter_set;
            end
        
        end
    end

end