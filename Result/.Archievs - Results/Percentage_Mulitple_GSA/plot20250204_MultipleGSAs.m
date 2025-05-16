clc
clear
close all

load("res_20250207_30_Multiple_GSAs_inadequate_Chi_rand.mat")
no_spoofed_PMUs = [0 1 2 3 4 5];

plot(no_spoofed_PMUs,Chi_with_correct_weights_mean,'DisplayName','True \chi^2' , 'Color', 'k','LineWidth', 7);
hold on;
plot(no_spoofed_PMUs,Chi_with_adequate_weights_mean,'DisplayName','Estimated \chi^2' , 'Color', 'r','LineWidth',7);
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


%% BOX Plotting

% 
Chi_with_ad_matrix = zeros(1000,length(Chi_with_correct));
Chi_with_cor_matrix = zeros(1000,length(Chi_with_correct));

for t = 1:length(Chi_with_correct)
    Chi_with_ad_matrix(:,t) = Chi_with_adequate_weights{t,1};
    Chi_with_cor_matrix(:,t) = Chi_with_correct{t,1};
end

%% Perfect box plot

% boxplot(Chi_with_cor_matrix)
% % yline(PA_threshold,'g', 'LineWidth', 5,'DisplayName','PA threshold')
% % title('PA with spoofing')
% xticklabels({'0', '1', '2' '3', '4', '5'});
% legend("show",'Location','northwest')
% % grid on;
% % set(gca, 'LineWidth', 2)
% % set(gca, 'Box', 'on', 'LineWidth', 2)
% % set(gca, 'FontSize', 30, 'FontName', 'Times New Roman','FontWeight', 'bold')
% % set(findobj(gcf, 'tag', 'Box'), 'LineWidth', 2);       % Boxes
% % set(findobj(gcf, 'tag', 'Median'), 'LineWidth', 2);    % Median lines
% % % set(findobj(gcf, 'tag', 'Whisker'), 'LineWidth', 200);   % Whiskers
% % set(findobj(gcf, 'tag', 'Outliers'), 'MarkerSize', 8); % Outliers
% % set(findobj(gca, 'Tag', 'Upper Whisker'), 'LineWidth', 2); % Upper whisker
% % set(findobj(gca, 'Tag', 'Lower Whisker'), 'LineWidth', 2); % Lower whisker
% % set(findobj(gca, 'Tag', 'Upper Adjacent Value'), 'LineWidth', 2); % Max line
% % set(findobj(gca, 'Tag', 'Lower Adjacent Value'), 'LineWidth', 2); % Min line
% 
% 
% hold on
% boxplot(Chi_with_ad_matrix)
% % yline(PA_threshold,'g', 'LineWidth', 5,'DisplayName','PA threshold')
% % title('PA with spoofing')
% xticklabels({'0', '1', '2' '3', '4', '5'});

% t = tiledlayout(1,2,'TileSpacing','loose');
% 
% % Tile 1
% HA(1) = nexttile
% boxplot(Chi_with_cor_matrix)
% % yline(PA_threshold,'g', 'LineWidth', 5,'DisplayName','PA threshold')
% % title('PA with spoofing')
% % xticklabels({'2' '3', '4', '5'});
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
% boxplot(Chi_with_ad_matrix)
% % yline(PA_threshold,'g', 'LineWidth', 5,'DisplayName','PA threshold')
% % ylim([0.08 0.12])
% % title('PA after correction')
% % xticklabels({'2' '3', '4', '5'});
% grid on;
% legend("show",'Location','northwest')
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
% ylabel(t,'Principal Angle (deg)','FontSize', 50, 'FontName', 'Times New Roman','FontWeight', 'bold')
