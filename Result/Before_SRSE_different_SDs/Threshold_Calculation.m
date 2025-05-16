clc
clear
close all


%% IEEE-30 bus system

%% Data Extraction
%% Stadnard Deviations-1 are 0.001V and 0.002I

% load("res_PA_Chi_diff_weights_ang_vary_IEEE_30_SD1.mat")
load("res_PA_Chi_diff_weights_ang_vary_IEEE_118_SD1.mat")

Chi_with_correct_weights_matrix = cell2mat(Chi_with_correct_weights);
Chi_with_correct_weights_nspf_vector_SD1 = Chi_with_correct_weights_matrix(:,1);

PA_with_correct_weights_matrix = cell2mat(PA_with_correct_weights);
PA_with_correct_weights_nspf_vector_SD1 = PA_with_correct_weights_matrix(:,1);

PA_without_weights_matrix = cell2mat(PA_without_weights);
PA_without_weights_nspf_vector_SD1 = PA_without_weights_matrix(:,1);

Norm_with_correct_weights_matrix = cell2mat(Norm_with_correct_weights);

figure('Name','Norm of measurement vector for SD1')
for t = 1:size(Norm_with_correct_weights_matrix,2)
    Norm_with_correct_weights_nspf_vector_SD1 = Norm_with_correct_weights_matrix(:,t);
    cdfplot(Norm_with_correct_weights_nspf_vector_SD1)
    hold on
end
title('Norm of measurement vector for SD1')

%Variables
sorted_vector = sort(Chi_with_correct_weights_nspf_vector_SD1);
Chi_SD1_at_70 =  sorted_vector(round(0.7 * length(sorted_vector)));
Chi_SD1_at_90 =  sorted_vector(round(0.9 * length(sorted_vector)));
Chi_SD1_at_99 =  sorted_vector(round(0.99 * length(sorted_vector)));


sorted_vector = sort(PA_with_correct_weights_nspf_vector_SD1);
PA_SD1_at_70 =  sorted_vector(round(0.7 * length(sorted_vector)));
PA_SD1_at_90 =  sorted_vector(round(0.9 * length(sorted_vector)));
PA_SD1_at_99 =  sorted_vector(round(0.99 * length(sorted_vector)));


sorted_vector = sort(PA_without_weights_nspf_vector_SD1);
PAin_SD1_at_70 =  sorted_vector(round(0.7 * length(sorted_vector)));
PAin_SD1_at_90 =  sorted_vector(round(0.9 * length(sorted_vector)));
PAin_SD1_at_99 =  sorted_vector(round(0.99 * length(sorted_vector)));

%% Stadnard Deviations-2 are 0.005V and 0.01I

% load("res_PA_Chi_diff_weights_ang_vary_IEEE_30_SD2.mat")
load("res_PA_Chi_diff_weights_ang_vary_IEEE_118_SD2.mat")

Chi_with_correct_weights_matrix = cell2mat(Chi_with_correct_weights);
Chi_with_correct_weights_nspf_vector_SD2 = Chi_with_correct_weights_matrix(:,1);

PA_with_correct_weights_matrix = cell2mat(PA_with_correct_weights);
PA_with_correct_weights_nspf_vector_SD2 = PA_with_correct_weights_matrix(:,1);

PA_without_weights_matrix = cell2mat(PA_without_weights);
PA_without_weights_nspf_vector_SD2 = PA_without_weights_matrix(:,1);

Norm_with_correct_weights_matrix = cell2mat(Norm_with_correct_weights);

figure('Name','Norm of measurement vector for SD2')
for t = 1:size(Norm_with_correct_weights_matrix,2)
    Norm_with_correct_weights_nspf_vector_SD2 = Norm_with_correct_weights_matrix(:,t);
    cdfplot(Norm_with_correct_weights_nspf_vector_SD2)
    hold on
end
title('Norm of measurement vector for SD2')

