clc
clear
close all

Ang_variation = -1:0.05:1;

%% PA and RMSE with respective to angle variation

%% %% PA angle 

load('res_20250107_combined_PA_RMSE.mat')

PA_threshold_monte_mean_30 = 0.119319;
PA_threshold_monte_mean_118 = 0.10066;

% At 70% confidence level
% PA_threshold_30 = 0.1249;
% PA_threshold_118= 0.1028;

% At 99% confidence level
PA_threshold_30 = 0.144324154;
PA_threshold_118= 0.110671706;

figure('Name','PA with respect to spoofing angle')

t = tiledlayout(1,2,'TileSpacing','loose');

HA(1) = nexttile
for k = 1:size(PA_LSE_30,2)
    p1 = plot(Ang_variation, PA_LSE_30(:,k),'r','LineWidth', 2);
    hold on;
    p2 = plot(Ang_variation,PA_NLS_30(:,k),'k','LineWidth', 2)
end
grid on;
y1 = yline(PA_threshold_30,'g', 'LineWidth', 3,'DisplayName','PA threshold')
y2 = yline(PA_threshold_monte_mean_30,'--b', 'LineWidth', 3,'DisplayName','mean value of PA')
set(gca, 'Box', 'on', 'LineWidth', 4)
ylim([0.116 0.3])
yticks([0.12 PA_threshold_30 0.18 0.22 0.26 0.3]);
xticks([-1 -0.75 -0.35 0 0.35 0.7 1]);
title('IEEE 30 bus')
legend([p1 p2 y1 y2],'PA with GSA','PA after mitigation of GSA', 'PA threshold', 'mean value of PA with no GSA',Location='north')
% lgd = legend;
% lgd.NumColumns = 2;
grid on;
set(gca, 'LineWidth', 2)
set(gca, 'Box', 'on', 'LineWidth', 2)
set(gca, 'FontSize', 30, 'FontName', 'Times New Roman','FontWeight', 'bold')


% Tile 2
HA(2) = nexttile
for k = 1:size(PA_LSE_118,2)
    p1 = plot(Ang_variation, PA_LSE_118(:,k),'r','LineWidth', 2);
    hold on;
    p2 = plot(Ang_variation,PA_NLS_118(:,k),'k','LineWidth', 2)
end
yline(PA_threshold_118,'g', 'LineWidth', 3,'DisplayName','PA threshold')
yline(PA_threshold_monte_mean_118,'b--', 'LineWidth', 3,'DisplayName','mean value of PA')
title('IEEE 118 bus')
ylim([0.1 0.17])
yticks([0.1 PA_threshold_118 0.13 0.15 0.17]);
xticks([-1 -0.75 -0.35 0 0.35 0.7 1]);
% legend("show",'Location','northwest')
% xticklabels({'2' '3', '4', '5'});
legend([p1 p2 y1 y2],'PA with GSA','PA after mitigation of GSA', 'PA threshold', 'mean value of PA with no GSA',Location='north')
grid on;
set(gca, 'LineWidth', 2)
set(gca, 'Box', 'on', 'LineWidth', 2)
set(gca, 'FontSize', 30, 'FontName', 'Times New Roman','FontWeight', 'bold')

% aa.Position(1)= 200000;
xlabel(t,'Spoofing angle (deg)','FontSize', 50, 'FontName', 'Times New Roman','FontWeight', 'bold')
ylabel(t,'Principal Angle (deg)','FontSize', 50, 'FontName', 'Times New Roman','FontWeight', 'bold')


%% RMSE contineous plot of -1 to 1


load('res_20250108_combined_PA_RMSE.mat')

RMSE_abs_monte_30 = 0.001164;
RMSE_ang_monte_30 = 0.0908;

RMSE_abs_monte_118 = 0.00147080325539876;
RMSE_ang_monte_118 = 0.1482;

figure('Name','RMSE abs with respect to spoofing angle')
t = tiledlayout(1,2,'TileSpacing','loose');

% Tile 1
HA(1) = nexttile
 for k = 1:size(RMSE_abs_LSE_30,2)
    p1 = plot(Ang_variation, RMSE_abs_LSE_30(:,k),'r','LineWidth', 2);
    hold on;
    p2 = plot(Ang_variation, RMSE_abs_NLS_30(:,k),'k','LineWidth', 2);
    hold on;
end
grid on;
set(gca, 'Box', 'on', 'LineWidth', 4)
title('IEEE 30 bus')
y1 = yline(RMSE_abs_monte_30,'b--', 'LineWidth', 3,'DisplayName','mean value of RMSE')
% legend("show",'Location','northwest')
% legend([p1 p2 y1],'RMSE with LSE states','RMSE with NLS states', 'mean value of RMSE')
legend([p1 p2 y1],'RMSE of states with GSA','RMSE of states after mitigation of GSA', 'mean value of RMSE of states with no GSA', Location='north')
grid on;
set(gca, 'LineWidth', 2)
set(gca, 'Box', 'on', 'LineWidth', 2)
set(gca, 'FontSize', 30, 'FontName', 'Times New Roman','FontWeight', 'bold')


% Tile 2
HA(2) = nexttile
for k = 1:size(RMSE_abs_LSE_118,2)
    % p1 = plot(Ang_variation, ((RMSE_abs_LSE_118(:,k)*RMSE_abs_monte_118)/0.00131378544431781),'r','LineWidth', 2);
    p1 = plot(Ang_variation, RMSE_abs_LSE_118(:,k),'r','LineWidth', 2);
    hold on;
    p2 = plot(Ang_variation, RMSE_abs_NLS_118(:,k),'k','LineWidth', 2);
    hold on;
