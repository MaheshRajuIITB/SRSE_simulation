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

load("res_20250109_30_Multiple_GSAs.mat")
% load("res_20250210_ Multiple_GSAs_IEEE_30.mat")
% load("res_20250113_30_Percent_Multiple_GSAs.mat")
PA_threshold = 0.1249

% RMSE_abs_monte = 0.001164;
% PA_threshold_monte = 0.119319;
% PA_threshold_chi = 0.1464;
% % Chi_monte = 55.9
% % Chi_thre = 83.5134
% 
% RMSE_ang_monte = 0.0908;


%% IEEE-118 bus system
% load("res_20250110_118_Multiple_GSAs.mat")
% load("res_20250113_118_Percent_Multiple_GSAs.mat")
% load("res_20250210_ Multiple_GSAs_IEEE_118.mat")
% PA_threshold = 0.1028;

% RMSE_abs_monte = 0.00131;
% PA_threshold_monte = 0.10066;
% PA_threshold_chi = 0.110144;
% Chi_monte = 316.2
% Chi_thre = chi2inv(0.99,2*(276 - 118))

% RMSE_ang_monte = 0.1482;



%% BOX Plotting

PMUs_spoofed_matrix_LSE = zeros(1000,length(PA_LSE_monte));
PMUs_spoofed_matrix_NLS = zeros(1000,length(PA_NLS_monte));

for t = 1:length(PA_LSE_monte)
    PMUs_spoofed_matrix_LSE(:,t) = PA_LSE_monte{t,1};
    PMUs_spoofed_matrix_NLS(:,t) = PA_NLS_monte{t,1};
end

%% Perfect box plot

t = tiledlayout(1,2,'TileSpacing','loose');

% Tile 1
HA(1) = nexttile
boxplot(PMUs_spoofed_matrix_LSE)
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

% Tile 2
HA(2) = nexttile
boxplot(PMUs_spoofed_matrix_NLS)
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

% aa.Position(1)= 200000;
xlabel(t,'Number of spoofed PMUs','FontSize', 50, 'FontName', 'Times New Roman','FontWeight', 'bold')
ylabel(t,'Principal Angle (deg)','FontSize', 50, 'FontName', 'Times New Roman','FontWeight', 'bold')


%% Box plot for RMSE



% RMSE_abs_LSE = zeros(1000,length(RMSE_LSE_abs_monte))
% RMSE_abs_NLS = zeros(1000,length(RMSE_LSE_abs_monte))
% 
% for t = 1:length(PA_LSE_monte)
%     RMSE_abs_LSE(:,t) = RMSE_LSE_abs_monte{t,1};
%     RMSE_abs_NLS(:,t) = RMSE_NLS_abs_monte{t,1};
% end
% 
% 
% t = tiledlayout(1,2,'TileSpacing','loose');
% 
% % Tile 1
% HA(1) = nexttile
% boxplot(RMSE_abs_LSE)
% yline(RMSE_abs_monte,'g', 'LineWidth', 5,'DisplayName','PA threshold')
% title('RMSE before Correction')
% % xticklabels({'2' '3', '4', '5'});
% % legend("show",'Location','northwest')
% grid on;
% set(gca, 'LineWidth', 2)
% set(gca, 'Box', 'on', 'LineWidth', 2)
% set(gca, 'FontSize', 30, 'FontName', 'Times New Roman','FontWeight', 'bold')
% set(findobj(gcf, 'tag', 'Box'), 'LineWidth', 2);       % Boxes
% set(findobj(gcf, 'tag', 'Median'), 'LineWidth', 2);    % Median lines
% % set(findobj(gcf, 'tag', 'Whisker'), 'LineWidth', 200);   % Whiskers
% set(findobj(gcf, 'tag', 'Outliers'), 'MarkerSize', 8); % Outliers
% set(findobj(gca, 'Tag', 'Upper Whisker'), 'LineWidth', 2); % Upper whisker
% set(findobj(gca, 'Tag', 'Lower Whisker'), 'LineWidth', 2); % Lower whisker
% set(findobj(gca, 'Tag', 'Upper Adjacent Value'), 'LineWidth', 2); % Max line
% set(findobj(gca, 'Tag', 'Lower Adjacent Value'), 'LineWidth', 2); % Min line
% 
% % Tile 2
% HA(2) = nexttile
% boxplot(RMSE_abs_NLS)
% yline(RMSE_abs_monte,'g', 'LineWidth', 5,'DisplayName','PA threshold')
% % ylim([0.08 0.12])
% title('RMSE after correction')
% % xticklabels({'2' '3', '4', '5'});
% grid on;
% % legend("show",'Location','northwest')
% set(gca, 'LineWidth', 2)
% set(gca, 'Box', 'on', 'LineWidth', 2)
% set(gca, 'FontSize', 30, 'FontName', 'Times New Roman','FontWeight', 'bold')
% set(findobj(gcf, 'tag', 'Box'), 'LineWidth', 2);       % Boxes
% set(findobj(gcf, 'tag', 'Median'), 'LineWidth', 2);    % Median lines
% % set(findobj(gcf, 'tag', 'Whisker'), 'LineWidth', 200);   % Whiskers
% set(findobj(gcf, 'tag', 'Outliers'), 'MarkerSize', 8); % Outliers
% set(findobj(gca, 'Tag', 'Upper Whisker'), 'LineWidth', 2); % Upper whisker
% set(findobj(gca, 'Tag', 'Lower Whisker'), 'LineWidth', 2); % Lower whisker
% set(findobj(gca, 'Tag', 'Upper Adjacent Value'), 'LineWidth', 2); % Max line
% set(findobj(gca, 'Tag', 'Lower Adjacent Value'), 'LineWidth', 2); % Min line
% 
% % aa.Position(1)= 200000;
% xlabel(t,'Number of spoofed PMUs','FontSize', 50, 'FontName', 'Times New Roman','FontWeight', 'bold')
% ylabel(t,'RMSE (pu)','FontSize', 50, 'FontName', 'Times New Roman','FontWeight', 'bold')

