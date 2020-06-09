# **Optimization (One-Dimensional Search Methods)**

#  What will you learn after reading this article?
An understanding of how to use one-dimensional search methods to solve unconstrained nonlinear problem and matlab example will be given.

# Meaning behind One-Dimensional Search Methods
Speaking of optimization, most of people will think about using gradient to get maximum or minimum value.  The meaning behind gradient is the differentiation of the function equals to zero. However, one-dimensional search methods can search for optimal value by setting some rules and doing it iteratively until satisfies the accuracy. Those methods will be introduced below.
    
# One-Dimensional Search Methods
* **Prerequisites: Search region should be unimodal, if it is not, the one-dimensional search may find local minimum instead of global minimum in the search region.** 

 
# **Golden Search Method**
Golden search method will keep searching minimum in the search range and then update search range until satisfies the accuracy.  In initial search range [a,b], the range will be updated by golden ratio tau (the reason why is golden ratio can be seen from the [link](https://www.itread01.com/content/1541615343.html), and then the new possible range will be found which are 

> x1 = a + (1-tau) * (b-a)
> x2 = a + tau * (b-a)
    
and there are two conditions need to be taken into consideration
    
**1. f(x1)＜f(x2)**
This means the minimum is located between [a,x2], so b will be substituted by x2 and then update the search region between [a,x2] and x1, x2.        

**2. f(x2)＜f(x1)**
This means the minimum is located between [x1,b], so a will be substituted by x1 and then update the search region between [x1,b] and x1, x2.
go to the next iteration and check if the function value satisfies the accuracy or not.
    **STEPS**
    **1. If b-a<epsilon stop. Otherwise**
>x1 = a + (1-tau) * (b-a)
>x2 = a + tau * (b-a)
>
**move to the second step if f(x1)＜f(x2) 
or move to the third step if f(x2)＜f(x1)**
    **2. Update the search region to [a,x2] and also update function value which is shown below**
> b = x2 search between [a,x2] and then update x
> x2 = x1
> x1 = a+(1-tau) * (b-a)
> 
**3. Update the search region to [x1,b] and also update function value which is shown below**
> a = x1 search between [x1,a] and then update x
> x1 = x2
> x2 = a+tau*(b-a);
    
**4. Go to the next interation**
> k = k + 1
    



# **Dichotomous search method**
Dichotomous search method will update search region by comparing the function value of middle point and the point which is near to the middle point. If the point which is just a little bit righter than the middle has smaller function value than the middle point, that will mean the minimum will be on the right hand side.  Then set the new upper bound as the same, while the lower bound will be changed to the point is just a little bit righter than the middle point until it meets the requirement.  For the minimum point on the left hand side, vice versa.
***STEPS***
**1. If abs(xl-xu) < tolerance stop. Otherwise**
>xm = (xl + xu) / 2 
>    
**2. If f(xm + epsilon) < f(xm)**
> xl = xm + epsilon
xu = xu
    
**else**
> xl = xl
> xu = xm - epsilon
    
**3. Go to the next iteration**
> n = n + 1
# Example
***Question :　Find local maximum and minimum points of the function f(x) = x2e-x within the interval [-1, 12]***

---

* **Golden search method** 
```
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
```
![](https://i.imgur.com/0Co9AWE.png)

* Golden search method terminates when interation equals to thirty, where x equals to 11.99 and the function value equals to 8.85e^-4 which satisfies the requirements.

---

* **Dichotomous Search**
```
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
```
![](https://i.imgur.com/e8IH1Qy.png)
* Dichotomous Search method terminates when iteration equals to nine, where x equals to 11.98 and function value is 8.9410e^-4.

# Discussion 
Both of the golden search method and Dichotomous method can find minimum. How to decide the search region is a really important issue in dimensional search because if the function is not unimodal in the search region, this method will fail.  The importance of search region will be shown in Two-Dimensional search.
# Related knowledge
* Unconstrained nonlinear programming
* Unimodal function
* Fibonacci method
* N-Dimensional search methods
# Reference
* Golden search method: [https://www.itread01.com/content/1541615343.html](https://www.itread01.com/content/1541615343.html)