%Variables
sorted_vector = sort(Chi_with_correct_weights_nspf_vector_SD2);
Chi_SD2_at_70 =  sorted_vector(round(0.7 * length(sorted_vector)));
Chi_SD2_at_90 =  sorted_vector(round(0.9 * length(sorted_vector)));
Chi_SD2_at_99 =  sorted_vector(round(0.99 * length(sorted_vector)));


sorted_vector = sort(PA_with_correct_weights_nspf_vector_SD2);
PA_SD2_at_70 =  sorted_vector(round(0.7 * length(sorted_vector)));
PA_SD2_at_90 =  sorted_vector(round(0.9 * length(sorted_vector)));
PA_SD2_at_99 =  sorted_vector(round(0.99 * length(sorted_vector)));

sorted_vector = sort(PA_without_weights_nspf_vector_SD2);
PAin_SD2_at_70 =  sorted_vector(round(0.7 * length(sorted_vector)));
PAin_SD2_at_90 =  sorted_vector(round(0.9 * length(sorted_vector)));
PAin_SD2_at_99 =  sorted_vector(round(0.99 * length(sorted_vector)));

%% Stadnard Deviations-3 are 0.01V and 0.02I

% load("res_PA_Chi_diff_weights_ang_vary_IEEE_30_SD3.mat")
load("res_PA_Chi_diff_weights_ang_vary_IEEE_118_SD3.mat")

Chi_with_correct_weights_matrix = cell2mat(Chi_with_correct_weights);
Chi_with_correct_weights_nspf_vector_SD3 = Chi_with_correct_weights_matrix(:,1);

PA_with_correct_weights_matrix = cell2mat(PA_with_correct_weights);
PA_with_correct_weights_nspf_vector_SD3 = PA_with_correct_weights_matrix(:,1);

PA_without_weights_matrix = cell2mat(PA_without_weights);
PA_without_weights_nspf_vector_SD3 = PA_without_weights_matrix(:,1);

Norm_with_correct_weights_matrix = cell2mat(Norm_with_correct_weights);

figure('Name','Norm of measurement vector for SD3')
for t = 1:size(Norm_with_correct_weights_matrix,2)
    Norm_with_correct_weights_nspf_vector_SD3 = Norm_with_correct_weights_matrix(:,t);
    cdfplot(Norm_with_correct_weights_nspf_vector_SD3)
    hold on
end
title('Norm of measurement vector for SD3')

%Variables
sorted_vector = sort(Chi_with_correct_weights_nspf_vector_SD3);
Chi_SD3_at_70 =  sorted_vector(round(0.7 * length(sorted_vector)));
Chi_SD3_at_90 =  sorted_vector(round(0.9 * length(sorted_vector)));
Chi_SD3_at_99 =  sorted_vector(round(0.99 * length(sorted_vector)));


sorted_vector = sort(PA_with_correct_weights_nspf_vector_SD3);
PA_SD3_at_70 =  sorted_vector(round(0.7 * length(sorted_vector)));
PA_SD3_at_90 =  sorted_vector(round(0.9 * length(sorted_vector)));
PA_SD3_at_99 =  sorted_vector(round(0.99 * length(sorted_vector)));


sorted_vector = sort(PA_without_weights_nspf_vector_SD3);
PAin_SD3_at_70 =  sorted_vector(round(0.7 * length(sorted_vector)));
PAin_SD3_at_90 =  sorted_vector(round(0.9 * length(sorted_vector)));
PAin_SD3_at_99 =  sorted_vector(round(0.99 * length(sorted_vector)));

%% Chi squre with correct weights

figure('Name','CDF plot of Chi square')

