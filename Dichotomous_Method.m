figure; hold on;
xl = -1;
xu = 12;
epsilon = 10^(-4);                 % accuracy value
f= @(x) x^2*exp(-x);               % function
tol = 10^(-5);                     % tolerance
n=0
xlabel('Iteration')
ylabel('Function value')
while (abs(f(xl)-f(xu))>tol)
    xm = (xl+xu)/2;
    if f(xm+epsilon) < f(xm)
        xl = xm + epislon;
        xu = xu;
        plot(n,f(xm),'ro')
    end    
    if f(xm-epsilon) < f(xm)
        xl = xl;
        xu = xm - epsilon;
        plot(n,f(xm),'ro')
    end
    n = n+1
end