clc; clear all; close all;

load('res_20250405_no_GSA_IEEE_30.mat')
LSE_PA_nspf = LSE_PA;
NLS_PA_nspf = NLS_PA;
% load('res_20250405_Single_GSA_IEEE_30.mat')
% load('res_20250405_Single_GSA_IEEE_30_with_0.4deg.mat')
% load('res_20250405_Single_GSA_IEEE_30_with_0.5deg.mat')
% load('res_20250405_Single_GSA_IEEE_30_with_0.6deg.mat')
load('res_20250405_Single_GSA_IEEE_30_with_0.7deg.mat')
% load('res_20250405_Single_GSA_IEEE_30_with_0.8deg.mat')
% load('res_20250405_Single_GSA_IEEE_30_with_0.9deg.mat')
% load('res_20250405_Single_GSA_IEEE_30_with_1deg.mat')
% load('res_20250405_Single_GSA_IEEE_30_with_1.5deg.mat')

% PA_threshold = 0.1249;
% PA_threshold = 0.133544832;
PA_threshold = 0.144324;
counter_set = 5;


%% Computation of PA for non-spoofed, spoofed and correction scenarios

false_postives = sum(LSE_PA_nspf > PA_threshold)
false_negative =  sum(LSE_PA < PA_threshold)
false_postives_after_correction = sum(NLS_PA > PA_threshold)

false_postives_after_counter_no_GSA = fun_20250405_PA_computation_with_counter(LSE_PA_nspf,PA_threshold,counter_set)
% NLS_PA_nspf_spoofed_instants = fun_20250405_PA_computation_with_counter(NLS_PA_nspf,PA_threshold,counter_set)
false_negative_after_counter_single_GSA = fun_20250405_PA_computation_with_counter(LSE_PA,PA_threshold,counter_set);
false_negative_after_counter_single_GSA = 1000 - false_negative_after_counter_single_GSA
false_postives_after_counter_correction = fun_20250405_PA_computation_with_counter(NLS_PA,PA_threshold,counter_set)


PA_threshold_99 = 0.144324;

figure('Name','PA for non-spoofed and spoofed secnarios')
h1 = boxplot([LSE_PA_nspf LSE_PA])

hold on
h2 = yline(PA_threshold,'g', 'LineWidth', 10,'DisplayName','PA threshold')
% h2 = yline(PA_threshold_99,'r', 'LineWidth', 10,'DisplayName','PA threshold')
xticks([1 2])
xticklabels({'No GSA','Single GSA'});
grid on;
% legend("show",'Location','northwest')
set(gca, 'LineWidth', 5)
set(gca, 'Box', 'on', 'LineWidth', 5)
set(gca, 'FontSize',70, 'FontName', 'Times New Roman','FontWeight', 'bold')
set(findobj(gcf, 'tag', 'Box'), 'LineWidth', 4);       % Boxes
set(findobj(gcf, 'tag', 'Median'), 'LineWidth', 4);    % Median lines
% set(findobj(gcf, 'tag', 'Whisker'), 'LineWidth', 200);   % Whiskers
set(findobj(gcf, 'tag', 'Outliers'), 'MarkerSize', 8); % Outliers
set(findobj(gca, 'Tag', 'Upper Whisker'), 'LineWidth', 4); % Upper whisker
set(findobj(gca, 'Tag', 'Lower Whisker'), 'LineWidth', 4); % Lower whisker
set(findobj(gca, 'Tag', 'Upper Adjacent Value'), 'LineWidth', 4); 
set(findobj(gca, 'Tag', 'Lower Adjacent Value'), 'LineWidth', 4); 

legend([h2], {'PA threshold'}, 'Location', 'northwest');
% xlabel('Location of PMU','FontSize', 40, 'FontName', 'Times New Roman','FontWeight', 'bold')
ylabel('Principal Angle (deg)','FontSize', 70, 'FontName', 'Times New Roman','FontWeight', 'bold')


%% PA as time series 

% sorted_LSE_PA_nspf = sort(LSE_PA_nspf)
% PA_without_spf_time_data = sorted_LSE_PA_nspf(1:250)

PA_without_spf_time_data = LSE_PA_nspf(1:250)
% PA_without_spf_time_data = LSE_PA_nspf(LSE_PA_nspf < PA_threshold)
% PA_without_spf_time_data = PA_without_spf_time_data(1:250)
spoofed_scenarios = fun_20250405_PA_computation_with_counter(PA_without_spf_time_data,PA_threshold,counter_set)

% sorted_LSE_PA_nspf = sort(LSE_PA)
% PA_with_spf_time_data = sorted_LSE_PA_nspf(251:end)
PA_with_spf_time_data = LSE_PA(251:500)
PA_time_data = [PA_without_spf_time_data; PA_with_spf_time_data]
x = 1:500;

