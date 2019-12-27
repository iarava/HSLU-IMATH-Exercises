function MyPi = Aufgabe4(maxit)
  Ufirst = 2*sqrt(2);
  Usecond = 2*sqrt(2);

  fprintf('rel. error for first method and second method\n');
  for i=2:maxit
    k = i;
    a1 = (Ufirst/2^k)^2;
    Ufirst = 2^k*sqrt(2*(1-sqrt(1-a1)));
    a2 = (Usecond/2^k)^2;
    Usecond = 2^k*sqrt(2*a2/(1+sqrt(1-a2)));
    fprintf('%16.14e %16.14e\n',abs(pi-Ufirst)/pi,abs(pi-Usecond)/pi);
  end
end