h1 = cdfplot(Chi_with_correct_weights_nspf_vector_SD1);
h1.Color = 'b'; % Set line color to blue
h1.LineWidth = 2;
h1.DisplayName = '\chi^2 for SD1'
hold on
yline(0.7,'LineWidth',2)
yline(0.9,'LineWidth',2)
yline(0.99,'LineWidth',2)
title('CDF plot of Chi square')
hold on
plot(Chi_SD1_at_70, 0.7,'ro', Chi_SD1_at_90, 0.9,'ro',Chi_SD1_at_99, 0.99,'ro','MarkerSize', 8,'MarkerFaceColor', 'r');
text(Chi_SD1_at_70, 0.69, sprintf('X = %.2f', Chi_SD1_at_70), 'Color', 'b', 'FontSize', 12);
text(Chi_SD1_at_90+1, 0.89, sprintf('X = %.2f', Chi_SD1_at_90), 'Color', 'b', 'FontSize', 12);
text(Chi_SD1_at_99+1, 0.98, sprintf('X = %.2f', Chi_SD1_at_99), 'Color', 'b', 'FontSize', 12);

hold on
h2 = cdfplot(Chi_with_correct_weights_nspf_vector_SD2);
h2.Color = 'g'; % Set line color to blue
h2.LineWidth = 2;
h2.DisplayName = '\chi^2 for SD2'
hold on
yline(0.7,'LineWidth',2)
yline(0.9,'LineWidth',2)
yline(0.99,'LineWidth',2)
title('CDF plot of Chi square')
hold on
plot(Chi_SD2_at_70, 0.7,'ro', Chi_SD2_at_90, 0.9,'ro',Chi_SD2_at_99, 0.99,'ro','MarkerSize', 8,'MarkerFaceColor', 'r');
text(Chi_SD1_at_70, 0.67, sprintf('X = %.2f', Chi_SD2_at_70), 'Color', 'g', 'FontSize', 12);
text(Chi_SD1_at_90+1, 0.87, sprintf('X = %.2f', Chi_SD2_at_90), 'Color', 'g', 'FontSize', 12);
text(Chi_SD1_at_99+1, 0.96, sprintf('X = %.2f', Chi_SD2_at_99), 'Color', 'g', 'FontSize', 12);

hold on
h3 = cdfplot(Chi_with_correct_weights_nspf_vector_SD3);
h3.Color = 'c'; % Set line color to blue
h3.LineWidth = 1.5;
h3.DisplayName = '\chi^2 for SD3'
hold on
yline(0.7,'LineWidth',2)
yline(0.9,'LineWidth',2)
yline(0.99,'LineWidth',2)
title('CDF plot of Chi square')
hold on
plot(Chi_SD3_at_70, 0.7,'ro', Chi_SD3_at_90, 0.9,'ro',Chi_SD3_at_99, 0.99,'ro','MarkerSize', 8,'MarkerFaceColor', 'r');
text(Chi_SD1_at_70, 0.65, sprintf('X = %.2f', Chi_SD3_at_70), 'Color', 'c', 'FontSize', 12);
text(Chi_SD1_at_90+1, 0.85, sprintf('X = %.2f', Chi_SD3_at_90), 'Color', 'c', 'FontSize', 12);
text(Chi_SD1_at_99+1, 0.94, sprintf('X = %.2f', Chi_SD3_at_99), 'Color', 'c', 'FontSize', 12);

ylim([0 1.1])
legend([h1, h2, h3], 'Location', 'Northwest');


%% PA with correct weights

figure('Name','CDF plot of PA with correct weights')
h1 = cdfplot(PA_with_correct_weights_nspf_vector_SD1);
h1.Color = 'b'; % Set line color to blue
h1.LineWidth = 2;
h1.DisplayName = 'PA for SD1'
hold on
yline(0.7,'LineWidth',2)
yline(0.9,'LineWidth',2)
yline(0.99,'LineWidth',2)

