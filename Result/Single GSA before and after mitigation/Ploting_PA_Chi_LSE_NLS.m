
clc
clear
close all

Ang_variation = -1:0.05:1;


%% BOX Plotting of 13 PMUs in IEEE 30 and 10 in 118 bus systems
% considering the PMU is spoofed with 0.4 deg i.e., Ang_var(29)
% position_angle = 29;
% considering the PMU is spoofed with 0.6 deg i.e., Ang_var(33)
position_angle = 33;

% load("res_20250108_30_FullCOr_-1_to_1.mat")
% PA_threshold = 0.1249;

load("res_20250108_118_FullCOr_-1_to_1.mat")
PA_threshold= 0.1028;


PMUs_non_spoofed_matrix_LSE = Monte_result{2,1}{21,1};
PMUs_spoofed_matrix_LSE = zeros(1000,size(PA_LSE,2));
PMUs_spoofed_matrix_NLS = zeros(1000,size(PA_LSE,2));


for t = 1:size(PA_LSE,2)
    
    PMUs_spoofed_matrix_LSE(:,t) = Monte_result{2,1}{position_angle,t};
    PMUs_spoofed_matrix_NLS(:,t) = Monte_result{6,1}{position_angle,t};
end


figure('Name','Box plot of PA with GSA and with mitigation of GSA')
t = tiledlayout(1,2,'TileSpacing','loose');

% Tile 1
HA(1) = nexttile
boxplot(PMUs_spoofed_matrix_LSE)
yline(PA_threshold,'g', 'LineWidth', 5,'DisplayName','PA threshold')
title('PA with GSA')
% xticklabels({'2' '3', '6', '10', '11', '12', '15', '20', '23', '25', '27', '28', '29'});
xticklabels({'5' '11', '28', '40', '56', '77', '83', '90', '94', '108', '114'});
grid on;
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

% Tile 2
HA(2) = nexttile
boxplot(PMUs_spoofed_matrix_NLS)
yline(PA_threshold,'g', 'LineWidth', 5,'DisplayName','PA threshold')
title('PA after mitigation of GSA')
% xticklabels({'2' '3', '6', '10', '11', '12', '15', '20', '23', '25', '27', '28', '29'});
xticklabels({'5' '11', '28', '40', '56', '77', '83', '90', '94', '108', '114'});
grid on;
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
ylim([0.085 0.12])
% aa.Position(1)= 200000;
xlabel(t,'Location of PMU','FontSize', 50, 'FontName', 'Times New Roman','FontWeight', 'bold')
ylabel(t,'Principal Angle (deg)','FontSize', 50, 'FontName', 'Times New Roman','FontWeight', 'bold')


return
%% Computation of PA with counter scheme
counter_set = 5
PA_after_NLS_with_counter = PA_computation_with_counter(PMUs_spoofed_matrix_NLS, PA_threshold,counter_set)

figure('Name','Box plot of PA with GSA and with mitigation of GSA with counter')
t = tiledlayout(1,2,'TileSpacing','loose');

% Tile 1
HA(1) = nexttile
boxplot(PMUs_spoofed_matrix_LSE)
yline(PA_threshold,'g', 'LineWidth', 5,'DisplayName','PA threshold')
title('PA with GSA')
% xticklabels({'2' '3', '6', '10', '11', '12', '15', '20', '23', '25', '27', '28', '29'});
xticklabels({'5' '11', '28', '40', '56', '77', '83', '90', '94', '114'});
grid on;
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

% Tile 2
HA(2) = nexttile
boxplot(PA_after_NLS_with_counter)
yline(PA_threshold,'g', 'LineWidth', 5,'DisplayName','PA threshold')
title('PA after mitigation of GSA')
% xticklabels({'2' '3', '6', '10', '11', '12', '15', '20', '23', '25', '27', '28', '29'});
xticklabels({'5' '11', '28', '40', '56', '77', '83', '90', '94', '114'});
grid on;
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
% ylim([0.085 0.12])
% aa.Position(1)= 200000;
xlabel(t,'Location of PMU','FontSize', 50, 'FontName', 'Times New Roman','FontWeight', 'bold')
ylabel(t,'Principal Angle (deg)','FontSize', 50, 'FontName', 'Times New Roman','FontWeight', 'bold')

%% Computation of PA for non-spoofed, spoofed and correction scenarios

Three_scenarios = zeros(1000,3)

Three_scenarios(:,1) = PMUs_non_spoofed_matrix_LSE
Three_scenarios(:,2) = PMUs_spoofed_matrix_LSE(:,1)
Three_scenarios(:,3) = PMUs_spoofed_matrix_NLS(:,1)


figure('Name','PA for three scenarios')
boxplot(Three_scenarios)
yline(PA_threshold,'g', 'LineWidth', 5,'DisplayName','PA threshold')
title('PA for three scenarios')
xticklabels({'nspf' 'spf', 'corr'});
grid on;
% legend("show",'Location','northwest')
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
set(findobj(gca, 'Tag', 'Lower Adjacent Value'), 'LineWidth', 2); % Min li


