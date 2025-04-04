
clc
clear
close all

Ang_variation = -1:0.05:1;

%% IEEE-14 bus system
% load("res_20250104_14_RMSE_PA.mat")
% PA_threshold_monte = 0.10044;
% PA_threshold_chi = 0.1353;
% RMSE_abs_monte = 0.001128;
% RMSE_ang_monte = 0.00837;

%% IEEE-30 bus system

% P = [2 3 6 10 11 12 15 20 23 25 27 28 29]
% 
% PA_threshold_chi = 0.1464;
% % Chi_monte = 55.9
% % Chi_thre = 83.5134
% RMSE_abs_monte = 0.001164;
% RMSE_ang_monte = 0.0908;

%% IEEE-118 bus system
%

% PA_threshold_monte = 0.10066;
% PA_threshold_chi = 0.110144;
% Chi_monte = 316.2
% Chi_thre = chi2inv(0.99,2*(276 - 118))
% RMSE_abs_monte = 0.00131;
% RMSE_ang_monte = 0.1482;

%% PA and RMSE with respective to angle variation

%% %% PA angle

% load('res_20250107_combined_PA_RMSE.mat')
% % load('res_20250108_combined_PA_RMSE.mat')
% 
% PA_threshold_monte_mean_30 = 0.119319;
% PA_threshold_monte_mean_118 = 0.10066;
% 
% PA_threshold_30 = 0.1249;
% PA_threshold_118= 0.1028;
% 
% t = tiledlayout(1,2,'TileSpacing','loose');
% 
% HA(1) = nexttile
% for k = 1:size(PA_LSE_30,2)
%     p1 = plot(Ang_variation, PA_LSE_30(:,k),'r','LineWidth', 2);
%     hold on;
%     p2 = plot(Ang_variation,PA_NLS_30(:,k),'k','LineWidth', 2)
% end
% grid on;
% y1 = yline(PA_threshold_30,'g', 'LineWidth', 3,'DisplayName','PA threshold')
% y2 = yline(PA_threshold_monte_mean_30,'--b', 'LineWidth', 3,'DisplayName','mean value of PA')
% set(gca, 'Box', 'on', 'LineWidth', 4)
% xticks([-1 -0.5 -0.2 0 0.2 0.5 1]);
% title('IEEE 30 bus')
% legend([p1 p2 y1 y2],'PA with Spoofing','PA after correction', 'PA threshold', 'mean value of PA')
% % lgd = legend;
% % lgd.NumColumns = 2;
% grid on;
% set(gca, 'LineWidth', 2)
% set(gca, 'Box', 'on', 'LineWidth', 2)
% set(gca, 'FontSize', 30, 'FontName', 'Times New Roman','FontWeight', 'bold')
% 
% 
% % Tile 2
% HA(2) = nexttile
% for k = 1:size(PA_LSE_118,2)
%     p1 = plot(Ang_variation, PA_LSE_118(:,k),'r','LineWidth', 2);
%     hold on;
%     p2 = plot(Ang_variation,PA_NLS_118(:,k),'k','LineWidth', 2)
% end
% yline(PA_threshold_118,'g', 'LineWidth', 3,'DisplayName','PA threshold')
% yline(PA_threshold_monte_mean_118,'b--', 'LineWidth', 3,'DisplayName','mean value of PA')
% title('IEEE 118 bus')
% xticks([-1 -0.5 -0.2 0 0.2 0.5 1]);
% % legend("show",'Location','northwest')
% % xticklabels({'2' '3', '4', '5'});
% legend([p1 p2 y1 y2],'PA with Spoofing','PA after correction', 'PA threshold', 'mean value of PA')
% grid on;
% set(gca, 'LineWidth', 2)
% set(gca, 'Box', 'on', 'LineWidth', 2)
% set(gca, 'FontSize', 30, 'FontName', 'Times New Roman','FontWeight', 'bold')
% 
% % aa.Position(1)= 200000;
% xlabel(t,'Spoofing angle (deg)','FontSize', 50, 'FontName', 'Times New Roman','FontWeight', 'bold')
% ylabel(t,'Principal Angle (deg)','FontSize', 50, 'FontName', 'Times New Roman','FontWeight', 'bold')

%% RMSE

