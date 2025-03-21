clc
clear
close all



% This code is for ploting the graphs for Muliple attacks in portitions or partitions of the IEEE 118 bus systems.
% To check the how SRSE algorithm work with distributed state estimation

%% IEEE-118 bus system
% load("res_20250319_Mulitple_GSAs_IEEE_118_Group1.mat")
% load("res_20250319_Mulitple_GSAs_IEEE_118_Group2.mat")
% load("res_20250319_Mulitple_GSAs_IEEE_118_Group3.mat")
% load("res_20250319_Mulitple_GSAs_IEEE_118_Group4.mat")
load("res_20250319_Mulitple_GSAs_IEEE_118_Group1_with_8_PMUs.mat")


%% Variables

PA_threshold = 0.1028; %For IEEE 118 bus system

LSE_PA_matrix = cell2mat(LSE_PA')
NLS_PA_matrix = cell2mat(NLS_PA')


%% Box plot of PA with spoofing and after correction

figure('Name','Mulitple GSAs in partition of IEEE 118 bus system')
t = tiledlayout(1,2,'TileSpacing','loose');

HA(1) = nexttile
boxplot(LSE_PA_matrix)
yline(PA_threshold,'g', 'LineWidth', 5,'DisplayName','PA threshold')
title('PA with spoofing')
% xticklabels({'2' '3', '4', '5'});
legend("show",'Location','northwest')
grid on;
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

HA(2) = nexttile
boxplot(NLS_PA_matrix)
yline(PA_threshold,'g', 'LineWidth', 5,'DisplayName','PA threshold')
% ylim([0.08 0.12])
title('PA after correction')
% xticklabels({'2' '3', '4', '5'});
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


xlabel(t,'Number of spoofed PMUs','FontSize', 50, 'FontName', 'Times New Roman','FontWeight', 'bold')
ylabel(t,'Principal Angle (deg)','FontSize', 50, 'FontName', 'Times New Roman','FontWeight', 'bold')

return
