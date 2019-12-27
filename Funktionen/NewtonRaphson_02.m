function [x NumIt] = NewtonRaphson_02(F_DF, x, eps, NumIt)
% Newton-Raphson method
% 
if (nargin < 4)
  maxIt = 100;
else
  maxIt = NumIt;
end

xk = x;
for NumIt=1:maxIt
  [F, DF] = feval(F_DF, xk);
  dxk = -DF\F;
  xk  = xk + dxk;
  err = abs(norm(dxk));
  disp(strcat(num2str(NumIt), ' |F(x)|_2 = ', num2str(norm(F)), ...
       ' |dx|_2 = ', num2str(err)));
  if err < eps
    x = xk;
    break;
  end;
end;