figure('Name','PA with counter scheme')
h1 = plot(x,PA_time_data,'b', 'LineWidth', 2,'DisplayName','principal angle')
h2 = yline(PA_threshold,'g', 'LineWidth', 4,'DisplayName','PA threshold')
xline(255,'r', 'LineWidth', 2)
yticks([0.1 PA_threshold 0.2:0.1:0.6])
set(gca, 'LineWidth', 2)
set(gca, 'Box', 'on', 'LineWidth', 2)
set(gca, 'FontSize', 30, 'FontName', 'Times New Roman','FontWeight', 'bold')
% grid on
annotation('arrow', [0.539583333333333,0.9859375], [0.247916666666667,0.24375], 'LineWidth', 2, 'Color', 'r')
text(325, 0.18, 'Spoofing is detected', 'Color', 'red', 'FontSize', 30,'FontName', 'Times New Roman');
ylim([0.08 0.6])
lgd = legend([h1, h2], {'PA', 'PA_{threshold}'});
set(lgd, 'Position', [0.22 0.3 0.1 0.1]);
xlabel('Number of samples', 'FontSize', 40)
ylabel('Principal angle (deg)', 'FontSize', 40)


%%% Inset axes for zoomed area for non-spoofed scenario
% range_of_first_inset
p1 = 210;p2 = 220
x_zoom = x(x >= p1 & x <= p2);
y_zoom = PA_time_data(x >= p1 & x <= p2);

inset = axes('Position',[0.22 0.55 0.3 0.25]);  % [left bottom width height]
box on;
plot(x_zoom, y_zoom, 'b','LineWidth', 2);
yline(PA_threshold,'g', 'LineWidth', 3,'DisplayName','PA threshold')
title('Non-spoofing condition');
% xlim([99.5 110.5])
ylim([0.1 0.17])
yticks([0.1 0.12 PA_threshold])
grid on
Ct_value = 0;
PA_time_data_first_inset = PA_time_data(p1+1:p2);
display_point = max(PA_time_data_first_inset)+0.005;
text(p1,display_point, sprintf('ctr = '), 'Color', 'r','FontSize', 20)
Ct = PA_time_data_first_inset > PA_threshold
for h = 1:10
    if Ct(h) == 1
        Ct_value = Ct_value+1
        text((p1+h)-0.1,display_point, sprintf('%d', Ct_value), 'Color', 'r','FontSize', 20)
    else
        if Ct_value ~= 0
            Ct_value = Ct_value-1
        end
        text((p1+h)-0.1,display_point, sprintf('%d', Ct_value), 'Color', 'r','FontSize', 20)
    end
end

set(gca, 'LineWidth', 3)
set(gca, 'Box', 'on', 'LineWidth', 2)
set(gca, 'FontSize', 35, 'FontName', 'Times New Roman')
xticks([p1:p2]);


%%% Inset axes for zoomed area for non-spoofed scenario

x_zoom = x(x >= 250 & x <= 260);
y_zoom = PA_time_data(x >= 250 & x <= 260);


% inset = axes('Position',[0.6 0.35 0.2 0.2]);  % [left bottom width height]
inset = axes('Position',[0.62 0.55 0.3 0.25]);
box on;
plot(x_zoom, y_zoom, 'b','LineWidth', 2);
yline(PA_threshold,'g', 'LineWidth', 3,'DisplayName','PA threshold')
title('Spoofing condition');
% text([100 101], [PA_time_data(100) PA_time_data(101)], '[1 1]', 'Color', 'm');
% text(101, PA_time_data(100), '0', 'Color', 'm');
% xlim([250.5 270.5])
ylim([0.05 0.29]);
yticks([0.05 PA_threshold 0.25]);
text(250,0.27, sprintf('ctr = '), 'Color', 'r','FontSize', 20)
grid on
Ct_value = 0;
PA_time_data_251_260 = PA_time_data(251:260);
Ct = PA_time_data_251_260 > PA_threshold
for h = 1:10
    if Ct(h) == 1
        Ct_value = Ct_value+1
        text((250+h)-0.1,0.27, sprintf('%d', Ct_value), 'Color', 'r','FontSize', 20)
    else
        if Ct_value ~= 0
            Ct_value = Ct_value-1
        end
        text((250+h)-0.1,0.27, sprintf('%d', Ct_value), 'Color', 'r','FontSize', 20)
    end
end
xline(255,'r', 'LineWidth', 3)
set(gca, 'LineWidth', 2)
set(gca, 'Box', 'on', 'LineWidth', 2)
set(gca, 'FontSize', 35, 'FontName', 'Times New Roman')
xticks([250:260]);

set(gcf, 'Units', 'inches');
set(gcf, 'Position', [1, 1, 20, 9]);
% Configure print/export settings
set(gcf, 'PaperUnits', 'inches');
set(gcf, 'PaperPositionMode', 'manual');  % Manual mode
set(gcf, 'PaperPosition', [-0.07, -0.22, 21.33, 9.22]);  % [left, bottom, width, height]





