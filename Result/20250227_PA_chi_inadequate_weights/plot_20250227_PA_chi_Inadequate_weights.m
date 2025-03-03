clc
clear
close all

% load("res_20250227_PA_Chi_inadequate_weights_IEEE_30.mat")
load("res_PA_Chi_inadequate_weights_IEEE_30_0spf.mat")
no_spoofed_PMUs = [0 1 2 3 4 5];

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


Chi_with_correct = zeros(1000,length(Chi_with_correct_weights));
Chi_with_inadequate = zeros(1000,length(Chi_with_correct_weights));

for t = 1:length(Chi_with_correct_weights)
    Chi_with_correct(:,t) = Chi_with_correct_weights{t,1};
    Chi_with_inadequate(:,t) = Chi_with_inadequate_weights{t,1};
end

%% Comparative BOX Plotting

% % Number of data points per boxplot
% num_samples = 1000;
% 
% % Prepare data for boxplot
% data = []; % To store flattened data
% group = []; % X-axis grouping
% category = []; % To differentiate d1 & d2
% 
% for i = 1:length(no_spoofed_PMUs)
%     % Extract first 100 rows at each x point for d1 and d2
%     temp_d1 = Chi_with_correct(1:end, i);
%     temp_d2 = Chi_with_inadequate(1:end, i);
% 
%     % Append to data array
%     data = [data; temp_d1; temp_d2];
% 
%     % Create group labels for x-axis points (repeat for d1 & d2)
%     group = [group; repmat(no_spoofed_PMUs(i), num_samples*2, 1)];
% 
%     % Label 'd1' as 1 and 'd2' as 2 for color grouping
%     category = [category; repmat("Chi_with_inadequate", num_samples, 1); repmat("Chi_with_correct", num_samples, 1)];
% end
% 
% % Create grouped boxplot
% figure;
% boxchart(categorical(group), data, 'GroupByColor', category);
% 
% % Customize appearance
% xlabel('X-axis Points');
% ylabel('Values');
% title('Box Plot Comparison of d1 and d2 at Each X-Axis Point');
% legend({'Chi_with_inadequate', 'Chi_with_correct'}, 'Location', 'northeast');
% 
% % Show grid for clarity
% grid on;


%% Box plot of chi square

figure('Name','box plot of Chi square')

chi_threshold_70 = 61.0305;
chi_threshold_90 = 69.9185;
t = tiledlayout(1,2,'TileSpacing','loose');

% 

% Tile 1
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

% Tile 2
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
PA_with_correct = zeros(1000,length(PA_with_inadequate_weights));
PA_with_inadequate = zeros(1000,length(PA_with_inadequate_weights));
PA_without = zeros(1000,length(PA_with_inadequate_weights));

for t = 1:length(PA_with_inadequate_weights)
    PA_with_correct(:,t) = PA_with_correct_weights{t,1}; 
    PA_with_inadequate(:,t) = PA_with_inadequate_weights{t,1};
    PA_without(:,t) = PA_without_weights{t,1};
end


figure('Name','box plot of PA test')

PA_threshold_70_without_weights = 0.2058;
PA_threshold_90_without_weights = 0.2220;
t = tiledlayout(1,2,'TileSpacing','loose');

% 
% figure(3)
% Tile 1
HA(1) = nexttile
boxplot(PA_without)
yline(PA_threshold_70_without_weights,'g', 'LineWidth', 5,'DisplayName','PA threshold at 70% CI')
yline(PA_threshold_90_without_weights,'r', 'LineWidth', 5,'DisplayName','PA threshold at 90% CI')
title('PA without weights')
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


PA_threshold_70_with_correct_weights = 0.1255;
PA_threshold_90_with_correct_weights = 0.1345;
% Tile 2
HA(2) = nexttile
boxplot(PA_with_inadequate)
yline(PA_threshold_70_with_correct_weights,'g', 'LineWidth', 5,'DisplayName','PA threshold at 70% CI')
yline(PA_threshold_90_with_correct_weights,'r', 'LineWidth', 5,'DisplayName','PA threshold at 90% CI')
title('PA with inconsistence weights')
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
ylabel(t,'Principal Angle (deg)','FontSize', 50, 'FontName', 'Times New Roman','FontWeight', 'bold')

