clc; 
clear all; 
close all; 
warning off;
h1 = waitbar(0,'monte carlo process');

AD_bits    = 2;  %resolution of DAC
Nuser      = 4;  %Number of users
NBSant     = 8; %Number of base station antennas
MTKL       = 1000;   %Number of Monte Carlo loops
SNRs       = -20:1:15; %The SNR range of the simulation
Nuas      = 2; % Number of receiver antennas per user
%QPSK 
Midx      = 2;
precoding_func_1 = @func_mmse_precode;
precoding_func_2 = @func_mf_precode;
quantization_func = @func_mu_law;
%QPSK transmit symbol mapping table
symb      =    [1 - 1i;
               -1 - 1i;
               -1 + 1i;
                1 + 1i];
Msg_qpsk  = symb';
Lens      = length(Msg_qpsk);
Lens2     = log2(Lens); %Number of data per launch
QPSK_bits = de2bi(0:Lens-1,Lens2,'left-msb'); 
%Saving signal values
all_signals = [];
all_signals_QPSK = [];
all_signals_all_Nuas = cell(Nuas, length(SNRs));
all_received_signals_all_Nuas = cell(Nuas, length(SNRs));
all_Y_facter_all_Nuas = cell(Nuas, length(SNRs));
% all_signals_per_snr = cell(length(SNRs), 1); % All the transmitted signals at each SNR are stored
% all_received_signals_per_snr_1 = cell(length(SNRs), 1); % All received signals at each SNR are stored
% all_received_signals_per_snr_2 = cell(length(SNRs), 1); % All received signals at each SNR are stored

totalIteration = MTKL*Nuas;
 for i = 1:Nuas
        %True MIMO channel parameters
        % H_real       = (randn(Nuser,NBSant)+1i*randn(Nuser,NBSant))/sqrt(2);
        % H_LS_ideal   = H_real;
        all_signals_per_snr_Nuas = cell(length(SNRs), 1);
        all_received_signals_per_snr_Nuas = cell(length(SNRs), 1);
        all_Y_facter_Nuas = cell(length(SNRs), 1);
    for jj=1:MTKL
        currentIteration = (i-1)*MTKL+jj;
        waitbar(currentIteration/totalIteration,h1,sprintf('processing:%d %%',floor(currentIteration/totalIteration*100)));

        % generate channel
        H_real       = (randn(Nuser,NBSant)+1i*randn(Nuser,NBSant))/sqrt(2);

        if i == 1
            %Generating data，The length is Lens，four users
            signals      = randi([0 1],Nuser,Lens2);
            all_signals = [all_signals; signals];
            %QPSK map
            idx          = bi2de(signals,'left-msb')+1;
            QPSK_signals = Msg_qpsk(idx).';
            all_signals_QPSK = [all_signals_QPSK; QPSK_signals];
        end
        if i ~=1
            % Calculate the range of extracted rows
            start_row = (jj-1)*Lens + 1;
            end_row = jj*Lens;
            % Extract a part of all_signals
            signals = all_signals(start_row:end_row, :);
            QPSK_signals = all_signals_QPSK(start_row:end_row, :);
        end

        for k=1:length(SNRs)
            Noise       = (randn(Nuser,1)+1i*randn(Nuser,1))/sqrt(2);
            snr = 10.^(SNRs(k)/10);
            Noise_pw    = 10.^(-SNRs(k)/10);
            Noise_add   = sqrt(Noise_pw)*Noise;
            HLS_est= func_channel_estimation(Nuser,NBSant,k,AD_bits,SNRs,H_real,quantization_func);%A for a-law,u for mu-law
            %mrt precoding
            [Pre_Code_QPSK_signals1, facter1] = precoding_func_1(QPSK_signals,HLS_est,Noise_pw);
            [Pre_Code_QPSK_signals2, facter2] = precoding_func_2(QPSK_signals,HLS_est);


            Pre_Code_QPSK_signals01=quantization_func(Pre_Code_QPSK_signals1,AD_bits);
            Pre_Code_QPSK_signals02=quantization_func(Pre_Code_QPSK_signals2,AD_bits);
            
            %after precoding the signal is Pre_Code_QPSK_signals，pass channel，get Pre_Code_rec，then
            Pre_Code_rec1                      = H_real*Pre_Code_QPSK_signals01;
            Pre_Code_rec2                      = H_real*Pre_Code_QPSK_signals02;
            
            %get Pre_Code_rec+noise
            Rec01                               = Pre_Code_rec1 + Noise_add;
            Rec02                               = Pre_Code_rec2 + Noise_add;
            Rec1=quantization_func(Rec01,AD_bits);
            Rec2=quantization_func(Rec02,AD_bits);
            Y_factor1                          = facter1*Rec1;
            Y_factor2                          = facter2*Rec2;
%             all_Y_facter_Nuas{k} = [all_Y_facter_Nuas{k}; Y_factor1];
            %mrt-demodulation
            [~,Ridx1]                          = min(abs(Y_factor1*ones(1,length(Msg_qpsk))-ones(Nuser,1)*Msg_qpsk).^2,[],2); 
            R_signals1                         = QPSK_bits(Ridx1,:);
            [~,Ridx2]                          = min(abs(Y_factor2*ones(1,length(Msg_qpsk))-ones(Nuser,1)*Msg_qpsk).^2,[],2); 
            R_signals2                         = QPSK_bits(Ridx2,:);

            error1=0 ;
            error2=0;
            for ii = 1: length(R_signals1(:,1))
                error1  =error1+ sum(R_signals1(ii,:) ~= signals(ii,:));
                error2 = error2+ sum(R_signals2(ii,:) ~= signals(ii,:));

            end
            if error1<=error2
%             all_received_signals_per_snr_Nuas{k} = [all_received_signals_per_snr_Nuas{k}; R_signals1];
                all_Y_facter_Nuas{k} = [all_Y_facter_Nuas{k}; Y_factor1];
            else
%             all_received_signals_per_snr_Nuas{k} = [all_received_signals_per_snr_Nuas{k}; R_signals2];
                all_Y_facter_Nuas{k} = [all_Y_facter_Nuas{k}; Y_factor2];
            end
            % all_signals_per_snr{k} = [all_signals_per_snr{k}; signals];
            % all_received_signals_per_snr_1{k} = [all_received_signals_per_snr_1{k}; R_signals1];
            all_signals_per_snr_Nuas{k} = [all_signals_per_snr_Nuas{k}; signals];
            end

    end
    all_signals_all_Nuas(i, :) = all_signals_per_snr_Nuas;
    all_Y_facter_all_Nuas(i, :) =  all_Y_facter_Nuas;
 end

[R_signals_new] = mimo_demodulation(all_Y_facter_all_Nuas,Nuser,Nuas,MTKL,SNRs,Msg_qpsk,QPSK_bits);

final_matrix = matrix_separate(R_signals_new,Nuser,MTKL);

error = zeros(length(SNRs), 1);
for k=1:length(SNRs)
    start_col = (k-1)*2 + 1;
    end_col = k*2;
    total_errors = sum(sum(all_signals_all_Nuas{1, k} ~= final_matrix(:,start_col:end_col)));
    total_bits = numel(all_signals_all_Nuas{1, k});
    error(k) = total_errors / total_bits;
end
close(h1);
semilogy(SNRs,error,'-ro',...
    'LineWidth',1,...
    'MarkerSize',6,...
    'MarkerEdgeColor','k',...
    'MarkerFaceColor',[0.9,0.9,0.0]);
grid on;

xlabel('SNR')
ylabel('error')

% save R005.mat SNRs error
