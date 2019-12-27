function S = SimpsonsRule(f,a,b,n)
% SIMPSONSRULE computes the integral of f by subdividing the
% interval [a,b] into an even number n of intervals using
% Simpson's rule.
    x = linspace(a,b,n+1);
    S = feval(f,a) + feval(f,b);
    for i=2:2:n
        S = S + 4*feval(f,x(i));
    end
    for i=3:2:n-1
        S = S + 2*feval(f,x(i));
    end
    S = (b-a)*S/(3*n);
end
