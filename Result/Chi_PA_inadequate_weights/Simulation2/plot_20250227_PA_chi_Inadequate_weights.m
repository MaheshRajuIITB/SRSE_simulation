clc
clear
close all

%% This code is to draw the Chi square and PA with correct, inadequate weights and without weights

%% Load IEEE 30 bus system
% load("res_PA_Chi_inadequate_weights_IEEE_30_0.7spf.mat")
load("res_PA_Chi_inadequate_weights_IEEE_30_0.5spf.mat")
% load("res_PA_Chi_inadequate_weights_IEEE_30_0.4spf.mat")
% load("res_PA_Chi_inadequate_weights_IEEE_30_0.3spf.mat")

%% variables
no_spoofed_PMUs = [0 1 2 3 4 5];

chi_threshold_70 = 61.0305;
chi_threshold_90 = 69.9185;
chi_threshold_99 = 83.4049;

PA_threshold_70_without_weights = 0.2058;
PA_threshold_90_without_weights = 0.2220;

PA_threshold_70_with_correct_weights = 0.1255;
PA_threshold_90_with_correct_weights = 0.1345;

%% Plot of Chi square with correct weights and inadequate weights with respective to no of spoofed PMUs

figure('Name','Chi square')
plot(no_spoofed_PMUs,Chi_with_correct_weights_mean,'DisplayName','True \chi^2' , 'Color', 'k','LineWidth', 7);
hold on;
plot(no_spoofed_PMUs,Chi_with_inadequate_weights_mean,'DisplayName','Estimated \chi^2' , 'Color', 'r','LineWidth',7);
hold on;
legend('show','Location','north');
ylabel('\chi^2 value ','FontSize',60,'FontName', 'Times New Roman');
xlabel('Number of spoofed PMUs','FontSize',60,'FontName', 'Times New Roman');
grid on;
set(gca, 'Box', 'on', 'LineWidth', 6)
xticks([0 1 2 3 4 5]);
% legend([p1 p2 y1 y2],'PA with Spoofing','PA after correction', 'PA threshold', 'mean value of PA')

grid on;
set(gca, 'LineWidth', 5)
set(gca, 'Box', 'on', 'LineWidth', 5)
set(gca, 'FontSize', 50, 'FontName', 'Times New Roman','FontWeight', 'bold')


%% Data for box plots