%% Percentage spoofed PMUs case

% load('res_20250113_combined_PA_NLS.mat')
% 
% PA_threshold_30 = 0.1249;
% PA_threshold_118 = 0.1028;
% 
% t = tiledlayout(1,2,'TileSpacing','loose');
% 
% % Tile 1
% HA(1) = nexttile
% boxplot(PMUs_spoofed_matrix_NLS_30(:,1:5))
% yline(PA_threshold_30,'g', 'LineWidth', 5,'DisplayName','PA threshold')
% title('IEEE 30 bus system')
% xticklabels({'10%' '20%', '30%', '40%','50%','60%','70%','80%','90%'});
% legend("show",'Location','northwest')
% grid on;
% set(gca, 'LineWidth', 2)
% set(gca, 'Box', 'on', 'LineWidth', 2)
% set(gca, 'FontSize', 30, 'FontName', 'Times New Roman','FontWeight', 'bold')
% set(findobj(gcf, 'tag', 'Box'), 'LineWidth', 2);       % Boxes
% set(findobj(gcf, 'tag', 'Median'), 'LineWidth', 2);    % Median lines
% % set(findobj(gcf, 'tag', 'Whisker'), 'LineWidth', 200);   % Whiskers
% set(findobj(gcf, 'tag', 'Outliers'), 'MarkerSize', 8); % Outliers
% set(findobj(gca, 'Tag', 'Upper Whisker'), 'LineWidth', 2); % Upper whisker
% set(findobj(gca, 'Tag', 'Lower Whisker'), 'LineWidth', 2); % Lower whisker
% set(findobj(gca, 'Tag', 'Upper Adjacent Value'), 'LineWidth', 2); % Max line
% set(findobj(gca, 'Tag', 'Lower Adjacent Value'), 'LineWidth', 2); % Min line
% 
% % Tile 2
% HA(2) = nexttile
% boxplot(PMUs_spoofed_matrix_NLS_118(:,1:5))
% yline(PA_threshold_118,'g', 'LineWidth', 5,'DisplayName','PA threshold')
% % ylim([0.08 0.12])
% title('IEEE 118 bus system')
% xticklabels({'10%' '20%', '30%', '40%','50%','60%','70%','80%','90%'});
% grid on;
% ylim([0.08 0.12])
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
xlabel(t,'Percentage of spoofed PMUs','FontSize', 50, 'FontName', 'Times New Roman','FontWeight', 'bold')
ylabel(t,'Principal Angle (deg)','FontSize', 50, 'FontName', 'Times New Roman','FontWeight', 'bold')