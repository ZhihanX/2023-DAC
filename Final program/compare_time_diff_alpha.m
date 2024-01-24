clc;
clear all;
close all;
warning off;

figure;

load T_mf.mat
h = cdfplot(time(:,1)); % Create the CDF plot
set(h, 'Color', 'b', 'LineStyle', '-', 'LineWidth', 2); % Set color to blue, line style to solid, and line width
hold on;

load T_mmse.mat
h = cdfplot(time(:,1)); % Create the CDF plot
set(h, 'Color', 'k', 'LineStyle', '-', 'LineWidth', 2); % Set color to blue, line style to solid, and line width
hold on;

load T_TWH_alpha06.mat
h = cdfplot(time(:,1)); % Create the CDF plot
set(h, 'Color', 'r', 'LineStyle', '-', 'LineWidth', 2); % Set color to blue, line style to solid, and line width
hold on;

grid on

xlim([0, 0.008]);
xlabel('time')
ylabel('probability')
legend('MF','MMSE','hybrid-α=0.6','Location','southeast');

figure;

load T_mf.mat
h = cdfplot(time(:,1)); % Create the CDF plot
set(h, 'Color', 'b', 'LineStyle', '-', 'LineWidth', 2); % Set color to blue, line style to solid, and line width
hold on;

load T_mmse.mat
h = cdfplot(time(:,1)); % Create the CDF plot
set(h, 'Color', 'k', 'LineStyle', '-', 'LineWidth', 2); % Set color to blue, line style to solid, and line width
hold on;

load T_TWH_alpha03.mat
h = cdfplot(time(:,1)); % Create the CDF plot
set(h, 'Color', 'r', 'LineStyle', '-', 'LineWidth', 2); % Set color to blue, line style to solid, and line width
hold on;

grid on

xlim([0, 0.008]);
xlabel('time')
ylabel('probability')
legend('MF','MMSE','hybrid-α=0.3','Location','southeast');

figure;

load T_mf.mat
h = cdfplot(time(:,1)); % Create the CDF plot
set(h, 'Color', 'b', 'LineStyle', '-', 'LineWidth', 2); % Set color to blue, line style to solid, and line width
hold on;

load T_mmse.mat
h = cdfplot(time(:,1)); % Create the CDF plot
set(h, 'Color', 'k', 'LineStyle', '-', 'LineWidth', 2); % Set color to blue, line style to solid, and line width
hold on;

load T_TWH_alpha00.mat
h = cdfplot(time(:,1)); % Create the CDF plot
set(h, 'Color', 'r', 'LineStyle', '-', 'LineWidth', 2); % Set color to blue, line style to solid, and line width
hold on;

grid on

xlim([0, 0.008]);
xlabel('time')
ylabel('probability')
legend('MF','MMSE','hybrid-α=0.0','Location','southeast');
