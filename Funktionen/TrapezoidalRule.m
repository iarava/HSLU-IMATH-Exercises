function T = TrapezoidalRule(f,a,b,n)
% TRAPEZOIDALRULE computes the integral of f by subdividing the
% interval [a,b] into n intervals using the trapezoidal rule.
    x = linspace(a,b,n+1);
    T = feval(f,a) + feval(f,b);
    for i=1:n-1
        T = T + 2*feval(f,x(i+1));
    end
    T = (b-a)*T/(2*n);
end
