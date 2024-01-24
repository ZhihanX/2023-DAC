clc;
clear all;
close all;
warning off;

figure
load ZF_LS_muLAW_LDAC.mat
semilogy(SNRs,BER_per_snr_2,'-bs',...  % figure for ZF+LS+muLAW_LDAC, red square
    'LineWidth',1,...
    'MarkerSize',6,...
    'MarkerEdgeColor','k',...
    'MarkerFaceColor',[0.9,0.0,0.0]);
hold on

load MMSE_LS_muLAW_LDAC.mat
semilogy(SNRs,BER_per_snr_2,'--r^',... % figure for MMSE+LS+muLAW_LDAC, blue triangle
    'LineWidth',1,...
    'MarkerSize',6,...
    'MarkerEdgeColor','k',...
    'MarkerFaceColor',[0.6,0.6,0.8]);
hold on

load MF_LS_muLAW_LDAC.mat
semilogy(SNRs,error,':ro',...  % figure for MF+LS+muLAW_LDAC, yellow circle
    'LineWidth',1,...
    'MarkerSize',6,...
    'MarkerEdgeColor','k',...
    'MarkerFaceColor',[0.9,0.9,0.0]);
hold on


grid on

xlabel('SNR')
ylabel('bit error probability')
legend('ZF+LS+mu-Law-LDAC','MMSE+LS+mu-Law-LDAC','MF+LS+mu-Law-LDAC');
