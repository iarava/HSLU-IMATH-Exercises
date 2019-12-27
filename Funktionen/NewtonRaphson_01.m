function [x, NumIt] = NewtonRaphson_01(f, x, maxIt)
% [x, NumIt] = NewtonRaphson_01(f, x, NumIt)
% INPUT:
% f:     name of a function (defined in appropriate m-file)
%        with signature [y, dy] = f(x)
% x:     initial guess
% NumIt: maximum number of iterations
% OUTPUT:
% x:     final solution
% NumIt: number of iterations needed (optional)
% EPS:   convergence criterion 
%
% jfb (20090219)
%
if (nargin < 3)
  maxIt = 100;
end
EPS =  1.0e-6;

xk = x;

for NumIt=1:maxIt
  [y, dy] = feval(f, xk);
  dxk     = -y/dy;
  xk      = xk + dxk;
  err     = abs(dxk);
  disp(strcat(num2str(NumIt), ' |f(x)|_1 = ', num2str(abs(y)), ...
       ' |dx|_1 = ', num2str(err), ' x_k = ', num2str(xk)));
  if err < EPS
    x = xk;
    break;
  end
end
