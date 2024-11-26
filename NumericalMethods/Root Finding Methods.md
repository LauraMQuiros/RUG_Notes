[[Root-findingMethods.pdf]]

Methods: 
- Bisection Method
- Successive Substitution Method 
	- convergence factor and order
	- convergence theorem
	- linear and quadratic convergence
	- exact and estimate error
- Newton Method
- Secant Method

Vocabulary 
$K$ convergence factor, reduction factor, convergence rate
- - -
## [[Bisection Method]]
Increase accuracy by a factor of 2 by calculating $m=\frac{a+b}{2}$. $f(a)$ will be lower if the a direction contains the crossing of the $y=0$ and $f(b)$ otherwise. So if multiplication $f(a)*f(m)<0$ means that either of them is 0 or negative, therefore we can make $b = m$ halving the search area. 
If multiplication $f(a)*f(m)>0$ then we can say that they are both positive numbers and we can move $a = m$. 

We can consider $\epsilon$ accuracy a good margin of error.

An error behaviour has form $\epsilon_{n+1}=K\epsilon_n^\alpha$ with [[Convergence Order]] $\alpha$ and [[Convergence Factor]] aka Convergence Rate $K$. So we say that linear convergence has convergence order $\alpha=1$ and $\epsilon_{n+1} = K\epsilon_n$ which is what is base to the [[Error Estimate]]. Because the quadratic convergence is to the power of 2 it wouldn't lead to the same results.

- - -
## [[Successive Substitution Method]]
We reformulate the function $f(x)$ to get $x=g(x)$. For example $$\begin{align}f(x)=0 \\ e^x+x=2 \\ e^x+x-2=0 \\ x=g(x)=2-e^x \\ f(x)=0 \Leftrightarrow x=g(x) \end{align}$$
also $$\begin{align}f(x)=x^2-3x+1 \\ g_1(x)=\frac{1}{3}(x^2+1),g_2(x)=3-\frac{1}{x}\end{align}$$ We observe from the example that with different starting values the $g_1(x)$ function are **successful** (converge to one of the exact solutions), while $g_2(x)$ seems to converge to a successful solution in both the starting values.
- - -
## Convergence Theorem
One can tell if the formula will be successful or not with the [[Convergence Theorem Successive Substitution]]. This theorem requires the following 3 to be true
- $x=p$ is a solution of $x=g(x)$
- $g(x)$ has continuous derivative in interval $I$ around $p$
- the absolute of the derivative needs to be smaller than 1 in the interval $I$ $|g\prime(x)|\leq K < 1$ so $K$ is the convergence rate or [[Convergence Factor]] (the smaller than 1 the better)

Proof? No, but let's see the example
$$\begin{align}g_1(x)&=\frac{1}{3}(x^2+1)\\ g_1\prime(x)&=\frac{1}{3}(2x)\\ g_1\prime(1)=\frac{2}{3}&, g_1\prime(3)=2 > 1 \text{ doesn't satisfy 2nd requirement}\\ g_2(x)&=3-\frac{1}{x} \\g_2\prime(x)&= \frac{1}{x^2} \\ g_2\prime(1)=1&, g_2\prime(3)=\frac{1}{9} \end{align}$$
[[Taylor series]] will be important $$\begin{align}x_n = p + \\ x_n - p = \\ \epsilon = \end{align}$$
If the first $g\prime \neq 0$ then we have a scale factor $\beta$ which leads to [[Linear convergence]]. Otherwise we have a [[Quadratic convergence]], which is our goal and can be calculated using [[Newton Method]].

We want our p to have $g\prime(x)=0$ and $g(x)=0$ otherwise it will not have [[Quadratic convergence]]. If it has $|g\prime(x)|\leq K < 1$ it will still be a [[Linear convergence]] though.
Difference between successive initial values lead to some constant which is the [[Convergence Factor]] $K<1$.

> [!info] Converge Theorem in MATLAB
>  We make a function file with the $g$ function. Then we can make code with a for loop to calculate $x_n-x_{n-1}$ and $\frac{x_n-x_{n-1}}{x_{n-1}-x_{n-2}}$. Remember to make an if $n >2$ for the second column so it doesn't show `Inf`

[[Exact Error]]: We call $p$ the last number of the first column, i.e. the exact value. We can use around 100 iterations. We use this $p$ to calculate the exact error ${exerr}_{n+1}=|x_{n+1}-p|$ only theoretically, since in practice this approximations take weeks to load. The final iteration of the exact error should be the [[Convergence Factor]] $K$. 

[[Error Estimate]]: Error calculated through the iteration process, such that estimation is stopped when estimate error $< \epsilon$. 
> [!info] Estimate error in MATLAB
> We use $\frac{K}{1-K}|x_n -x_{n+1}|$ to calculate the error estimate. In comparison with the actual error, it gives an insight into how close it is to the exact error

> [!IMPORTANT]
> The math in page 8 (exact error and error estimate) is only for [[Linear convergence]] since they don't hold if $g\prime(x)=0$. DO NOT USE THESE IF YOU HAVE [[Quadratic convergence]] !!

EE1: i ADD AND SUBTRACT $X_{N+1}$  TO THE ABS 
We use the known $|a+b| \leq |a|+|b|$ 

- - -
## [[Newton Method]]
We neglect the second and higher order of the [[Taylor series]] around $x=x_n$ to obtain $$x_{n+1}=x_n-\frac{f(x_n)}{f\prime(x_n)}$$ with the conditions that the derivative exists and is continuous for the surroundings of $x\approx x_n$ . This requires two calculations of functions per each new number, which is less efficient than other methods.

### Problems of the Newton Method
We want to have a $g$ function such that $|g\prime(p)|$ is small since the $K \approx g\prime(p)$ and a small $K$ leads to a faster convergence, as per $\epsilon_{n+1}=K\epsilon_n$
$$\begin{align} \sin(x)+x^2-2=0 \\ \alpha(\sin(x)+x^2-2=0)=\alpha*0=0 \\ x + \alpha(\sin(x)+x^2-2=0)= x \\ g_\alpha(x)\end{align}$$
By differentiating the $g(x)=x$ function you can calculate which alpha makes the $g\prime(x,\alpha)=0$ and that is our faster convergence. We have convergence if $-1 < g\prime(p) < 1$ but we chose a value very close to the ideal convergence point $x_0$, we can say that $-1 < g\prime(x_0) < 1$ and if $g\prime(x_0) \approx 0$ then the convergence is very fast.
The multiplying $g(x)$ by alpha to get the optimal alpha is called [[Alpha Boosting]] on [[Linear convergence]] and is comparable in results and better in computational efficiency in comparison with [[Newton Method]] for the [[Quadratic convergence]].

- - -
## [[Secant Method]]

We'll use an approximation of the derivative which requires the current and last n. [[Newton Method]] for the same problem doesn't half the previous error as [[Linear convergence]] would but does it quadratically (??? it goes from 3 to 6 to 12ish) which means its a quadratic method. 

We can do $\epsilon_n = \beta \epsilon^2_{n-1}$ and therefore $\beta=\frac{\epsilon_n}{\epsilon^2_{n-1}}$. If the calculation doesn't give a constant, it might not be a quadratic method.

Secant is nor quadratic nor linear. In the beginning is linear and bad approximation but as the convergence starts it starts simulating quadratic convergence better.