function PA_with_counter = PA_computation_with_counter(PA_matrix,PA_threshold,counter_set)

    PA_with_counter = [];
    
    for u = 1:size(PA_matrix,2)
        PA = PA_matrix(:,u);
        counter = 0;
        PA_ext = [];
        y_ind = [];
        for y = 1:length(PA)
            if PA(y) > PA_threshold
                counter = counter+1;
                % PA_ext = [PA_ext; PA(y)];
                % y_ind = [y_ind y];
            elseif counter ~= 0
                counter = counter-1;
            end
            if counter == 0 & ~isempty(y_ind) | counter ~= 0 & y == length(PA)
                value = min(PA):0.0001:PA_threshold;
                PA(y_ind) = value(randi(length(value)))*ones(length(y_ind),1);
                PA_ext = [];
                y_ind = [];
            end
            if counter == counter_set
                y_ind;
                counter = 0;
                PA_ext = [];
                y_ind = [];
            end
        
        end
    
        PA_with_counter = [PA_with_counter PA];
    end

end