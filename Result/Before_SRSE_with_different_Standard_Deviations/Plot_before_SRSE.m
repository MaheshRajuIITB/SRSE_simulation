clc
clear
close all

system = 30
% input('Enter the test system (30 or 118) :')
% Spoofing_angle = 0.4; %can choose from 0:0.1:10
% index = find(Spoofing_angle == 0:0.1:10);
index = 5;
% index = 9; %for 0.8 is the spoofing angle
% index = 16; %for 1.5 is the spoofing angle

spf_ang_variation = [1 1.4]

if system == 30
    %% Threshold values for IEEE 30 bus system
    load('Threshold matrix IEE 30 bus.mat')

    Chi_the_for_SD123_999 = chi2inv(0.999, 2*(58 - 30))
    Chi_the_for_SD123_995 = chi2inv(0.995, 2*(58 - 30))
    Chi_the_for_SD123_99 = chi2inv(0.99, 2*(58 - 30))

    Chi_the_70 = chi2inv(0.7, 2*(58 - 30))
    %% Stadnard Deviations-1 are 0.001V and 0.002I
    load("res_PA_Chi_diff_weights_ang_vary_IEEE_30_SD1.mat")
        
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
    
    %% Stadnard Deviations-2 are 0.005V and 0.01I
    load("res_PA_Chi_diff_weights_ang_vary_IEEE_30_SD2.mat")
    
    Chi_with_correct_weights_matrix = cell2mat(Chi_with_correct_weights);
    Chi_with_correct_weights_nspf_vector_SD2 = Chi_with_correct_weights_matrix(:,[1 index]);

    Chi_with_inadequate_weights_matrix = cell2mat(Chi_with_inadequate_weights);
    Chi_with_inadequate_weights_nspf_vector_SD2 = Chi_with_inadequate_weights_matrix(:,[1 index]);
    
    PA_with_correct_weights_matrix = cell2mat(PA_with_correct_weights);
    PA_with_correct_weights_nspf_vector_SD2 = PA_with_correct_weights_matrix(:,[1 index]);
    
    PA_without_weights_matrix = cell2mat(PA_without_weights);
    PA_without_weights_nspf_vector_SD2 = PA_without_weights_matrix(:,[1 index]);
    
    PA_with_inadequate_weights_matrix = cell2mat(PA_with_inadequate_weights);
    PA_with_inadequate_weights_nspf_vector_SD2 = PA_with_inadequate_weights_matrix(:,[1 index]);

    %% Stadnard Deviations-3 are 0.01V and 0.02I
    load("res_PA_Chi_diff_weights_ang_vary_IEEE_30_SD3.mat")

    Chi_with_correct_weights_matrix = cell2mat(Chi_with_correct_weights);
    Chi_with_correct_weights_nspf_vector_SD3 = Chi_with_correct_weights_matrix(:,[1 index]);

    Chi_with_inadequate_weights_matrix = cell2mat(Chi_with_inadequate_weights);
    Chi_with_inadequate_weights_nspf_vector_SD3 = Chi_with_inadequate_weights_matrix(:,[1 index]);
    
    PA_with_correct_weights_matrix = cell2mat(PA_with_correct_weights);
    PA_with_correct_weights_nspf_vector_SD3 = PA_with_correct_weights_matrix(:,[1 index]);
    
    PA_without_weights_matrix = cell2mat(PA_without_weights);
    PA_without_weights_nspf_vector_SD3 = PA_without_weights_matrix(:,[1 index]);
    
    PA_with_inadequate_weights_matrix = cell2mat(PA_with_inadequate_weights);
    PA_with_inadequate_weights_nspf_vector_SD3 = PA_with_inadequate_weights_matrix(:,[1 index]);

