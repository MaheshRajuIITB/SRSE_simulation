clc;clear all;close all;

%% BOX Plotting of 13 PMUs in IEEE 30 bus system


test_system = 118

if test_system == 30
    load("res_20250409_Single_GSA_IEEE_30_0.7deg.mat")
    % PA_threshold = 0.1249; %At 70% confidence level
    PA_threshold = 0.144324154; %At 99% confidence level
    LSE_PA = LSE_PA(:,1:10)
    NLS_PA = NLS_PA(:,1:10)
    xtick_labels = {'2' '3', '6', '10', '11', '12', '15', '20', '23', '25', '27'}
    yticks_la1 = [PA_threshold 0.18 0.22 0.25 0.28]
    yticks_la2 = [0.07:0.02:PA_threshold PA_threshold]
    ylim_1 = [PA_threshold-0.01 0.28]
    ylim_2 = [0.085 PA_threshold+0.01]
else
    P = [1, 3, 4, 5, 6, 8, 9, 11, 12, 15, 17, 19, 21, 23, 25, 26, 28, 30, 34, 35, 37, 40, 43, 45, 46, 49, 52, 54, 56, 59, 62, 63, 65, 68, 70, 71, 75, 76, 77, 78, 80, 83, 85, 86, 89, 90, 92, 94, 96, 100, 105, 108, 110, 114];
    load("res_20250409_Single_GSA_IEEE_118_0.7deg.mat")
    % PA_threshold= 0.1028; %At 70% confidence level
    PA_threshold= 0.110671706;  %At 99% confidence level
    indices_spf = find(min(LSE_PA) > PA_threshold);
    indices_corr = find(max(NLS_PA) < PA_threshold);
    range = 11:21
    LSE_PA = LSE_PA(:,(indices_spf(range)))
    NLS_PA = NLS_PA(:,(indices_spf(range)))
    xtick_labels = {P(indices_spf(range))}
    yticks_la1 = [PA_threshold 0.12 0.13 0.14 0.15]
    yticks_la2 = [0.085 0.09 0.095 0.1 0.105 PA_threshold]
    ylim_1 = [0.107 0.16]
    ylim_2 = [0.085 0.114]
    
end



figure('Name','Box plot PA with GSA and after mitigation of GSA')

t = tiledlayout(1,2,'TileSpacing','loose');

% Tile 1
HA(1) = nexttile
boxplot(LSE_PA)
yline(PA_threshold,'g', 'LineWidth', 5,'DisplayName','PA threshold')
title('PA with GSA')
yticks(yticks_la1)
xticklabels(xtick_labels);
ylim(ylim_1)
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
boxplot(NLS_PA)
yline(PA_threshold,'g', 'LineWidth', 5,'DisplayName','PA threshold')
title('PA after mitigation of GSA')
ylim(ylim_2)
yticks(yticks_la2)
xticklabels(xtick_labels);
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

set(gcf, 'Units', 'inches');
set(gcf, 'Position', [1, 1, 20, 9]);
% Configure print/export settings
set(gcf, 'PaperUnits', 'inches');
set(gcf, 'PaperPositionMode', 'manual');  % Manual mode
set(gcf, 'PaperPosition', [-0.07, -0.22, 21.33, 9.22]);  % [left, bottom, width, height]

