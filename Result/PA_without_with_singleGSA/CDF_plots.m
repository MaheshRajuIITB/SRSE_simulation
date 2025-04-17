clc; clear all; close all;

load('res_20250405_no_GSA_IEEE_30.mat')
LSE_PA_nspf = LSE_PA;
NLS_PA_nspf = NLS_PA;
% load('res_20250405_Single_GSA_IEEE_30.mat')
% load('res_20250405_Single_GSA_IEEE_30_with_0.4deg.mat')
load('res_20250405_Single_GSA_IEEE_30_with_0.5deg.mat')
% load('res_20250405_Single_GSA_IEEE_30_with_0.6deg.mat')
% load('res_20250405_Single_GSA_IEEE_30_with_0.7deg.mat')
% load('res_20250405_Single_GSA_IEEE_30_with_0.8deg.mat')
% load('res_20250405_Single_GSA_IEEE_30_with_0.9deg.mat')
% load('res_20250405_Single_GSA_IEEE_30_with_1deg.mat')
% load('res_20250405_Single_GSA_IEEE_30_with_1.5deg.mat')

% PA_threshold = 0.1249;
% PA_threshold = 0.133544832;
PA_threshold = 0.144324;
counter_set = 5;


sorted_vector = sort(LSE_PA_nspf);
PAnspf_SD1_at_70 =  sorted_vector(round(0.7 * length(sorted_vector)));
PAnspf_SD1_at_90 =  sorted_vector(round(0.9 * length(sorted_vector)));
PAnspf_SD1_at_99 =  sorted_vector(round(0.99 * length(sorted_vector)));

sorted_vector = sort(LSE_PA);
PA_SD1_at_06 =  sorted_vector(round(0.065 * length(sorted_vector)));
PA_SD1_at_70 =  sorted_vector(round(0.7 * length(sorted_vector)));
PA_SD1_at_90 =  sorted_vector(round(0.9 * length(sorted_vector)));
PA_SD1_at_99 =  sorted_vector(round(0.99 * length(sorted_vector)));


figure('Name','CDF plot of PA without GSA and With GSA')

linwid = 7;
h1 = cdfplot(LSE_PA_nspf)
h1.Color = 'b'; % Set line color to blue
h1.LineWidth = linwid;
h1.DisplayName = 'PA without GSA'
hold on

plot(PAnspf_SD1_at_70, 0.7,'bo', PAnspf_SD1_at_90, 0.9,'bo',PAnspf_SD1_at_99, 0.99,'bo','MarkerSize', 14,'MarkerFaceColor', 'b');
text(PAnspf_SD1_at_70, 0.67, sprintf('PA = %.3f^o', PAnspf_SD1_at_70), 'Color', 'b', 'FontSize', 30);
text(PAnspf_SD1_at_90, 0.87, sprintf('PA = %.3f^o', PAnspf_SD1_at_90), 'Color', 'b', 'FontSize', 30);
text(PAnspf_SD1_at_99, 0.96, sprintf('PA = %.3f^o', 0.1443), 'Color', 'b', 'FontSize', 30);

hold on 
h2 = cdfplot(LSE_PA)
h2.Color = 'r'; % Set line color to blue
h2.LineWidth = linwid;
h2.DisplayName = 'PA without GSA'
hold on

plot(PA_SD1_at_06, 0.065,'ro',PA_SD1_at_70, 0.7,'ro', PA_SD1_at_90, 0.9,'ro',PA_SD1_at_99, 0.99,'ro','MarkerSize', 14,'MarkerFaceColor', 'r');
text(PA_SD1_at_06, 0.047, sprintf('PA = %.3f^o', 0.1443), 'Color', 'r', 'FontSize', 30);
text(PA_SD1_at_70, 0.67, sprintf('PA = %.3f^o', PA_SD1_at_70), 'Color', 'r', 'FontSize', 30);
text(PA_SD1_at_90, 0.87, sprintf('PA = %.3f^o', PA_SD1_at_90), 'Color', 'r', 'FontSize', 30);
text(PA_SD1_at_99, 0.96, sprintf('PA = %.3f^o', PA_SD1_at_99), 'Color', 'r', 'FontSize', 30);

hold on
yline(0.065,'Color', [0.4940 0.1840 0.5560],'LineWidth',5)
yline(0.7,'Color', [0.4940 0.1840 0.5560],'LineWidth',5)
yline(0.9,'Color', [0.4940 0.1840 0.5560],'LineWidth',5)
yline(0.99,'Color', [0.4940 0.1840 0.5560],'LineWidth',5)

hold on
text(0.08, 0.1, sprintf('CI = %.1f%%', 6.5), 'Color', [0.4940 0.1840 0.5560], 'FontSize', 40);
text(0.08, 0.74, sprintf('CI = %.1f%%', 70), 'Color', [0.4940 0.1840 0.5560], 'FontSize', 40);
text(0.08, 0.88, sprintf('CI = %.1f%%', 90), 'Color', [0.4940 0.1840 0.5560], 'FontSize', 40);
text(0.08, 0.97, sprintf('CI = %.1f%%', 99), 'Color', [0.4940 0.1840 0.5560], 'FontSize', 40);

ylabel('CDF of PA','FontWeight', 'bold')
xlabel('Prncipal Angle (deg)','FontWeight', 'bold')
xticks([0.1 PAnspf_SD1_at_99 0.18 0.22])
xticklabels([0.1 0.1443 0.18 0.22])
yticks([0.2 0.5 0.7 1])

legend([h1 h2], {'PA with no GSA', 'PA with single GSA'}, 'Position', [0.75 0.3 0.1 0.1]);

set(gca, 'LineWidth', linwid)
set(gca, 'Box', 'on', 'LineWidth', 5)
set(gca, 'FontSize', 50, 'FontName', 'Times New Roman')

% grid off
title('')
ylim([0 1.05])
set(gcf, 'Units', 'inches');
set(gcf, 'Position', [1, 1, 20, 11]);
set(gcf, 'PaperUnits', 'inches');
set(gcf, 'PaperPositionMode', 'manual');  % Manual mode
set(gcf, 'PaperPosition', [-0.07, -0.22, 21.33, 9.22]);  % [left, bottom, width, height]