else
    %% Threshold values for IEEE 30 bus system
    load('Threshold matrix IEE 118 bus.mat')

    %% Stadnard Deviations-1 are 0.001V and 0.002I

    load("res_PA_Chi_diff_weights_ang_vary_IEEE_118_SD1.mat")
    
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


    %% Stadnard Deviations-2 are 0.005V and 0.01I

    load("res_PA_Chi_diff_weights_ang_vary_IEEE_118_SD2.mat")
    
    Chi_with_correct_weights_matrix = cell2mat(Chi_with_correct_weights);
    Chi_with_correct_weights_nspf_vector_SD2 = Chi_with_correct_weights_matrix(:,[1 index]);

    Chi_with_inadequate_weights_matrix = cell2mat(Chi_with_inadequate_weights);
    Chi_with_inadequate_weights_nspf_vector_SD2 = Chi_with_inadequate_weights_matrix(:,[1 index]);
    
    PA_with_correct_weights_matrix = cell2mat(PA_with_correct_weights);
    PA_with_correct_weights_nspf_vector_SD2 = PA_with_correct_weights_matrix(:,[1 index]);
    
    PA_without_weights_matrix = cell2mat(PA_without_weights);
    PA_without_weights_nspf_vector_SD2 = PA_without_weights_matrix(:,[1 index]);
    
    PA_with_inadequate_weights_matrix = cell2mat(PA_with_inadequate_weights);
    PA_with_inadequate_weights_nspf_vector_SD2 = PA_with_inadequate_weights_matrix(:,[1 index]);


    %% Stadnard Deviations-3 are 0.01V and 0.02I
    
    load("res_PA_Chi_diff_weights_ang_vary_IEEE_118_SD3.mat")
    
    Chi_with_correct_weights_matrix = cell2mat(Chi_with_correct_weights);
    Chi_with_correct_weights_nspf_vector_SD3 = Chi_with_correct_weights_matrix(:,[1 index]);

    Chi_with_inadequate_weights_matrix = cell2mat(Chi_with_inadequate_weights);
    Chi_with_inadequate_weights_nspf_vector_SD3 = Chi_with_inadequate_weights_matrix(:,[1 index]);
    
    PA_with_correct_weights_matrix = cell2mat(PA_with_correct_weights);
    PA_with_correct_weights_nspf_vector_SD3 = PA_with_correct_weights_matrix(:,[1 index]);
    
    PA_without_weights_matrix = cell2mat(PA_without_weights);
    PA_without_weights_nspf_vector_SD3 = PA_without_weights_matrix(:,[1 index]);
    
    PA_with_inadequate_weights_matrix = cell2mat(PA_with_inadequate_weights);
    PA_with_inadequate_weights_nspf_vector_SD3 = PA_with_inadequate_weights_matrix(:,[1 index]);

end

%% Threshold value selection

Chi_the_for_SD123 = Chi_the_for_SD123_70;
% Chi_the_for_SD123 = Chi_the_for_SD123_90;
% Chi_the_for_SD123 = Chi_the_for_SD123_99;

PA_the_for_SD123 = PA_the_for_SD123_70;
% PA_the_for_SD123 = PA_the_for_SD123_90;
% PA_the_for_SD123 = PA_the_for_SD123_99;

PAin_the_for_SD123 = PAin_the_for_SD123_70;
% PAin_the_for_SD123 = PAin_the_for_SD123_90;
% PAin_the_for_SD123 = PAin_the_for_SD123_99;

%% Chi with 3-different standard deviations (with correct and inadequate weights)

figure('Name','True and Estimated Chi square')
hold on;


t = tiledlayout(1,3,'TileSpacing','compact');

%Box plots for chi with correct and inadequate weights for SD1
HA(1) = nexttile;
h1 = boxplot(Chi_with_correct_weights_nspf_vector_SD1, 'positions', spf_ang_variation - 0.045,'Width', 0.08,'Colors', 'b');
set(h1, {'MarkerEdgeColor'}, {'b'});
hold on
h2 = boxplot(Chi_with_inadequate_weights_nspf_vector_SD1, 'positions', spf_ang_variation + 0.045, 'Width', 0.08, 'Colors', 'r');
ylabel('\chi^2 Value');
l1 = yline(Chi_the_70,'g','LineWidth',5,'DisplayName','\chi^2 threshold')
text(1.1, Chi_the_for_SD123_999+80, sprintf('70%% = %.3f', Chi_the_70), 'Color', 'g', 'FontSize', 20);
yline(Chi_the_for_SD123_999,'c','LineWidth',5,'DisplayName','\chi^2 threshold')
text(1.1, Chi_the_for_SD123_999+100, sprintf('99.9%% = %.3f', Chi_the_for_SD123_999), 'Color', 'c', 'FontSize', 20);
% Manually add legend using patch objects
h1 = plot(nan, nan, 'sb', 'MarkerFaceColor', 'b', 'MarkerSize', 10); % Blue legend
h2 = plot(nan, nan, 'sr', 'MarkerFaceColor', 'r', 'MarkerSize', 10); % Red legend
legend([h1, h2, l1], {'Ture \chi^2', 'Estimated \chi^2', 'Threshold values of \chi^2'}, 'Location', 'Northwest');
title('Chi for 0.001V & 0.002I')
xlim([0.8 1.7])
xticks(spf_ang_variation);
xticklabels({'nspf', 'spf'});
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


