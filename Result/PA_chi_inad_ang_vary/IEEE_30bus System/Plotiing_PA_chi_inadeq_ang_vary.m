clc
clear all
close all

% load("PA_Chi_inadequate_weights_weig_0.1to2.mat")
% load("PA_Chi_inadequate_weights_weg0.1.mat")
% load("PA_Chi_inadequate_weights_weg2.mat")
% load("PA_Chi_inadequate_weights_weig_0.1to2_baise_error.mat")
load("PA_Chi_inadequate_weights_with_baise_error.mat")


% spf_ang_variation = 0:0.1:1;
spf_ang_variation = 1:1:6

Chi_with_correct_weights = cell2mat(Chi_with_correct_weights);
% PA_with_correct_weights = cell2mat(PA_with_correct_weights)
PA_without_weights = cell2mat(PA_without_weights);

Chi_with_inadequate_weights = cell2mat(Chi_with_inadequate_weights);
PA_with_inadequate_weights = cell2mat(PA_with_inadequate_weights);
%% With Correct weights



% figure('Name','With corect weiths')
% hold on;
% 
% % Left y-axis (for d1)
% yyaxis left;
% h1 = boxplot(Chi_with_correct_weights(:,1:6), 'Positions', spf_ang_variation - 0.15, 'Widths', 0.3, 'Colors', 'b'); % Blue for d1
% set(h1, {'MarkerEdgeColor'}, {'b'});
% ylabel('\chi with correct weights');
% % ylim([min(Chi_with_correct_weights(:))-0.1, max(Chi_with_correct_weights(:))+0.1]); % Adjust limits
% ylim([28,190])
% yline(83.4094,'b','LineWidth',5,'DisplayName','\chi^2 threshold')
% yticks([40, 60, 83.4094, 100, 120, 140, 160,  180]);
% 
% 
% 
% % Right y-axis (for d2)
% yyaxis right;
% % boxplot(PA_with_correct_weights, 'Positions', spf_ang_variation + 0.15, 'Widths', 0.3, 'Colors', 'r'); % Red for d2
% boxplot(PA_without_weights(:,1:6), 'Positions', spf_ang_variation + 0.15, 'Widths', 0.3, 'Colors', 'r'); % Red for d2
% ylabel('PA without weights');
% % ylim([min(PA_without_weights(:))-0.1, max(PA_without_weights(:))+0.1]); % Adjust limits
% ylim([0.142,0.325])
% yline(0.20563,'r','LineWidth',5,'DisplayName','PA threshold')
% yticks([0.15, 0.18, 0.20563, 0.25, 0.28, 0.3, 0.32]);
% 
% 
% 
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
% % Customize appearance
% xlabel('Attack angle (deg)');
% title('Computation of PA without weights and \chi^2 with correct weights');
% xticks(spf_ang_variation);
% xticklabels({'0', '0.1', '0.2' '0.3', '0.4', '0.5'});
% legend({'\chi^2 threshold', 'PA threshold'}, 'Location', 'northwest');
% 
% % Grid on
% grid on;
% hold off;
% 
% 
% %% With Inadequate weigths

% 
% figure('Name','With inadequate weiths')
% hold on;
% 
% % Left y-axis (for d1)
% yyaxis left;
% h2 = boxplot(Chi_with_inadequate_weights(:,1:6), 'Positions', spf_ang_variation - 0.15, 'Widths', 0.3, 'Colors', 'b'); % Blue for d1
% ylabel('Chi with inadequate weights');
% % ylim([min(Chi_with_inadequate_weights(:))-0.1, max(Chi_with_inadequate_weights(:))+0.1]); % Adjust limits
% ylim([26,370])
% yline(83.4094,'b','LineWidth',5,'DisplayName','\chi^2 threshold')
% set(h2, {'MarkerEdgeColor'}, {'b'});
% yticks([50, 83.4094, 100, 150, 200, 250,  300, 350, 400]);
% 
% 
% % Right y-axis (for d2)
% yyaxis right;
% boxplot(PA_with_inadequate_weights(:,1:6), 'Positions', spf_ang_variation + 0.15, 'Widths', 0.3, 'Colors', 'r'); % Red for d2
% ylabel('PA with inadequate weights');
% % ylim([min(PA_with_inadequate_weights(:))-0.1, max(PA_with_inadequate_weights(:))+0.1]); % Adjust limits
% ylim([0.06,0.43])
% yline(0.1254,'r','LineWidth',5,'DisplayName','PA threshold')
% yticks([0.06, 0.1254, 0.18, 0.25, 0.28, 0.3, 0.32, 0.35]);
% 
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
% 
% % Customize appearance
% xlabel('Attack angle (deg)');
% title('Computation of PA and \chi^2 with inadequate weights');
% xticks(spf_ang_variation);
% xticklabels({'0', '0.1', '0.2' '0.3', '0.4', '0.5'});
% legend({'\chi^2 threshold', 'PA threshold'}, 'Location', 'northwest');
% 
% % Grid on
% grid on;
% hold off;

