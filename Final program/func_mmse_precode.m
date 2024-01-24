function [y,facter,pre_matrix] = func_mmse_precode(x, H_est, sigma2)
    [RR, CC] = size(H_est); % numbers of antennas
    % transmit power P = 1w
    P = 1;
%     pre_matrix = H_est' * inv(H_est * H_est' + sigma2 * eye(RR));
    facter    = sqrt(P/RR*trace((inv(H_est*H_est')))); 
%   precoding process
    pre_matrix = 1/facter * H_est' * inv(H_est * H_est' + sigma2 * eye(RR));    
    y = pre_matrix * x;
end
