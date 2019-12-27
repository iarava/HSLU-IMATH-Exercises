function x = Jacobi_01(A, b, N)
% x = Jacobi_01(A, b, N) iteratively solves A x = b
%                  using no more then N iterations.
n     = size(A, 1);
% splitting matrix A into A = D + L + U
D     = diag(diag(A));
L     = tril(A, -1);
U     = triu(A, 1);
% compute the transition matrix and the constant vector
Mj    = -inv(D)*(L+U);
cj    = inv(D)*b;
tol   = 1e-05;           % tolerance
x     = zeros(n,1);      % start vector
MaxIt = N;               % max number of iterations
N     = 1;               % initialize counter
while N <= MaxIt
  x(:,N+1) = Mj*x(:,N) + cj;
  err = norm(x(:,N+1)-x(:,N));
  if err < tol
    disp('successful Jacobi iteration')
    disp('||x_(k+1)-x_k|| < tol reached after N iterations')
    disp(N);
    disp('x = ');
    disp(x(:,N));
    break
  end
  N = N + 1;
end
if err >= tol || N > MaxIt
  disp('unsuccessful Jacobi iteration:');
end
