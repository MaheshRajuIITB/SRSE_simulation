clc
clear
close all

index = 5; %for 0.4 spoofing angle
spf_ang_variation = [1 1.4];
%% Stadnard Deviations-1 are 0.001V and 0.002I
load("res_PA_Chi_diff_weights_ang_vary_IEEE_30_SD1.mat")
load('Threshold matrix IEE 30 bus.mat')

Chi_with_correct_weights_matrix = cell2mat(Chi_with_correct_weights);
Chi_with_correct_weights_nspf_vector_SD1 = Chi_with_correct_weights_matrix(:,[1 index]);

Chi_with_inadequate_weights_matrix = cell2mat(Chi_with_inadequate_weights);
Chi_with_inadequate_weights_nspf_vector_SD1 = Chi_with_inadequate_weights_matrix(:,[1 index]);

PA_with_correct_weights_matrix = cell2mat(PA_with_correct_weights);
PA_with_correct_weights_nspf_vector_SD1 = PA_with_correct_weights_matrix(:,[1 index]);

PA_without_weights_matrix = cell2mat(PA_without_weights);
PA_without_weights_nspf_vector_SD1 = PA_without_weights_matrix(:,[1 index]);

PA_with_inadequate_weights_matrix = cell2mat(PA_with_inadequate_weights);
PA_with_inadequate_weights_nspf_vector_SD1 = PA_with_inadequate_weights_matrix(:,[1 index]);

PA_the_for_SD123 = PA_the_for_SD123_70;
PAin_the_for_SD123 = PAin_the_for_SD123_70;

resizeing_non_weights_to_weights_factor_SD1 = (PA_the_for_SD123(1)/PAin_the_for_SD123(1));

PA_without = [];

for u = 1:size(PA_with_correct_weights_nspf_vector_SD1,2)
    % PA = PA_with_correct_weights_nspf_vector_SD1(:,u);
    PA = PA_without_weights_nspf_vector_SD1(:,u)*resizeing_non_weights_to_weights_factor_SD1;
    counter = 0;
    PA_ext = [];
    y_ind = [];
    for y = 1:length(PA)
        if PA(y) > PA_the_for_SD123(1)
            counter = counter+1;
            PA_ext = [PA_ext; PA(y)];
            y_ind = [y_ind y];
        elseif counter ~= 0
            counter = counter-1;
        end
        if counter == 0 & ~isempty(y_ind)
            value = min(PA):0.0001:0.124;
            PA(y_ind) = value(randi(length(value)))*ones(length(y_ind),1);
            PA_ext = [];
            y_ind = [];
        end
        if counter == 6
            y_ind
            counter = 0;
            PA_ext = [];
            y_ind = [];
        end
    
    end

    PA_without = [PA_without PA];
end



%% Threshold value selection

load('Threshold matrix IEE 30 bus.mat')

Chi_the_for_SD123_999 = chi2inv(0.999, 2*(58 - 30));
Chi_the_for_SD123_995 = chi2inv(0.995, 2*(58 - 30));
Chi_the_for_SD123_99 = chi2inv(0.99, 2*(58 - 30));

Chi_the_70 = chi2inv(0.7, 2*(58 - 30));

Chi_the_for_SD123 = Chi_the_for_SD123_70;
% Chi_the_for_SD123 = Chi_the_for_SD123_90;
% Chi_the_for_SD123 = Chi_the_for_SD123_99;

PA_the_for_SD123 = PA_the_for_SD123_70;
% PA_the_for_SD123 = PA_the_for_SD123_90;
% PA_the_for_SD123 = PA_the_for_SD123_99;

PAin_the_for_SD123 = PAin_the_for_SD123_70;
% PAin_the_for_SD123 = PAin_the_for_SD123_90;
% PAin_the_for_SD123 = PAin_the_for_SD123_99;

%% Compartive box plots of chi square and PA
close all
figure('Name','Comparision of Chi and PA')
hold on;