%% PA with unit weights and Chi square with inadequate weights



% figure('Name','With corect weiths')
% hold on;
% 
% yyaxis left;
% h2 = boxplot(Chi_with_inadequate_weights(:,1:6), 'Positions', spf_ang_variation - 0.15, 'Widths', 0.3, 'Colors', 'b'); % Blue for d1
% ylabel('Chi with inadequate weights');
% % ylim([min(Chi_with_inadequate_weights(:))-0.1, max(Chi_with_inadequate_weights(:))+0.1]); % Adjust limits
% ylim([26,345])
% % yline(83.4094,'b','LineWidth',5,'DisplayName','\chi^2 threshold')
% yline(116.77316,'b','LineWidth',5,'DisplayName','\chi^2 threshold')
% set(h2, {'MarkerEdgeColor'}, {'b'});
% yticks([50, 83.4094, 100, 116.77316, 150, 200, 250,  300, 350, 400]);
% 
% 
% 
% % Right y-axis (for d2)
% yyaxis right;
% % boxplot(PA_with_correct_weights, 'Positions', spf_ang_variation + 0.15, 'Widths', 0.3, 'Colors', 'r'); % Red for d2
% boxplot(PA_without_weights(:,1:6), 'Positions', spf_ang_variation + 0.15, 'Widths', 0.3, 'Colors', 'r'); % Red for d2
% ylabel('PA with unit weights');
% % ylim([min(PA_without_weights(:))-0.1, max(PA_without_weights(:))+0.1]); % Adjust limits
% ylim([0.142,0.5])
% yline(0.20563,'r','LineWidth',5,'DisplayName','PA threshold')
% yticks([0.15, 0.18, 0.20563, 0.25, 0.28, 0.3, 0.32]);
% 
% 
% 
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
% % Customize appearance
% xlabel('Attack angle (deg)');
% title('Computation of PA with unit weights and \chi^2 with inadequate weights');
% xticks(spf_ang_variation);
% xticklabels({'0', '0.1', '0.2' '0.3', '0.4', '0.5'});
% legend({'\chi^2 threshold', 'PA threshold'}, 'Location', 'northwest');
% 
% % Grid on
% grid on;
% hold off;



%% PA and Chi square with inadequate weights

figure('Name','With Inadequate weigths')
hold on;

yyaxis left;
h2 = boxplot(Chi_with_inadequate_weights(:,1:6), 'Positions', spf_ang_variation - 0.15, 'Widths', 0.3, 'Colors', 'b');
ylabel('Chi with inadequate weights');
% ylim([min(Chi_with_inadequate_weights(:))-0.1, max(Chi_with_inadequate_weights(:))+0.1]); % Adjust limits
ylim([26,345])
yline(83.4094,'b','LineWidth',5,'DisplayName','\chi^2 threshold')
yline(116.77316,'b--','LineWidth',5,'DisplayName','Increased \chi^2 threshold')
set(h2, {'MarkerEdgeColor'}, {'b'});
yticks([50, 83.4094, 100, 116.77316, 150, 200, 250,  300, 350, 400]);



yyaxis right;
boxplot(PA_with_inadequate_weights(:,1:6), 'Positions', spf_ang_variation + 0.15, 'Widths', 0.3, 'Colors', 'r'); 
ylabel('PA with inadequate weights');
ylim([0.06,0.43])
yline(0.1254,'r','LineWidth',5,'DisplayName','PA threshold')
yline(0.11286,'r--','LineWidth',5,'DisplayName','Decreased PA threshold')
yticks([0.06, 0.11286, 0.1254, 0.18, 0.25, 0.28, 0.3, 0.32, 0.35]);



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

% Customize appearance
xlabel('Attack angle (deg)');
title('Computation of PA and \chi^2 with inadequate weights');
xticks(spf_ang_variation);
xticklabels({'0', '0.1', '0.2' '0.3', '0.4', '0.5'});
legend({'\chi^2 threshold', 'Increased \chi^2 threshold', 'PA threshold','Decreased PA threshold'}, 'Location', 'northwest');
lgd = legend;
% Grid on
grid on;
hold off;