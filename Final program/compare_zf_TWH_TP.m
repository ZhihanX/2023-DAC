clc;
clear all;
close all;
warning off;

figure
load ZF_mulaw_LDAC.mat
semilogy(SNRs,error,'-bs',...  % figure for ZF+LS+muLAW_LDAC, red square
    'LineWidth',1.5,...
    'MarkerSize',6,...
    'MarkerEdgeColor','k',...
    'MarkerFaceColor',[0.9,0.0,0.0]);
hold on

load BER_TWH_alpha00.mat
semilogy(SNRs,error,'--r^',... % figure for MMSE+LS+muLAW_LDAC, blue triangle
    'LineWidth',1.5,...
    'MarkerSize',6,...
    'MarkerEdgeColor','k',...
    'MarkerFaceColor',[0.6,0.6,0.8]);
hold on

load TP_mulaw_LDAC.mat
semilogy(SNRs,error,':ro',...  % figure for MF+LS+muLAW_LDAC, yellow circle
    'LineWidth',1.5,...
    'MarkerSize',6,...
    'MarkerEdgeColor','k',...
    'MarkerFaceColor',[0.9,0.9,0.0]);
hold on


grid on

xlabel('SNR')
ylabel('bit error probability')
legend('ZF+LS+mu-Law-LDAC','TWH+LS+mu-Law-LDAC','TP+LS+mu-Law-LDAC');