hold on
plot(PA_SD1_at_70, 0.7,'ro', PA_SD1_at_90, 0.9,'ro',PA_SD1_at_99, 0.99,'ro','MarkerSize', 8,'MarkerFaceColor', 'r');
text(PA_SD1_at_70, 0.69, sprintf('X = %.2f', PA_SD1_at_70), 'Color', 'b', 'FontSize', 12);
text(PA_SD1_at_90, 0.89, sprintf('X = %.2f', PA_SD1_at_90), 'Color', 'b', 'FontSize', 12);
text(PA_SD1_at_99, 0.98, sprintf('X = %.2f', PA_SD1_at_99), 'Color', 'b', 'FontSize', 12);

hold on
h2 = cdfplot(PA_with_correct_weights_nspf_vector_SD2);
h2.Color = 'g'; % Set line color to blue
h2.LineWidth = 2;
h2.DisplayName = 'PA for SD2'
hold on
yline(0.7,'LineWidth',2)
yline(0.9,'LineWidth',2)
yline(0.99,'LineWidth',2)
hold on
plot(PA_SD2_at_70, 0.7,'ro', PA_SD2_at_90, 0.9,'ro',PA_SD2_at_99, 0.99,'ro','MarkerSize', 8,'MarkerFaceColor', 'r');
text(PA_SD2_at_70, 0.69, sprintf('X = %.2f', PA_SD2_at_70), 'Color', 'g', 'FontSize', 12);
text(PA_SD2_at_90, 0.89, sprintf('X = %.2f', PA_SD2_at_90), 'Color', 'g', 'FontSize', 12);
text(PA_SD2_at_99, 0.98, sprintf('X = %.2f', PA_SD2_at_99), 'Color', 'g', 'FontSize', 12);

hold on
h3 = cdfplot(PA_with_correct_weights_nspf_vector_SD3);
h3.Color = 'c'; % Set line color to blue
h3.LineWidth = 1.5;
h3.DisplayName = 'PA for SD3'
hold on
yline(0.7,'LineWidth',2)
yline(0.9,'LineWidth',2)
yline(0.99,'LineWidth',2)
hold on
plot(PA_SD3_at_70, 0.7,'ro', PA_SD3_at_90, 0.9,'ro',PA_SD3_at_99, 0.99,'ro','MarkerSize', 8,'MarkerFaceColor', 'r');
text(PA_SD3_at_70, 0.69, sprintf('X = %.2f', PA_SD3_at_70), 'Color', 'c', 'FontSize', 12);
text(PA_SD3_at_90, 0.89, sprintf('X = %.2f', PA_SD3_at_90), 'Color', 'c', 'FontSize', 12);
text(PA_SD3_at_99, 0.98, sprintf('X = %.2f', PA_SD3_at_99), 'Color', 'c', 'FontSize', 12);
title('CDF plot of PA')
ylim([0 1.1])
legend([h1, h2, h3], 'Location', 'Northwest');


%% PA without weights

figure('Name','CDF plot of PA with unit weights')
h1 = cdfplot(PA_without_weights_nspf_vector_SD1);
h1.Color = 'b'; % Set line color to blue
h1.LineWidth = 2;
h1.DisplayName = 'PA for SD1'
hold on
yline(0.7,'LineWidth',2)
yline(0.9,'LineWidth',2)
yline(0.99,'LineWidth',2)

hold on
plot(PAin_SD1_at_70, 0.7,'ro', PAin_SD1_at_90, 0.9,'ro',PAin_SD1_at_99, 0.99,'ro','MarkerSize', 8,'MarkerFaceColor', 'r');
text(PAin_SD1_at_70, 0.69, sprintf('X = %.2f', PAin_SD1_at_70), 'Color', 'b', 'FontSize', 12);
text(PAin_SD1_at_90, 0.89, sprintf('X = %.2f', PAin_SD1_at_90), 'Color', 'b', 'FontSize', 12);
text(PAin_SD1_at_99, 0.98, sprintf('X = %.2f', PAin_SD1_at_99), 'Color', 'b', 'FontSize', 12);

