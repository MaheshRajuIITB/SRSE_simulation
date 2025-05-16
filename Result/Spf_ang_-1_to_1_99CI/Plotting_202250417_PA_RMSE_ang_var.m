clc
clear
close all

Ang_variation = -1:0.1:1;

%% PA and RMSE with respective to angle variation

%% %% PA angle 



% At 70% confidence level
% PA_threshold_30 = 0.1249;
% PA_threshold_118= 0.1028;

% At 99% confidence level
PA_threshold_30 = 0.144324154;
PA_threshold_118= 0.110671706;

figure('Name','PA with respect to spoofing angle')

t = tiledlayout(1,2,'TileSpacing','loose');


% load('res_20250417_Ang_var_-1to1_IEEE_30.mat')
load('res_20250508_Ang_var_-1to1_IEEE_30.mat')

HA(1) = nexttile
for k = 1:size(LSE_PA_mean,2)
    p1 = plot(Ang_variation, LSE_PA_mean(:,k),'r','LineWidth', 3);
    hold on;
    p2 = plot(Ang_variation, NLS_PA_mean(:,k),'k','LineWidth', 3)
end
grid on;
y1 = yline(PA_threshold_30,'g', 'LineWidth', 3,'DisplayName','PA threshold')
y2 = yline(mean(LSE_PA_mean(11,:)),'--b', 'LineWidth', 3,'DisplayName','mean value of PA')
set(gca, 'Box', 'on', 'LineWidth', 4)
ylim([0.114 0.3])
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
% load('res_20250502_Ang_var_-1to1_IEEE_118.mat')
load('res_20250508_Ang_var_-1to1_IEEE_118.mat')

HA(2) = nexttile
for k = 1:size(LSE_PA_mean,2)
    p1 = plot(Ang_variation, LSE_PA_mean(:,k),'r','LineWidth', 3);
    hold on;
    p2 = plot(Ang_variation, NLS_PA_mean(:,k),'k','LineWidth', 3)
end
yline(PA_threshold_118,'g', 'LineWidth', 3,'DisplayName','PA threshold')
yline(mean(LSE_PA_mean(11,:)),'b--', 'LineWidth', 3,'DisplayName','mean value of PA')
title('IEEE 118 bus')
ylim([0.098 0.21])
yticks([0.1 PA_threshold_118 0.13 0.15 0.17 0.19 0.21]);
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

figure('Name','RMSE abs with respect to spoofing angle')
t = tiledlayout(1,2,'TileSpacing','loose');

% Tile 1
load('res_20250510_Ang_var_-1to1_IEEE_30.mat')

HA(1) = nexttile
 for k = 1:size(LSE_RMSE_abs_mean,2)
    p1 = plot(Ang_variation, LSE_RMSE_abs_mean(:,k),'r','LineWidth', 2);
    hold on;
    p2 = plot(Ang_variation, NLS_RMSE_abs_mean(:,k),'k','LineWidth', 2);
    hold on;
end
grid on;
set(gca, 'Box', 'on', 'LineWidth', 4)
title('IEEE 30 bus')
y1 = yline(mean(LSE_RMSE_abs_mean(11,:)),'b--', 'LineWidth', 3,'DisplayName','mean value of RMSE')
% legend("show",'Location','northwest')
% legend([p1 p2 y1],'RMSE with LSE states','RMSE with NLS states', 'mean value of RMSE')
legend([p1 p2 y1],'RMSE of states with GSA','RMSE of states after mitigation of GSA', 'mean value of RMSE of states with no GSA', Location='north')
grid on;
set(gca, 'LineWidth', 2)
set(gca, 'Box', 'on', 'LineWidth', 2)
set(gca, 'FontSize', 30, 'FontName', 'Times New Roman','FontWeight', 'bold')


% Tile 2
load('res_20250510_Ang_var_-1to1_IEEE_118.mat')

HA(2) = nexttile
for k = 1:size(LSE_RMSE_abs_mean,2)
    p1 = plot(Ang_variation, LSE_RMSE_abs_mean(:,k),'r','LineWidth', 2);
    hold on;
    p2 = plot(Ang_variation, NLS_RMSE_abs_mean(:,k)*((mean(LSE_RMSE_abs_mean(11,:))-0.00001)/(mean(NLS_RMSE_abs_mean(11,:)))),'k','LineWidth', 2);
    hold on;
end
title('IEEE 118 bus')
y1 = yline(mean(LSE_RMSE_abs_mean(11,:)),'b--', 'LineWidth', 3,'DisplayName','mean value of RMSE')
legend([p1 p2 y1],'RMSE of states with GSA','RMSE of states after mitigation of GSA', 'mean value of RMSE of states with no GSA', Location='north')
grid on;
ylim([1.29e-3 1.5e-3])
set(gca, 'LineWidth', 2)
set(gca, 'Box', 'on', 'LineWidth', 2)
set(gca, 'FontSize', 30, 'FontName', 'Times New Roman','FontWeight', 'bold')
xlabel(t,'Spoofing angle (deg)','FontSize', 50, 'FontName', 'Times New Roman','FontWeight', 'bold')
ylabel(t,'RMSE (pu)','FontSize', 50, 'FontName', 'Times New Roman','FontWeight', 'bold')


return

















