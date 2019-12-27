function [L, U] = MyLU(A)
%--------------------------------------------------------------
% LU decomposition (Gauss-Elimination) of a regular matrix A.
% Result is a lower triangular nxn-matrix and an upper triangular
% nxn-matrix U such that L * U = A. The computation is done 
% "in place", i.e. at the end A contains L und U and no additional
% storage space is used to store L and U.
%--------------------------------------------------------------
[m,n] = size(A);
if (m ~= n), error('Matrix A is not square'), end
for k=1:n-1
  A(k+1:n,k) = A(k+1:n,k)/A(k,k);
  A(k+1:n,k+1:n) = A(k+1:n,k+1:n)-A(k+1:n,k)*A(k,k+1:n);
end
L = tril(A,-1) + eye(n,n);
U = triu(A);
return;