%Box plots for chi with correct and inadequate weights for SD2
HA(2) = nexttile;
h1 = boxplot(Chi_with_correct_weights_nspf_vector_SD2, 'positions', spf_ang_variation - 0.045,'Width', 0.08,'Colors', 'b');
hold on
h2 = boxplot(Chi_with_inadequate_weights_nspf_vector_SD2, 'positions', spf_ang_variation + 0.045, 'Width', 0.08, 'Colors', 'r');
hold on
l2 = yline(Chi_the_70,'g','LineWidth',5,'DisplayName','\chi^2 threshold')
text(1.1, Chi_the_for_SD123_995+80, sprintf('70%% = %.3f', Chi_the_70), 'Color', 'g', 'FontSize', 20);
yline(Chi_the_for_SD123_995,'c','LineWidth',5,'DisplayName','\chi^2 threshold')
text(1.1, Chi_the_for_SD123_995+100, sprintf('99.5%% = %.3f', Chi_the_for_SD123_995), 'Color', 'c', 'FontSize', 20);
set(h1, {'MarkerEdgeColor'}, {'b'});
title('Chi for 0.005V & 0.01I')
hold on
xlim([0.8 1.7])
xticks(spf_ang_variation);
xticklabels({'nspf', 'spf'});
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


%Box plots for chi with correct and inadequate weights for SD3
HA(3) = nexttile;
h1 = boxplot(Chi_with_correct_weights_nspf_vector_SD3, 'positions', spf_ang_variation - 0.045,'Width', 0.08,'Colors', 'b');
hold on
h2 = boxplot(Chi_with_inadequate_weights_nspf_vector_SD3, 'positions', spf_ang_variation + 0.045, 'Width', 0.08, 'Colors', 'r');
hold on
l2 = yline(Chi_the_70,'g','LineWidth',5,'DisplayName','\chi^2 threshold')
text(1.1, Chi_the_for_SD123_99+80, sprintf('70%% = %.3f', Chi_the_70), 'Color', 'g', 'FontSize', 20);
yline(Chi_the_for_SD123_99,'c','LineWidth',5,'DisplayName','\chi^2 threshold')
text(1.1, Chi_the_for_SD123_99+100, sprintf('99%% = %.3f', Chi_the_for_SD123_99), 'Color', 'c', 'FontSize', 20);
set(h1, {'MarkerEdgeColor'}, {'b'});
xlim([0.8 1.7])
xticks(spf_ang_variation);
title('Chi for 0.01V & 0.02I')
xticklabels({'nspf', 'spf'});
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





%% PA with 3-different standard deviations (with correct, unit and inadequate weights)

figure('Name','PA with 3-different standard deviations (with correct, unit and inadequate weights)')
hold on;


resizeing_non_weights_to_weights_factor_SD1 = (PA_the_for_SD123(1)/PAin_the_for_SD123(1));
resizeing_non_weights_to_weights_factor_SD2 = (PA_the_for_SD123(2)/PAin_the_for_SD123(2));
resizeing_non_weights_to_weights_factor_SD3 = (PA_the_for_SD123(3)/PAin_the_for_SD123(3));

t = tiledlayout(1,3,'TileSpacing','compact');