Chi_with_correct = cell2mat(Chi_with_correct_weights');
Chi_with_inadequate = cell2mat(Chi_with_inadequate_weights');

PA_with_correct = cell2mat(PA_with_correct_weights');
PA_with_inadequate = cell2mat(PA_with_inadequate_weights')
PA_without = cell2mat(PA_without_weights')

% for t = 1:length(PA_with_inadequate_weights)
%     PA_with_correct(:,t) = PA_with_correct_weights{t,1}; 
%     PA_with_inadequate(:,t) = PA_with_inadequate_weights{t,1};
%     PA_without(:,t) = PA_without_weights{t,1};
% end


%% Box plot of chi square

figure('Name','Box plot of True and Estimated Chi square')


t = tiledlayout(1,2,'TileSpacing','loose');

HA(1) = nexttile
boxplot(Chi_with_correct)
yline(chi_threshold_70,'g', 'LineWidth', 5,'DisplayName','\chi^2 threshold at 70% CI')
yline(chi_threshold_90,'r', 'LineWidth', 5,'DisplayName','\chi^2 threshold at 90% CI')
title('True \chi^2')
% yticks([100,500,900,1300,1700]);
% ylim([0 500])
xticklabels({'0', '1', '2' '3', '4', '5'});
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
boxplot(Chi_with_inadequate)
yline(chi_threshold_70,'g', 'LineWidth', 5,'DisplayName','\chi^2 threshold at 70% CI')
yline(chi_threshold_90,'r', 'LineWidth', 5,'DisplayName','\chi^2 threshold at 90% CI')
title('Estimated \chi^2')
xticklabels({'0', '1', '2' '3', '4', '5'});
% ylim([0 1300])
% yticks([100,500,900,1300,1700]);
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
ylabel(t,'\chi^2 value','FontSize', 50, 'FontName', 'Times New Roman','FontWeight', 'bold')



%% Box plots for PA test

figure('Name','Box plot of PA without weights and with inadequate weights')


t = tiledlayout(1,2,'TileSpacing','loose');


HA(1) = nexttile
boxplot(PA_without)
yline(PA_threshold_70_without_weights,'g', 'LineWidth', 5,'DisplayName','PA threshold at 70% CI')
yline(PA_threshold_90_without_weights,'r', 'LineWidth', 5,'DisplayName','PA threshold at 90% CI')
title('PA without weights')
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



% Tile 2
HA(2) = nexttile
boxplot(PA_with_inadequate)
yline(PA_threshold_70_with_correct_weights,'g', 'LineWidth', 5,'DisplayName','PA threshold at 70% CI')
yline(PA_threshold_90_with_correct_weights,'r', 'LineWidth', 5,'DisplayName','PA threshold at 90% CI')
title('PA with inconsistence weights')
xticklabels({'0', '1', '2' '3', '4', '5'});
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


xticklabels({'0', '1', '2' '3', '4', '5'});
grid on;
xlabel(t,'Number of spoofed PMUs','FontSize', 50, 'FontName', 'Times New Roman','FontWeight', 'bold')
ylabel(t,'Principal Angle (deg)','FontSize', 50, 'FontName', 'Times New Roman','FontWeight', 'bold')


%% PA and Chi square only for non-spoofing condition


figure('Name','True and Estimated Chi square')
hold on;

spf_ang_variation = [1 1.4]

t = tiledlayout(1,2,'TileSpacing','compact');

HA(1) = nexttile
% Create two separate boxplots with transparency
h1 = boxplot(Chi_with_correct(:,1:2), 'positions', spf_ang_variation - 0.045, 'Width', 0.08,'Colors', 'b');
hold on
h2 = boxplot(Chi_with_inadequate(:,1:2), 'positions', spf_ang_variation + 0.045, 'Width', 0.08, 'Colors', 'r');
% ylim([22 152])
ylim([25 326])
% yticks([40,chi_threshold_90,80,100,120,140]);
yticks([40,chi_threshold_90,110:35:320]);
ylabel('\chi^2 Value');
l1 = yline(chi_threshold_90,'g','LineWidth',5,'DisplayName','\chi^2 threshold')
set(h1, {'MarkerEdgeColor'}, {'b'});
hold on

title('Computation of \chi^2 with different weights')
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
h2 = plot(nan, nan, 'sr', 'MarkerFaceColor', 'r', 'MarkerSize', 10); % Red legend
legend([h1, h2, l1], {'Ture \chi^2', 'Estimated \chi^2', 'Threshold values of \chi^2'}, 'Location', 'Northwest');

xlim([0.8 1.7])
xticks(spf_ang_variation);
xticklabels({'nspf', 'spf'});

resizeing_non_weights_to_weights_factor = (PA_threshold_70_with_correct_weights/PA_threshold_70_without_weights)

HA(2) = nexttile
% Create two separate boxplots with transparency
h1 = boxplot(PA_with_correct(:,1:2), 'positions', spf_ang_variation - 0.09, 'Width', 0.08,'Colors', 'b');
hold on
h2 = boxplot(PA_with_inadequate(:,1:2), 'positions', spf_ang_variation + 0.09, 'Width', 0.08, 'Colors', 'r');
hold on
h3 = boxplot(PA_without(:,1:2)*resizeing_non_weights_to_weights_factor, 'positions', spf_ang_variation , 'Width', 0.08, 'Colors', 'm');
% h3 = boxplot(PA_without(:,1:2), 'positions', spf_ang_variation , 'Width', 0.08, 'Colors', 'm');
ylim([0.067,0.26])
yticks([0.06:0.025:0.11,PA_threshold_70_with_correct_weights,0.16:0.025:0.24]);
ylabel('Prncipal Angle (deg)');
l2 = yline(PA_threshold_70_with_correct_weights,'g','LineWidth',5,'DisplayName','\chi^2 threshold')
% l3 = yline(PA_threshold_70_without_weights,'g','LineWidth',5,'DisplayName','\chi^2 threshold')
% yline(PA_threshold_70_without_weights,'g','LineWidth',5,'DisplayName','\chi^2 threshold')
set(h1, {'MarkerEdgeColor'}, {'b'});
set(h3, {'MarkerEdgeColor'}, {'m'});
hold on

title('Computation of PA with different weights')
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


h1 = plot(nan, nan, 'sb', 'MarkerFaceColor', 'b', 'MarkerSize', 10); % Blue legend
h2 = plot(nan, nan, 'sr', 'MarkerFaceColor', 'r', 'MarkerSize', 10); % Red legend
h3 = plot(nan, nan, 'sr', 'MarkerFaceColor', 'm', 'MarkerSize', 10); % Red legend
legend([h1, h3, h2, l2], {'Ture PA', 'PA with unit weights', 'Estimated PA', 'Threshold values of PA'}, 'Location', 'Northwest');

xlim([0.8 1.7])
xticks(spf_ang_variation);
xticklabels({'nspf', 'spf'});

return







