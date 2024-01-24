 function [y, facter, pre_matrix] = func_mrt_precode(x, H_est)
[RR,CC] = size(H_est);%get Number of users
 
%precoding matrix
facter    = sqrt(trace(H_est'*H_est));
pre_matrix= 1/facter * H_est';
y         = sqrt(1/RR)*pre_matrix*x;
 
end