%Box plots for PA with correct, unit and inadequate weights for SD1
HA(1) = nexttile;
h1 = boxplot(PA_with_correct_weights_nspf_vector_SD1, 'positions', spf_ang_variation - 0.1,'Width', 0.08,'Colors', 'b');
hold on
h2 = boxplot(PA_without_weights_nspf_vector_SD1*resizeing_non_weights_to_weights_factor_SD1, 'positions', spf_ang_variation, 'Width', 0.08, 'Colors', 'm');
hold on
h3 = boxplot(PA_with_inadequate_weights_nspf_vector_SD1, 'positions', spf_ang_variation + 0.1, 'Width', 0.08, 'Colors', 'r');
hold on
ylabel('Prncipal Angle (deg)');
l1 = yline(PA_the_for_SD123(1),'g','LineWidth',5,'DisplayName','PA threshold');
text(1.35, 0.069, sprintf('70%% = %.3f', PA_the_for_SD123(1)), 'Color', 'g', 'FontSize', 20);
set(h1, {'MarkerEdgeColor'}, {'b'});
set(h2, {'MarkerEdgeColor'}, {'m'});
title('PA for 0.001V & 0.002I')
hold on
xlim([0.8 1.7])
xticks(spf_ang_variation);
xticklabels({'nspf', 'spf'});
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
h1 = plot(nan, nan, 'sb', 'MarkerFaceColor', 'b', 'MarkerSize', 10); % Blue legend
h3 = plot(nan, nan, 'sr', 'MarkerFaceColor', 'r', 'MarkerSize', 10); % Red legend
h2 = plot(nan, nan, 'sr', 'MarkerFaceColor', 'm', 'MarkerSize', 10); % Red legend
legend([h1, h3, h2, l1], {'Ture PA', 'PA with unit weights', 'Estimated PA', 'Threshold values of PA'}, 'Location', 'Northwest');




%Box plots for PA with correct, unit and inadequate weights for SD2
HA(2) = nexttile;
h1 = boxplot(PA_with_correct_weights_nspf_vector_SD2, 'positions', spf_ang_variation - 0.1,'Width', 0.08,'Colors', 'b');
hold on
h2 = boxplot(PA_without_weights_nspf_vector_SD2*resizeing_non_weights_to_weights_factor_SD2, 'positions', spf_ang_variation, 'Width', 0.08, 'Colors', 'm');
hold on
h3 = boxplot(PA_with_inadequate_weights_nspf_vector_SD2, 'positions', spf_ang_variation + 0.1, 'Width', 0.08, 'Colors', 'r');
hold on
hold on
ylabel('Prncipal Angle (deg)');
l2 = yline(PA_the_for_SD123(2),'g','LineWidth',5,'DisplayName','PA threshold')
text(1.35, 0.32, sprintf('70%% = %.3f', PA_the_for_SD123(2)), 'Color', 'g', 'FontSize', 20);
set(h1, {'MarkerEdgeColor'}, {'b'});
set(h2, {'MarkerEdgeColor'}, {'m'});
title('PA for 0.005V & 0.01I')
hold on
xlim([0.8 1.7])
xticks(spf_ang_variation);
xticklabels({'nspf', 'spf'});
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



%Box plots for PA with correct, unit and inadequate weights for SD3
HA(3) = nexttile;
h1 = boxplot(PA_with_correct_weights_nspf_vector_SD3, 'positions', spf_ang_variation - 0.1,'Width', 0.08,'Colors', 'b');
hold on
h2 = boxplot(PA_without_weights_nspf_vector_SD3*resizeing_non_weights_to_weights_factor_SD3, 'positions', spf_ang_variation, 'Width', 0.08, 'Colors', 'm');
hold on
h3 = boxplot(PA_with_inadequate_weights_nspf_vector_SD3, 'positions', spf_ang_variation + 0.1, 'Width', 0.08, 'Colors', 'r');
hold on
ylabel('Prncipal Angle (deg)');
l2 = yline(PA_the_for_SD123(3),'g','LineWidth',5,'DisplayName','PA threshold')
text(1.35, 0.62, sprintf('70%% = %.3f', PA_the_for_SD123(3)), 'Color', 'g', 'FontSize', 20);
set(h1, {'MarkerEdgeColor'}, {'b'});
set(h2, {'MarkerEdgeColor'}, {'m'});
title('PA for 0.01V & 0.02I')
hold on
xlim([0.8 1.7])
xticks(spf_ang_variation);
xticklabels({'nspf', 'spf'});
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


