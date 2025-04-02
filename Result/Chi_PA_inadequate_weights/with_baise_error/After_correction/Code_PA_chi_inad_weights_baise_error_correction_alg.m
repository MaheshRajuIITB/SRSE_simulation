clc
clear
close all


% load("PA_Chi_inad_weights_baise_error_after_correction_alg_without_MCF.mat")
% load("PA_Chi_inad_weights_baise_error_after_correction_alg_without_PACF.mat")
% load("PA_Chi_inad_weights_baise_error_after_correction_alg_with_MCF_PACF.mat")
load("PA_Chi_inad_weights_baise_error_after_correction_alg_with_MCF_PACF_ang_0to10.mat")




Spoofing_angle = 0:0.1:10;
small_spf_ang = 1:1:11; %for 0 to 1 with step of 0.1
spf_ang_variation = small_spf_ang
large_spf_ang = 1:10:101; %for 0 to 10 with step of 1


Chi_with_inadequate_weights = cell2mat(Chi_with_inadequate_weights);
PA_with_inadequate_weights = cell2mat(PA_with_inadequate_weights);

SRSE_Chi_with_inadequate_weights = cell2mat(SRSE_Chi_with_inadequate_weights);
SRSE_PA_with_inadequate_weights = cell2mat(SRSE_PA_with_inadequate_weights);

%% Computation of PA and Chi square with inadequate weights before correction algorithm

figure('Name','With Inadequate weigths before correction algorithm')
hold on;

yyaxis left;
h2 = boxplot(Chi_with_inadequate_weights(:,small_spf_ang), 'Positions', spf_ang_variation - 0.15, 'Widths', 0.3, 'Colors', 'b');
ylabel('Chi with inadequate weights');
% ylim([min(Chi_with_inadequate_weights(:))-0.1, max(Chi_with_inadequate_weights(:))+0.1]); % Adjust limits
% ylim([26,345])
yline(83.4094,'b','LineWidth',5,'DisplayName','\chi^2 threshold')
yline(116.77316,'b--','LineWidth',5,'DisplayName','Increased \chi^2 threshold')
set(h2, {'MarkerEdgeColor'}, {'b'});
% yticks([50, 83.4094, 100, 116.77316, 150, 200, 250,  300, 350, 400]);



