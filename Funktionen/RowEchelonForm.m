function [L U] = RowEchelonForm(A)
  [m, n] = size(A)
  for k=1:m
    for i=k+1:m
      fact = A(i,k)/A(k,k);
        for j=k:n
        A(i,j) = A(i,j) - fact*A(k,j);
      end
      A(i,k) = fact;
    end
  end
  U = triu(A);
  L = tril(A,-1) + eye(m,n);