hold on
h2 = cdfplot(PA_without_weights_nspf_vector_SD2);
h2.Color = 'g'; % Set line color to blue
h2.LineWidth = 2;
h2.DisplayName = 'PA for SD2'
hold on
yline(0.7,'LineWidth',2)
yline(0.9,'LineWidth',2)
yline(0.99,'LineWidth',2)
hold on
plot(PAin_SD2_at_70, 0.7,'ro', PAin_SD2_at_90, 0.9,'ro',PAin_SD2_at_99, 0.99,'ro','MarkerSize', 8,'MarkerFaceColor', 'r');
text(PAin_SD2_at_70, 0.69, sprintf('X = %.2f', PAin_SD2_at_70), 'Color', 'g', 'FontSize', 12);
text(PAin_SD2_at_90, 0.89, sprintf('X = %.2f', PAin_SD2_at_90), 'Color', 'g', 'FontSize', 12);
text(PAin_SD2_at_99, 0.98, sprintf('X = %.2f', PAin_SD2_at_99), 'Color', 'g', 'FontSize', 12);

hold on
h3 = cdfplot(PA_without_weights_nspf_vector_SD3);
h3.Color = 'c'; % Set line color to blue
h3.LineWidth = 1.5;
h3.DisplayName = 'PA for SD3'
hold on
yline(0.7,'LineWidth',2)
yline(0.9,'LineWidth',2)
yline(0.99,'LineWidth',2)
hold on
plot(PAin_SD3_at_70, 0.7,'ro', PAin_SD3_at_90, 0.9,'ro',PAin_SD3_at_99, 0.99,'ro','MarkerSize', 8,'MarkerFaceColor', 'r');
text(PAin_SD3_at_70, 0.69, sprintf('X = %.2f', PAin_SD3_at_70), 'Color', 'c', 'FontSize', 12);
text(PAin_SD3_at_90, 0.89, sprintf('X = %.2f', PAin_SD3_at_90), 'Color', 'c', 'FontSize', 12);
text(PAin_SD3_at_99, 0.98, sprintf('X = %.2f', PAin_SD3_at_99), 'Color', 'c', 'FontSize', 12);
title('CDF plot of PA')
ylim([0 1.1])
legend([h1, h2, h3], 'Location', 'Northwest');

return

%% Saving threshold values in matrix format


Chi_the_for_SD123_70 = [Chi_SD1_at_70;Chi_SD2_at_70;Chi_SD3_at_70];
Chi_the_for_SD123_90 = [Chi_SD1_at_90;Chi_SD2_at_90;Chi_SD3_at_90];
Chi_the_for_SD123_99 = [Chi_SD1_at_99;Chi_SD2_at_99;Chi_SD3_at_99];

PA_the_for_SD123_70 = [PA_SD1_at_70;PA_SD2_at_70;PA_SD3_at_70];
PA_the_for_SD123_90 = [PA_SD1_at_90;PA_SD2_at_90;PA_SD3_at_90];
PA_the_for_SD123_99 = [PA_SD1_at_99;PA_SD2_at_99;PA_SD3_at_99];

PAin_the_for_SD123_70 = [PAin_SD1_at_70;PAin_SD2_at_70;PAin_SD3_at_70];
PAin_the_for_SD123_90 = [PAin_SD1_at_90;PAin_SD2_at_90;PAin_SD3_at_90];
PAin_the_for_SD123_99 = [PAin_SD1_at_99;PAin_SD2_at_99;PAin_SD3_at_99];


% save('Threshold matrix IEE 118 bus', 'Chi_the_for_SD123_70','Chi_the_for_SD123_90','Chi_the_for_SD123_99','PA_the_for_SD123_70','PA_the_for_SD123_90','PA_the_for_SD123_99','PAin_the_for_SD123_70','PAin_the_for_SD123_90','PAin_the_for_SD123_99')