function [y, facter, pre_matrix] = func_zf_precode(x, H_est)
[RR,CC] = size(H_est);

facter    = sqrt(1/RR)*sqrt(trace((inv(H_est*H_est')))); 

pre_matrix = 1/facter * H_est'*inv(H_est*H_est');

y = sqrt(1/RR)*pre_matrix * x;

end

