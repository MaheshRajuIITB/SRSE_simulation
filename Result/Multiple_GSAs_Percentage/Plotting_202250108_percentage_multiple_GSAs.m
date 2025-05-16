clc
clear
close all

%% Percentage spoofed PMUs case only for after mitigation of GSA

figure('Name','Percentage Mutliple GSAs in system aftr mitiagtion of GSA')

PA_threshold_30 = 0.144324154;
PA_threshold_118 = 0.110671706;

load("res_20250411_Percetange_Mulitple_GSAs_IEEE_30.mat")
NLS_PA = cell2mat(NLS_PA')
NLS_PA_30bus = NLS_PA(:,1:6)

load("res_20250411_Percetange_Mulitple_GSAs_IEEE_118.mat")
NLS_PA = cell2mat(NLS_PA')
NLS_PA_118bus = NLS_PA(:,1:6)


t = tiledlayout(1,2,'TileSpacing','loose');

% Tile 1
HA(1) = nexttile
boxplot(NLS_PA_30bus(:,2:end))
yline(PA_threshold_30,'g', 'LineWidth', 5,'DisplayName','PA threshold')
title('IEEE 30 bus system')
xticklabels({'10%' '20%', '30%', '40%','50%','60%','70%','80%','90%'});
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
boxplot(NLS_PA_118bus(:,2:end))
yline(PA_threshold_118,'g', 'LineWidth', 5,'DisplayName','PA threshold')
% ylim([0.08 0.12])
title('IEEE 118 bus system')
xticklabels({'10%' '20%', '30%', '40%','50%','60%','70%','80%','90%'});
grid on;
ylim([0.08 0.12])
legend("show",'Location','northwest')
set(gca, 'LineWidth', 2)
set(gca, 'Box', 'on', 'LineWidth', 2)
set(gca, 'FontSize', 30, 'FontName', 'Times New Roman','FontWeight', 'bold')
set(findobj(gcf, 'tag', 'Box'), 'LineWidth', 2);       % Boxes
set(findobj(gcf, 'tag', 'Median'), 'LineWidth', 2);    % Median lines
set(findobj(gcf, 'tag', 'Whisker'), 'LineWidth', 200);   % Whiskers
set(findobj(gcf, 'tag', 'Outliers'), 'MarkerSize', 8); % Outliers
set(findobj(gca, 'Tag', 'Upper Whisker'), 'LineWidth', 2); % Upper whisker
set(findobj(gca, 'Tag', 'Lower Whisker'), 'LineWidth', 2); % Lower whisker
set(findobj(gca, 'Tag', 'Upper Adjacent Value'), 'LineWidth', 2); % Max line
set(findobj(gca, 'Tag', 'Lower Adjacent Value'), 'LineWidth', 2); % Min line

aa.Position(1)= 200000;
xlabel(t,'Percentage of spoofed PMUs','FontSize', 50, 'FontName', 'Times New Roman','FontWeight', 'bold')
ylabel(t,'Principal Angle (deg)','FontSize', 50, 'FontName', 'Times New Roman','FontWeight', 'bold')


set(gcf, 'Units', 'inches');
set(gcf, 'Position', [1, 1, 20, 9]);
% Configure print/export settings
set(gcf, 'PaperUnits', 'inches');
set(gcf, 'PaperPositionMode', 'manual');  % Manual mode
set(gcf, 'PaperPosition', [-0.07, -0.22, 21.33, 9.22]);  % [left, bottom, width, height]

