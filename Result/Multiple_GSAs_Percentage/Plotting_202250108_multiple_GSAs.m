clc
clear
close all

Ang_variation = -1:0.05:1;


test_system = 118

if test_system == 30
    %% IEEE-30 bus system
    load("res_20250409_Mulitple_GSAs_IEEE_30.mat")
    % PA_threshold = 0.1249; %At 70% confidence level
    PA_threshold = 0.144324154; %At 99% confidence level
    ylim_1 = [0.14 0.427]
    ylim_2 = [0.08 0.152]
    yticks_la1 = [PA_threshold 0.2 0.25 0.3 0.35 0.4]
    yticks_la2 = [0.08:0.015:0.13 PA_threshold]
else
    load("res_20250409_Mulitple_GSAs_IEEE_118.mat")
    % PA_threshold= 0.1028; %At 70% confidence level
    PA_threshold= 0.110671706;  %At 99% confidence level
    ylim_1 = [0.105 0.234]
    ylim_2 = [0.08 0.12]
    yticks_la1 = [PA_threshold 0.14 0.16 0.18 0.2 0.22]
    yticks_la2 = [0.08 0.09 0.1 PA_threshold 0.12 0.13 0.14]
    
end


%% BOX Plot for multiple attacks

LSE_PA = cell2mat(LSE_PA')
NLS_PA = cell2mat(NLS_PA')

%% Multiple attacks by spoofing 5 PMUs

figure('Name','Mutliple GSA in system')
t = tiledlayout(1,2,'TileSpacing','loose');

% Tile 1
HA(1) = nexttile
boxplot(LSE_PA(:,2:end))
yline(PA_threshold,'g', 'LineWidth', 5,'DisplayName','PA threshold')
title('PA with GSA')
ylim(ylim_1)
yticks(yticks_la1)
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

% Tile 2
HA(2) = nexttile
boxplot(NLS_PA(:,2:end))
yline(PA_threshold,'g', 'LineWidth', 5,'DisplayName','PA threshold')
ylim(ylim_2)
yticks(yticks_la2)
title('PA after mitigation of GSA')
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

% aa.Position(1)= 200000;
xlabel(t,'Number of spoofed PMUs','FontSize', 50, 'FontName', 'Times New Roman','FontWeight', 'bold')
ylabel(t,'Principal Angle (deg)','FontSize', 50, 'FontName', 'Times New Roman','FontWeight', 'bold')

set(gcf, 'Units', 'inches');
set(gcf, 'Position', [1, 1, 20, 9]);
% Configure print/export settings
set(gcf, 'PaperUnits', 'inches');
set(gcf, 'PaperPositionMode', 'manual');  % Manual mode
set(gcf, 'PaperPosition', [-0.07, -0.22, 21.33, 9.22]);  % [left, bottom, width, height]