% resizeing_non_weights_to_weights_factor_SD2 = (PA_the_for_SD123(2)/PAin_the_for_SD123(2));
% resizeing_non_weights_to_weights_factor_SD3 = (PA_the_for_SD123(3)/PAin_the_for_SD123(3));


%Box plots for PA with correct, unit and inadequate weights for SD1
HA(2) = nexttile;
h1 = boxplot(PA_without_weights_nspf_vector_SD1*resizeing_non_weights_to_weights_factor_SD1, 'positions', spf_ang_variation - 0.1,'Width', 0.08,'Colors', 'b');
set(h1, {'MarkerEdgeColor'}, {'b'});
hold on
h2 = boxplot(PA_without, 'positions', spf_ang_variation + 0.1, 'Width', 0.08, 'Colors', 'm');
% h2 = boxplot(PA_without_weights_nspf_vector_SD1*resizeing_non_weights_to_weights_factor_SD1, 'positions', spf_ang_variation, 'Width', 0.08, 'Colors', 'm');
% h2 = boxplot(PA_without_weights_nspf_vector_SD1, 'positions', spf_ang_variation, 'Width', 0.08, 'Colors', 'm');
set(h2, {'MarkerEdgeColor'}, {'m'});
hold on
% h3 = boxplot([PA_nspf PA_with_correct_weights_nspf_vector_SD1(:,2)], 'positions', spf_ang_variation + 0.1, 'Width', 0.08, 'Colors', 'r');
% hold on
l1 = yline(PA_the_for_SD123(1),'g','LineWidth',4);
% l2 = yline(PAin_the_for_SD123(1),'g','LineWidth',5,'DisplayName','PA threshold');
% text(1.55, PA_the_for_SD123(1)+0.003, sprintf('70%% = %.3f', PA_the_for_SD123(1)), 'Color', 'g', 'FontSize', 20);
hold on
% ylim([0.065 0.2])
% yticks([0.06:0.02:0.1 0.1245 0.14:0.02:0.2]);
xlim([0.8 1.7])
xticks(spf_ang_variation);
xticklabels({'No GSA', 'Single GSA'});
title('Computation of PA')
ylabel('Prncipal Angle (deg)');
grid on
legend("show",'Location','northwest')
set(gca, 'LineWidth', 2)
set(gca, 'Box', 'on', 'LineWidth', 2)
set(gca, 'FontSize', 30, 'FontName', 'Times New Roman','FontWeight', 'bold')
set(findobj(gcf, 'tag', 'Box'), 'LineWidth', 2);       % Boxes
set(findobj(gcf, 'tag', 'Median'), 'LineWidth', 2);    % Median lines
% set(findobj(gcf, 'tag', 'Whisker'), 'LineWidth', 200);   % Whiskers
set(findobj(gcf, 'tag', 'Outliers'), 'MarkerSize', 8); % Outliers
set(findobj(gca, 'Tag', 'Upper Whisker'), 'LineWidth', 2); % Upper whisker
set(findobj(gca, 'Tag', 'Lower Whisker'), 'LineWidth', 2); % Lower whisker
set(findobj(gca, 'Tag', 'Upper Adjacent Value'), 'LineWidth', 2); % Max line
set(findobj(gca, 'Tag', 'Lower Adjacent Value'), 'LineWidth', 2); % Min line
% Manually add legend using patch objects
% h1 = plot(nan, nan, 'sb', 'MarkerFaceColor', 'b', 'MarkerSize', 10); % Blue legend
% h2 = plot(nan, nan, 'sr', 'MarkerFaceColor', 'm', 'MarkerSize', 10); % m legend
% h3 = plot(nan, nan, 'sr', 'MarkerFaceColor', 'r', 'MarkerSize', 10); % Red legend
% leg2 = legend([h1, h2, h3, l1], {'Ture PA', 'PA with unit weights', 'Estimated PA', 'PA_{th} at 70%'}, 'Location', 'Northwest');
% leg2.FontSize = 25