% % % load('res_20250107_combined_PA_RMSE.mat')
% load('res_20250108_combined_PA_RMSE.mat')
% 
% RMSE_abs_monte_30 = 0.001164;
% RMSE_ang_monte_30 = 0.0908;
% 
% RMSE_abs_monte_118 = 0.00147080325539876;
% RMSE_ang_monte_118 = 0.1482;
% 
% t = tiledlayout(1,2,'TileSpacing','loose');
% 
% % Tile 1
% HA(1) = nexttile
%  for k = 1:size(RMSE_abs_LSE_30,2)
%     p1 = plot(Ang_variation, RMSE_abs_LSE_30(:,k),'r','LineWidth', 2);
%     hold on;
%     p2 = plot(Ang_variation, RMSE_abs_NLS_30(:,k),'k','LineWidth', 2);
%     hold on;
% end
% grid on;
% set(gca, 'Box', 'on', 'LineWidth', 4)
% title('IEEE 30 bus')
% y1 = yline(RMSE_abs_monte_30,'b--', 'LineWidth', 3,'DisplayName','mean value of RMSE')
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
% for k = 1:size(RMSE_abs_LSE_118,2)
%     p1 = plot(Ang_variation, ((RMSE_abs_LSE_118(:,k)*RMSE_abs_monte_118)/0.00131378544431781),'r','LineWidth', 2);
%     hold on;
%     p2 = plot(Ang_variation, RMSE_abs_NLS_118(:,k),'k','LineWidth', 2);
%     hold on;
% end
% title('IEEE 118 bus')
% y1 = yline(RMSE_abs_monte_118,'b--', 'LineWidth', 3,'DisplayName','mean value of RMSE')
% % xticklabels({'2' '3', '4', '5'});
% legend([p1 p2 y1],'RMSE with LSE states','RMSE with NLS states', 'mean value of RMSE')
% grid on;
% 
% set(gca, 'LineWidth', 2)
% set(gca, 'Box', 'on', 'LineWidth', 2)
% set(gca, 'FontSize', 30, 'FontName', 'Times New Roman','FontWeight', 'bold')
% xlabel(t,'Spoofing angle (deg)','FontSize', 50, 'FontName', 'Times New Roman','FontWeight', 'bold')
% ylabel(t,'RMSE (pu)','FontSize', 50, 'FontName', 'Times New Roman','FontWeight', 'bold')

%%%% RMSE angle
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
% considering the PMU is spoofed with 0.4 deg i.e., Ang_var(31)

% load("res_20250108_30_FullCOr_-1_to_1.mat")
% PA_threshold = 0.1249;

load("res_20250108_118_FullCOr_-1_to_1.mat")
PA_threshold= 0.1028;


PMUs_spoofed_matrix_LSE = zeros(1000,size(PA_LSE,2));
PMUs_spoofed_matrix_NLS = zeros(1000,size(PA_LSE,2));

for t = 1:size(PA_LSE,2)
    PMUs_spoofed_matrix_LSE(:,t) = Monte_result{2,1}{29,t};
    PMUs_spoofed_matrix_NLS(:,t) = Monte_result{6,1}{29,t};
end


figure('Name','Box plot of PA with GSA and with mitigation of GSA')
t = tiledlayout(1,2,'TileSpacing','loose');

% Tile 1
HA(1) = nexttile
boxplot(PMUs_spoofed_matrix_LSE)
yline(PA_threshold,'g', 'LineWidth', 5,'DisplayName','PA threshold')
title('PA with GSA')
% xticklabels({'2' '3', '6', '10', '11', '12', '15', '20', '23', '25', '27', '28', '29'});
xticklabels({'5' '11', '28', '35', '40', '56', '62', '77', '83', '90', '94', '108', '114'});
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
xticklabels({'5' '11', '28', '35', '40', '56', '62', '77', '83', '90', '94', '108', '114'});
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


% return

%% PA after NLS with counter
% This counter will only give spoofing alert only spoofing attack persist
% for 6 times (counter limit)


% PA_after_NLS_with_counter = [];
% 
% for u = 1:size(PMUs_spoofed_matrix_NLS,2)
%     PA = PMUs_spoofed_matrix_NLS(:,u);
%     counter = 0;
%     PA_ext = [];
%     y_ind = [];
%     for y = 1:length(PA)
%         if PA(y) > PA_threshold
%             counter = counter+1;
%             PA_ext = [PA_ext; PA(y)];
%             y_ind = [y_ind y];
%         elseif counter ~= 0
%             counter = counter-1;
%         end
%         if counter == 0 & ~isempty(y_ind) | counter ~= 0 & y == length(PA)
%             value = min(PA):0.0001:PA_threshold;
%             PA(y_ind) = value(randi(length(value)))*ones(length(y_ind),1);
%             PA_ext = [];
%             y_ind = [];
%         end
%         if counter == 5
%             y_ind
%             counter = 0;
%             PA_ext = [];
%             y_ind = [];
%         end
% 
%     end
% 
%     PA_after_NLS_with_counter = [PA_after_NLS_with_counter PA];
% end

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




