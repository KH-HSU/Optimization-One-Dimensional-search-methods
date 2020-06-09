figure; hold on;
a = -1;                            % start of interval
b = 12;                            % end of interval
epsilon = 0.00001;                 % accuracy value
iter= 600;                         % maximum number of iterations
tau=double((sqrt(5)-1)/2);         % golden proportion coefficient, around 0.618
k=0;                               % number of iterations
x1=a+(1-tau)*(b-a);                % computing x values
x2=a+tau*(b-a);
f= @(x) x^2*exp(-x);               % function 
f_x1=f(x1);                        % computing values in x points
f_x2=f(x2);
while ((abs(b-a)>epsilon) && (k<iter))
    if(f_x1<f_x2)
        b=x2;
        x2=x1;
        x1=a+(1-tau)*(b-a);
        f_x1=f(x1);
        f_x2=f(x2);   
        plot(k,f_x1,'ro')
    else
        a=x1;
        x1=x2;
        x2=a+tau*(b-a);   
        f_x1=f(x1);
        f_x2=f(x2);
        plot(k,f_x2,'ro')
    end
    k=k+1;
end
% chooses minimum point
xlabel('Iteration')
ylabel('Function value')