%% Compartive box plots of chi square and PA
close all
figure('Name','Comparision of Chi and PA')
hold on;


t = tiledlayout(1,2,'TileSpacing','compact');

%Box plots for chi with correct and inadequate weights for SD1
HA(1) = nexttile;
h1 = boxplot(Chi_with_correct_weights_nspf_vector_SD1, 'positions', spf_ang_variation - 0.045,'Width', 0.08,'Colors', 'b');
set(h1, {'MarkerEdgeColor'}, {'b'});
hold on
h2 = boxplot(Chi_with_inadequate_weights_nspf_vector_SD1, 'positions', spf_ang_variation + 0.045, 'Width', 0.08, 'Colors', 'r');
l1 = yline(Chi_the_for_SD123(1),'g','LineWidth',4)
% text(1.5, Chi_the_for_SD123(1)+10, sprintf('70%% = %.2f', Chi_the_for_SD123(1)), 'Color', 'g', 'FontSize', 20);
l2 = yline(Chi_the_for_SD123_999,'k','LineWidth',4)
% text(1.48, Chi_the_for_SD123_999+10, sprintf('99.9%% = %.2f', 94.460), 'Color', 'k', 'FontSize', 20);
title('Computation of \chi^2')
hold on
ylabel('\chi^2 Value');
ylim([20 260])
yticks([30 Chi_the_for_SD123(1) Chi_the_for_SD123_999 150:50:260]);
% yticklabels({'No GSA', 'Single GSA'});
xlim([0.8 1.7])
xticks(spf_ang_variation);
xticklabels({'No GSA', 'Single GSA'});
grid on
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
h1 = plot(nan, nan, 'sb', 'MarkerFaceColor', 'b', 'MarkerSize', 10); % Blue legend
h2 = plot(nan, nan, 'sr', 'MarkerFaceColor', 'r', 'MarkerSize', 10); % Red legend
leg1 = legend([h1, h2, l1, l2], {'Ture \chi^2', 'Estimated \chi^2', '\chi^2_{th} at 70%', '\chi^2_{th} at 90%'}, 'Location', 'Northwest');
leg1.FontSize = 25


%Box plots for PA with correct, unit and inadequate weights for SD1
HA(2) = nexttile;
h1 = boxplot(PA_with_correct_weights_nspf_vector_SD1, 'positions', spf_ang_variation - 0.1,'Width', 0.08,'Colors', 'b');
set(h1, {'MarkerEdgeColor'}, {'b'});
hold on
h2 = boxplot(PA_without_weights_nspf_vector_SD1*resizeing_non_weights_to_weights_factor_SD1, 'positions', spf_ang_variation, 'Width', 0.08, 'Colors', 'm');
% h2 = boxplot(PA_without_weights_nspf_vector_SD1, 'positions', spf_ang_variation, 'Width', 0.08, 'Colors', 'm');
set(h2, {'MarkerEdgeColor'}, {'m'});
hold on
h3 = boxplot(PA_with_inadequate_weights_nspf_vector_SD1, 'positions', spf_ang_variation + 0.1, 'Width', 0.08, 'Colors', 'r');
hold on
l1 = yline(PA_the_for_SD123(1),'g','LineWidth',4);
% l2 = yline(PAin_the_for_SD123(1),'g','LineWidth',5,'DisplayName','PA threshold');
% text(1.55, PA_the_for_SD123(1)+0.003, sprintf('70%% = %.3f', PA_the_for_SD123(1)), 'Color', 'g', 'FontSize', 20);
hold on
ylim([0.065 0.2])
yticks([0.06:0.02:0.1 0.1245 0.14:0.02:0.2]);
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
h1 = plot(nan, nan, 'sb', 'MarkerFaceColor', 'b', 'MarkerSize', 10); % Blue legend
h2 = plot(nan, nan, 'sr', 'MarkerFaceColor', 'm', 'MarkerSize', 10); % m legend
h3 = plot(nan, nan, 'sr', 'MarkerFaceColor', 'r', 'MarkerSize', 10); % Red legend
leg2 = legend([h1, h2, h3, l1], {'Ture PA', 'PA with unit weights', 'Estimated PA', 'PA_{th} at 70%'}, 'Location', 'Northwest');
leg2.FontSize = 25

