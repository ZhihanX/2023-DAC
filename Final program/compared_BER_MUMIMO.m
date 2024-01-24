clc;
clear all;
close all;
warning off;

figure
load MUMIMO_81.mat
semilogy(SNRs,error,'-r>',...  % figure for ZF+LS+muLAW_LDAC, red square
    'LineWidth',1,...
    'MarkerSize',6,...
    'MarkerEdgeColor','k',...
    'MarkerFaceColor',[0.9,0.0,0.0]);
hold on

load MUMIMO_82.mat
semilogy(SNRs,error,'-y>',...  % figure for MF+LS+muLAW_LDAC, yellow circle
    'LineWidth',1,...
    'MarkerSize',6,...
    'MarkerEdgeColor','k',...
    'MarkerFaceColor',[0.9,0.9,0.0]);
hold on

load MUMIMO_162.mat
semilogy(SNRs,error,'-go',... % figure for MMSE+LS+muLAW_LDAC, blue triangle
    'LineWidth',1,...
    'MarkerSize',6,...
    'MarkerEdgeColor','k',...
    'MarkerFaceColor',[0.6,0.8,0.2]);
hold on

load MUMIMO_164.mat
semilogy(SNRs,error,'-k^',...  % figure for MF+LS+muLAW_LDAC, yellow circle
    'LineWidth',1,...
    'MarkerSize',6,...
    'MarkerEdgeColor','k',...
    'MarkerFaceColor',[0.2,0.6,0.8]);
hold on

load MUMIMO_644.mat
semilogy(SNRs,error,'-b^',...  % figure for MF+LS+muLAW_LDAC, yellow circle
    'LineWidth',1,...
    'MarkerSize',6,...
    'MarkerEdgeColor','k',...
    'MarkerFaceColor',[0.2,0.2,0.8]);
hold on

grid on

xlabel('SNR')
ylabel('bit error probability')
legend('8 antenna for base, 1 for each user','8/2','16/2','16/4','64/4','Location','southwest');
% red - 'MarkerFaceColor',[0.9,0.0,0.0]);
% yellow - 'MarkerFaceColor',[0.9,0.9,0.0]);
% green -  'MarkerFaceColor',[0.6,0.8,0.2]);
% blue1 - 'MarkerFaceColor',[0.2,0.6,0.8]);
% blue2 - 'MarkerFaceColor',[0.2,0.2,0.8]);