end
title('IEEE 118 bus')
y1 = yline(RMSE_abs_monte_118,'b--', 'LineWidth', 3,'DisplayName','mean value of RMSE')
% xticklabels({'2' '3', '4', '5'});
legend([p1 p2 y1],'RMSE of states with GSA','RMSE of states after mitigation of GSA', 'mean value of RMSE of states with no GSA', Location='north')
grid on;

set(gca, 'LineWidth', 2)
set(gca, 'Box', 'on', 'LineWidth', 2)
set(gca, 'FontSize', 30, 'FontName', 'Times New Roman','FontWeight', 'bold')
xlabel(t,'Spoofing angle (deg)','FontSize', 50, 'FontName', 'Times New Roman','FontWeight', 'bold')
ylabel(t,'RMSE (pu)','FontSize', 50, 'FontName', 'Times New Roman','FontWeight', 'bold')


%% RMSE angle

% t = tiledlayout(1,2,'TileSpacing','loose');
% 
% % Tile 1
% HA(1) = nexttile
%  for k = 1:size(RMSE_ang_LSE_30,2)
%     p1 = plot(Ang_variation, RMSE_ang_LSE_30(:,k),'r','LineWidth', 2);
%     hold on;
%     p2 = plot(Ang_variation, RMSE_ang_NLS_30(:,k),'k','LineWidth', 2);
%     hold on;
% end
% grid on;
% set(gca, 'Box', 'on', 'LineWidth', 4)
% title('IEEE 30 bus')
% y1 = yline(RMSE_ang_monte_30,'b--', 'LineWidth', 3,'DisplayName','mean value of RMSE')
% % legend("show",'Location','northwest')
% legend([p1 p2 y1],'RMSE with LSE states','RMSE with NLS states', 'mean value of RMSE')
% grid on;
% set(gca, 'LineWidth', 2)
% set(gca, 'Box', 'on', 'LineWidth', 2)
% set(gca, 'FontSize', 30, 'FontName', 'Times New Roman','FontWeight', 'bold')
% 
% 
% % Tile 2
% HA(2) = nexttile
% for k = 1:size(RMSE_ang_LSE_118,2)
%     p1 = plot(Ang_variation, RMSE_ang_LSE_118(:,k),'r','LineWidth', 2);
%     hold on;
%     p2 = plot(Ang_variation, RMSE_abs_NLS_118(:,k),'k','LineWidth', 2);
%     hold on;
% end
% title('IEEE 118 bus')
% y1 = yline(RMSE_ang_monte_118,'b--', 'LineWidth', 3,'DisplayName','mean value of RMSE')
% % xticklabels({'2' '3', '4', '5'});
% legend([p1 p2 y1],'RMSE with LSE states','RMSE with NLS states', 'mean value of RMSE')
% grid on;
% 
% set(gca, 'LineWidth', 2)
% set(gca, 'Box', 'on', 'LineWidth', 2)
% set(gca, 'FontSize', 30, 'FontName', 'Times New Roman','FontWeight', 'bold')
% xlabel(t,'Spoofing angle (deg)','FontSize', 50, 'FontName', 'Times New Roman','FontWeight', 'bold')
% ylabel(t,'RMSE (pu)','FontSize', 50, 'FontName', 'Times New Roman','FontWeight', 'bold')


%% BOX Plotting of 13 PMUs in IEEE 30 bus system
% considering the PMU is spoofed with 0.4 deg i.e., Ang_var(29)
% considering the PMU is spoofed with 0.7 deg i.e., Ang_var(35)

test_system = 118

if test_system == 30
    load("res_20250108_30_FullCOr_-1_to_1.mat")
    % PA_threshold = 0.1249; %At 70% confidence level
    PA_threshold = 0.144324154; %At 99% confidence level
    xtick_labels = {'2' '3', '6', '10', '11', '12', '15', '20', '23', '25', '27', '28', '29'}
    yticks_la1 = [PA_threshold 0.18 0.22 0.25 0.28]
    yticks_la2 = [0.07:0.02:PA_threshold PA_threshold]
else
    % load("res_20250108_118_FullCOr_-1_to_1.mat")
    load("res_20250107_118_RMSE_PA_chi_-1_to_1.mat")
    % PA_threshold= 0.1028; %At 70% confidence level
    PA_threshold= 0.110671706;  %At 99% confidence level
    xtick_labels = {'5' '11', '28', '35', '40', '56', '62', '77', '83', '90', '94', '108', '114'}
    yticks_la1 = [PA_threshold 0.12 0.13 0.14 0.15]
    yticks_la2 = [0.09 0.1 PA_threshold 0.12 0.13]
    
end


PMUs_spoofed_matrix_LSE = zeros(1000,size(PA_LSE,2));
PMUs_spoofed_matrix_NLS = zeros(1000,size(PA_LSE,2));

for t = 1:size(PA_LSE,2)
    PMUs_spoofed_matrix_LSE(:,t) = Monte_result{2,1}{41,t};
    PMUs_spoofed_matrix_NLS(:,t) = Monte_result{6,1}{41,t};
end


figure('Name','Box plot PA with GSA and after mitigation of GSA')

t = tiledlayout(1,2,'TileSpacing','loose');

% Tile 1
HA(1) = nexttile
boxplot(PMUs_spoofed_matrix_LSE)
yline(PA_threshold,'g', 'LineWidth', 5,'DisplayName','PA threshold')
title('PA with GSA')
yticks(yticks_la1)
xticklabels(xtick_labels);
if test_system == 118
    ylim([0.107 0.16])
end
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
if test_system == 118
    ylim([0.085 0.14])
end
% yticks(yticks_la2)
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




























