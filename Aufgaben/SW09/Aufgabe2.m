function df=numdiff(x)
 % plot relative errors of the approximation of
 % the derivative of f(x) = exp(x) at an arbitrary x.
 n = 16;
 df = zeros(1,n);
 error = zeros(1,n);
 for k = 1:n
  h = 10^(-k);
  df(1,k) = (exp(x+h)-exp(x))/h;
 end
 error(:,:) = abs(exp(x)-df(:,:))/exp(x);
 semilogy(-n:-1,error(1,n:-1:1),'-.k')
 xlabel('log(h)');
 ylabel('relative error');
 title('Relative Errors in numerical differentiation');
 saveas(gcf,'errors_rel','fig');
 saveas(gcf,'errors_rel','png');
end