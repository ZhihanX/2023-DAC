function[R_signals_new,k]= mimo_demodulation(all_Y_facter_all_Nuas,Nuser,Nuas,MTKL,SNRs,Msg_qpsk,QPSK_bits)

R_signals_new = [];
Y_factor_new = zeros(Nuser*MTKL, length(SNRs));
if Nuas == 1
    for k=1:length(SNRs)
    Y_factor_new(:, k) = all_Y_facter_all_Nuas{1, k};
    end
end
for a = 1:Nuas-1
    for k=1:length(SNRs)
    Y_factor_new(:, k) = Y_factor_new(:, k) + all_Y_facter_all_Nuas{a, k};
    end
    Y_factor_new(:, k) = Y_factor_new(:, k) /Nuas;
end
for k=1:length(SNRs)
    for n = 1:MTKL
        k
        start_row = (n-1)*length(Msg_qpsk) + 1;
        end_row = n*length(Msg_qpsk);
        [~,Ridx1]         = min(abs(Y_factor_new(start_row:end_row, k)*ones(1,length(Msg_qpsk))-ones(Nuser,1)*Msg_qpsk).^2,[],2); 
        R_signals_new        = [R_signals_new; QPSK_bits(Ridx1,:)];
        
    end
end