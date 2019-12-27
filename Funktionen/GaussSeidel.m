function [ sol ] = GaussSeidel(A,b,n,x0,eps,m)

  tmpx = zeros(n,1);
  E = eps + 1;
  counter = 0;
  while E > eps && counter < m
    tmpx = x0;
    for i = 1:n
      acum1 = 0;
      for p = 1 : i - 1
        acum1 = acum1 + A(i,p)*x0(p);
      end
      acum2 = 0;
      for q = i + 1: n
        acum2 = acum2 + A(i,q)*x0(q);
      end
      x0(i) = (b(i) - acum1 - acum2)/A(i,i);
    end
    E = max(abs(x0-tmpx));
    counter = counter + 1;
  end
  if E < eps
    fprintf(' solution error of %g \n',E)
    fprintf(' number of iterations %d \n',counter)
    sol = x0;
  else
    fprintf('The program failures in %d iterations\n',m)
  end
end
