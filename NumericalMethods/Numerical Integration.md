We are going to solve integrals, which product we will define as $I$, interval divided in N parts each of them denoted with length $h= \frac{b-a}{N}$. This is what we call `mesh`. We will be using the concept that the total integral is the sum of the sub-areas. $$I= \int_a^b f(x)dx$$
Image of the rectangles under the curve of an integral
	![[RiemmannSummation.png]]

Table of contents
- Midpoint Rule
	- error estimate
	- local error
	- global error
- Trapezoid Method
	- q-factor
- Simpsons Rule
	- Error estimation by halving $h$
	- Extrapolation
- - -
## Midpoint Rule
[[Midpoint Rule]]: We will state that the height of the rectangles will be the height of the midpoint of the base, since we have centered it in this way. So height is $f(x_{i-1}+h/2)$ and base is h so area will be $h*f(x_{i-1}+h/2)$ per rectangle.
We can then say that the area under the curve will be something along the lines of $$R(h)=h*( f(a+\frac{1}{2}h)+ f(a+\frac{3}{2}h) + \dots + f(a+(n-\frac{1}{2})h))$$
### [[Error Estimate]] in the [[Midpoint Rule]]
A brief review on error types:
The [[Exact Error]] is also called the absolute error.  
The [[Global error]] in the midpoint rule can be expressed as $\epsilon \approx c h^2$ where $c$ is a constant that depends on the second derivative of the function being integrated.
The [[Truncation Error]] is the difference between the exact integral and the result produced by using any approximation, abstracted away and expressed in terms of O-notation based on step size $h$. 
This method has [[Quadratic convergence]] as the estimated error is proportional to the $h^2$. 

If we duplicate the number of rectangles N, we quadruplicate the convergence rate.

### [[Local Error Midpoint Method]]:
Absolute difference between genuine area in the interval $[x_{i-1},x_i]$ under the function and the calculated area with $x_m= x_{i-1}+ \frac{h}{2}$ and using $f(x)$ as a Taylor series around $x_m$ $$\epsilon_i(h) = |\int_{x_{i-1}}^{x_i} f(x) dx - \int_{x_{i-1}}^{x_i} f(x_m) dx|=  \frac{1}{24} f_m\prime\prime h^3 + \frac{1}{1920} f_m\prime\prime\prime\prime\prime h^5 $$
We can ignore the higher-order terms to calculate the error. Often the even powers will disappear. 

### [[Global Error Midpoint Method]]
We can calculate the [[Global Error Midpoint Method]] $\epsilon(h)$ as the summation of all the [[Local Error Midpoint Method]] $\epsilon_i(h)$, global $=\sum_N$ local.

We remember that $N$ is the number of segments, $h=\frac{b-a}{N}$ is the distance of each rectangle base and $max_{x \sim [a,b]} | f\prime\prime (x) | \leq M$ is the maximum absolute curvature of the function. 

Each subinterval has an error $\epsilon_i(h)=\frac{1}{24} f_m\prime\prime h^3$ so the sum of all $N$ subintervals is $\epsilon(h)= \frac{1}{24} f_m\prime\prime h^3 N$ and using maximum absolute curvature $M$, we can say that $$\epsilon(h)\leq  \frac{1}{24} M h^3 N = \frac{1}{24} \frac{b-a}{N} Mh^2N= \frac{b-a}{24} Mh^2 $$
In other words the summation of all local errors is smaller than the summation of all maximum local errors. The global error is proportional to $h^2$, aka quadratic convergence.
This calculation below has $b-a=1$ .
$$h = \frac{b-a}{N} \Rightarrow h \sim \frac{1}{N} \Rightarrow N \sim \frac{1}{h}$$
>[!important] Taylor higher order
>It is possible to neglect 4th order terms and higher if $h$ is small enough
## [[Trapezoidal Method]]
In a similar manner to the [[Midpoint Rule]], we make trapezoidal figures under the curve where the individual area is $\frac{h}{2} (f(x_{i-1})+f(x_i))$ and the total area $$T(h) = h * (\frac{1}{2}f(a)+f(a+h)+f(a+2h)+ \dots + f(a+(n-1)h)+ \frac{1}{2}f(b))$$
This is also has [[Quadratic convergence]] as long as the double derivation behaves well. The [[Truncation Error]] is $\epsilon_i=O(h^3)$ for a [[Local Error]] $$\epsilon_i (h)= \frac{h^3}{12}f\prime\prime(x_{i-1})+ O(h^4)$$ and a [[Global error]] identical to the [[Global Error Midpoint Method]].
Example for an estimated error calculation
	Let's make an example in which $[a,b]$ is $[1,0]$ and $f(x)=f\prime(x)=f\prime\prime(x)=e^x$ 
	We know that the error is at most $e^1$ so $\epsilon \leq \frac{1}{12} (\frac{1}{8})^2*e$

[[Convergence Ratio (q-factor)]]: The integration has a global error $T(h) \approx I \pm ch^2$ for $h$ distance. If you half the $h$ the error grows 4 times smaller. We call this the convergence ratio and can be further calculated as $$q(h/2)= \left |\frac{T(h)-T(h/2)}{T(h/2)-T(h/4)}\right | = 4$$If $q$ not close to 4 then 
- $h$ not small enough $\Rightarrow$ 3rd-order terms in $\epsilon$ not negligible w.r.t. 2nd-order term $ch^2$ 
- function $f$ not smooth enough
>[!important] Q is nothing but $q=2^\alpha$
## [[Simpson's Rule]]
Based on a parabolic approximation $$\text{Area}_i = \frac{h}{6} (f(x_{i-1})+ 4f(\frac{x_{i-1}+x_i}{2})+f(x_i))$$ where we can make it faster by saying that we have an `xm= (x(n-1)+x(n))/2`
For the simpson rule the [[Local Error]] is $$ \epsilon_i(h) = \frac{\hat{h}^5}{90}f ^4(\xi), \xi \in [x_{i-1}, x_i]$$ for $\hat{h} =h/2$ and $\max_{x \in[a,b]} |f^4 x| \leq M$, while the [[Global error]] in `[a,b]` is 
$$\begin{align}\epsilon(h) &\leq \frac{\hat{h}^4}{180} (b-a)M \end{align}$$

### Error estimation by halving $h$
Error estimate formula for 4th order method
quadratic convergence is $\epsilon_{h/2} \approx 1/3 (I_{h/2}-I_h)$
simpson has 4th-order convergence $\epsilon_{h/2} \approx 1/15 (I_{h/2}-I_h)$
off-grid you already have a good answer

## [[Richardson Extrapolation]]
Also known as $T_2$ extrapolation, it is more accurate for small $h$ and decreases error by a factor of 4 but is slightly less computationally efficient.
To estimate error of the trapezoid extrapolation, we know that we want it to decrease error by factor of four
$$
\begin{align}
T(h/2) &=I+a^2​(\frac{h}{2}​)^2+\mathcal{O}(h^4)=I+a_2​h^2​+\mathcal{O}(h^4) \sim \mathcal{O}(h^2)\\
4 T(h/2)- T(h) &= 4I+ a_2 h^2 + \mathcal{O}(h^4)-I-a_2h^2- \mathcal{O}(h^4)= 3I+\mathcal{O}(h^4)\\
\frac{4T(h/2)-T(h)}{3} &= I + \mathcal{O}(h^4) \sim \mathcal{O}(h^4) \\
T_2 &= T(h/2)+ \frac{T(h/2)-T(h)}{3}
\end{align}
$$


