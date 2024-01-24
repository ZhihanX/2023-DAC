function [y,facter] = func_twh_precode(x, H_est, k,SNRs,sigma2,alpha)

L= length(SNRs)+SNRs(1);
threshold = -0+L*alpha;

    if SNRs(k) <= threshold
    [Num_UE,Num_BS_Antennas] = size(H_est); % number of antennas
    Power_Symbol=1/Num_BS_Antennas;
    Power_Total=1;
    Beita = sqrt( Power_Total / trace(H_est' * Power_Symbol * H_est)); 
    facter = 1/Beita;
    P =  Beita * H_est';
    y = P * x;
    else
    [RR, CC] = size(H_est); % numbers of antennas
    % transmit power P = 1w
    P = 1;

    facter    = sqrt(P/RR*trace((inv(H_est*H_est')))); 

    pre_matrix = 1/facter * H_est' * inv(H_est * H_est' + sigma2 * eye(RR));

    y = pre_matrix * x;
    end
end