clc;
clear all;
close all;
warning off;

figure;

load BER_TWH_alpha00.mat
semilogy(SNRs,error,'--r^',...  % figure for ZF+LS+muLAW_LDAC, red square
    'LineWidth',1,...
    'MarkerSize',6,...
    'MarkerEdgeColor','k',...
    'MarkerFaceColor',[0.9,0.9,0.0]);
hold on

grid on

xlabel('SNR')
ylabel('bit error probability')
legend('TWH-precode-α=0');
% legend('TWH-precode-alpha=0.3');
% legend('TWH-precode-alpha=0.6');

figure;

load BER_TWH_alpha03.mat
semilogy(SNRs,error,'--r^',... % figure for MMSE+LS+muLAW_LDAC, blue triangle
    'LineWidth',1,...
    'MarkerSize',6,...
    'MarkerEdgeColor','k',...
    'MarkerFaceColor',[0.9,0.9,0.0]);
hold on

grid on

xlabel('SNR')
ylabel('bit error probability')
% legend('TWH-precode-alpha=0');
legend('TWH-precode-α=0.3');
% legend('TWH-precode-alpha=0.6');

figure;

load BER_TWH_alpha06.mat
semilogy(SNRs,error,'--r^',...  % figure for MF+LS+muLAW_LDAC, yellow circle
    'LineWidth',1,...
    'MarkerSize',6,...
    'MarkerEdgeColor','k',...
    'MarkerFaceColor',[0.9,0.9,0.0]);
hold on


grid on

xlabel('SNR')
ylabel('bit error probability')
% legend('TWH-precode-alpha=0');
% legend('TWH-precode-alpha=0.3');
legend('TWH-precode-α=0.6');