yyaxis right;
boxplot(PA_with_inadequate_weights(:,small_spf_ang), 'Positions', spf_ang_variation + 0.15, 'Widths', 0.3, 'Colors', 'r'); 
ylabel('PA with inadequate weights');
% ylim([0.06,0.43])
yline(0.1254,'r','LineWidth',5,'DisplayName','PA threshold')
yline(0.11286,'r--','LineWidth',5,'DisplayName','Decreased PA threshold')
% yticks([0.06, 0.11286, 0.1254, 0.18, 0.25, 0.28, 0.3, 0.32, 0.35]);



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
xticklabels({'0', '0.1', '0.2' '0.3', '0.4', '0.5', '0.6', '0.7', '0.8', '0.9', '1'});
% xticklabels({'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '10'});
legend({'\chi^2 threshold', 'Increased \chi^2 threshold', 'PA threshold','Decreased PA threshold'}, 'Location', 'northwest');
lgd = legend;
% Grid on
grid on;
hold off;



%% Computation of PA and Chi with inadequate weights after correction

figure('Name','With Inadequate weigths after correction algorithm')
hold on;

yyaxis left;
h3 = boxplot(SRSE_Chi_with_inadequate_weights(:,small_spf_ang), 'Positions', spf_ang_variation - 0.15, 'Widths', 0.3, 'Colors', 'b');
ylabel('Chi with inadequate weights');
% ylim([min(Chi_with_inadequate_weights(:))-0.1, max(Chi_with_inadequate_weights(:))+0.1]); % Adjust limits
% ylim([26,345])
yline(83.4094,'b','LineWidth',5,'DisplayName','\chi^2 threshold')
yline(116.77316,'b--','LineWidth',5,'DisplayName','Increased \chi^2 threshold')
set(h3, {'MarkerEdgeColor'}, {'b'});
% yticks([50, 83.4094, 100, 116.77316, 150, 200, 250,  300, 350, 400]);



yyaxis right;
boxplot(SRSE_PA_with_inadequate_weights(:,small_spf_ang), 'Positions', spf_ang_variation + 0.15, 'Widths', 0.3, 'Colors', 'r'); 
ylabel('PA with inadequate weights');
% ylim([0.06,0.43])
yline(0.1254,'r','LineWidth',5,'DisplayName','PA threshold')
yline(0.11286,'r--','LineWidth',5,'DisplayName','Decreased PA threshold')
% yticks([0.06, 0.11286, 0.1254, 0.18, 0.25, 0.28, 0.3, 0.32, 0.35]);



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
xticklabels({'0', '0.1', '0.2' '0.3', '0.4', '0.5', '0.6', '0.7', '0.8', '0.9', '1'});
% xticklabels({'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '10'});
legend({'\chi^2 threshold', 'Increased \chi^2 threshold', 'PA threshold','Decreased PA threshold'}, 'Location', 'northwest');
lgd = legend;
% Grid on
grid on;
hold off;



%% Combined of PA and Chi before and after correction

% Create figure for combined plot
figure('Name', 'Combined PA and Chi Square Before and After Correction');
hold on;

% Create positions for the four boxplots at each x-point
% We'll offset each box by a specific amount
offset1 = -0.3;  % Chi before correction
offset2 = -0.1;  % PA before correction
offset3 = 0.1;   % Chi after correction
offset4 = 0.3;   % PA after correction

% Create subplot for Chi Square values
yyaxis left;
% Chi before correction (blue)
h1 = boxplot(Chi_with_inadequate_weights(:,small_spf_ang), 'Positions', spf_ang_variation + offset1, 'Widths', 0.15, 'Colors', 'b');
set(h1, 'LineWidth', 2,{'MarkerEdgeColor'}, {'b'});
% Add a unique tag to identify this box plot in the legend
% h = findobj(gca,'Tag','Box');
% for j=1:length(h)
%     patch(get(h(j),'XData'),get(h(j),'YData'),'b','FaceAlpha',0.3, 'DisplayName', 'Chi before');
% end

% Chi after correction (cyan)
h2 = boxplot(SRSE_Chi_with_inadequate_weights(:,small_spf_ang), 'Positions', spf_ang_variation + offset3, 'Widths', 0.15, 'Colors', 'b');
set(h2, 'LineWidth', 2,{'MarkerEdgeColor'}, {'b'});
% Add a unique tag to identify this box plot in the legend
% h = findobj(gca,'Tag','Box');
% for j=1:length(h)/2  % Only color the new boxes (half of the total)
%     patch(get(h(j),'XData'),get(h(j),'YData'),'c','FaceAlpha',0.3, 'DisplayName', 'Chi after');
% end

ylabel('Chi-square value', 'FontSize', 24);
yline(83.4094,'b','LineWidth',3,'DisplayName','\chi^2 threshold');
% yline(116.77316,'b--','LineWidth',3,'DisplayName','Increased \chi^2 threshold');

% Create subplot for PA values
yyaxis right;
% PA before correction (red)
h3 = boxplot(PA_with_inadequate_weights(:,small_spf_ang), 'Positions', spf_ang_variation + offset2, 'Widths', 0.15, 'Colors', 'r');
set(h3, 'LineWidth', 2);
% Add a unique tag to identify this box plot in the legend
% h = findobj(gca,'Tag','Box');
% for j=1:length(h)/3  % Only color the new boxes
%     patch(get(h(j),'XData'),get(h(j),'YData'),'r','FaceAlpha',0.3, 'DisplayName', 'PA before');
% end

% PA after correction (magenta)
h4 = boxplot(SRSE_PA_with_inadequate_weights(:,small_spf_ang), 'Positions', spf_ang_variation + offset4, 'Widths', 0.15, 'Colors', 'r');
set(h4, 'LineWidth', 2);
% Add a unique tag to identify this box plot in the legend
% h = findobj(gca,'Tag','Box');
% for j=1:length(h)/4  % Only color the new boxes
%     patch(get(h(j),'XData'),get(h(j),'YData'),'m','FaceAlpha',0.3, 'DisplayName', 'PA after');
% end

ylabel('Performance Angle (PA)', 'FontSize', 24);
yline(0.1254,'r','LineWidth',3,'DisplayName','PA threshold');
% yline(0.11286,'r--','LineWidth',3,'DisplayName','Decreased PA threshold');

% Format the plot
set(gca, 'LineWidth', 2);
set(gca, 'Box', 'on', 'LineWidth', 2);
set(gca, 'FontSize', 24, 'FontName', 'Times New Roman', 'FontWeight', 'bold');
set(findobj(gcf, 'tag', 'Median'), 'LineWidth', 2);
set(findobj(gcf, 'tag', 'Outliers'), 'MarkerSize', 6);
set(findobj(gca, 'Tag', 'Upper Whisker'), 'LineWidth', 1.5);
set(findobj(gca, 'Tag', 'Lower Whisker'), 'LineWidth', 1.5);
set(findobj(gca, 'Tag', 'Upper Adjacent Value'), 'LineWidth', 1.5);
set(findobj(gca, 'Tag', 'Lower Adjacent Value'), 'LineWidth', 1.5);

% Create custom legend
% legend_entries = {'Chi before correction', 'Chi after correction', 'PA before correction', 'PA after correction', ...
%                  '\chi^2 threshold', 'Increased \chi^2 threshold', 'PA threshold', 'Decreased PA threshold'};
% colors = {'b', 'b', 'r', 'r', 'b', 'b', 'r', 'r'};
% line_styles = {'-', '-', '-', '-', '-', '--', '-', '--'};
% h_legend = zeros(length(legend_entries), 1);

% Create a separate axis for the legend
% ax_legend = axes('Position', [0.7, 0.8, 0.1, 0.1], 'Visible', 'off');
% for i = 1:4  % Box plot entries
%     h_legend(i) = patch([0 1 1 0], [0 0 1 1], colors{i}, 'Parent', ax_legend, 'FaceAlpha', 0.3);
% end
% for i = 5:8  % Line entries
%     h_legend(i) = line([0 1], [0 0], 'Parent', ax_legend, 'Color', colors{i}, 'LineStyle', line_styles{i}, 'LineWidth', 3);
% end
% legend(ax_legend, h_legend, legend_entries, 'FontSize', 16, 'Location', 'northwest');

% X-axis formatting
xlabel('Attack angle (deg)', 'FontSize', 24);
title('Comparison of PA and \chi^2 before and after correction', 'FontSize', 28);
xticks(spf_ang_variation);
% xticklabels({'0', '0.1', '0.2', '0.3', '0.4', '0.5', '0.6', '0.7', '0.8', '0.9', '1'});
xticklabels({'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '10'});
grid on;
hold off;

% % Add a text annotation to explain the box colors
% annotation('textbox', [0.15, 0.02, 0.7, 0.05], 'String', ...
%     'Blue: Chi before, Cyan: Chi after, Red: PA before, Magenta: PA after', ...
%     'FontSize', 16, 'FontName', 'Times New Roman', 'EdgeColor', 'none', ...
%     'HorizontalAlignment', 'center');





return

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



