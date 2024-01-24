clc; 
clear all; 
close all; 
warning off;

figure;
load Time_mrt.mat
h = cdfplot(time(:,1)); % Create the CDF plot
set(h, 'Color', 'b', 'LineStyle', '-', 'LineWidth', 2); % Set color to blue, line style to solid, and line width
hold on;

load Time_mf.mat
h = cdfplot(time(:,1)); % Create the CDF plot
set(h, 'Color', 'y', 'LineStyle', '-', 'LineWidth', 2); % Set color to blue, line style to solid, and line width
hold on;

load Time_zf.mat
h = cdfplot(time(:,1)); % Create the CDF plot
set(h, 'Color', 'r', 'LineStyle', '-', 'LineWidth', 2); % Set color to blue, line style to solid, and line width
hold on;

load Time_mmse.mat
h = cdfplot(time(:,1)); % Create the CDF plot
set(h, 'Color', 'k', 'LineStyle', '-', 'LineWidth', 2); % Set color to blue, line style to solid, and line width
hold on;




grid on

xlim([0, 0.008]);
xlabel('time')
ylabel('probability')
legend('mrt','mf','zf','mmse');
