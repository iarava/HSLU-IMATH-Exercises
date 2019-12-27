function [F, DF] = F_DF_ex1(x)
% [F, DF]:  function and corrsponding Jacobian
%
x1 = x(1);
x2 = x(2);
F = [x1^2 + x2^2 - 1; x1 - x2];
DF = [ 2*x1 2*x2; 1 -1 ];
