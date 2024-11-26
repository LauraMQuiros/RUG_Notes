You want a curve that goes through all the data points exactly. We could make an M-1 th order polynomial for M points with [[Lagrange Interpolation]] but high-order polynomials are problematic and may amplify statistical errors. 

Alternatively we can try to fit a smooth curve $y(x)$ through the dots, such that we look at the errors $\epsilon_i=y(x_i)-f_i$ to make it as good as possible and we choose beforehand the shape of the curve (straight line, parabola, exponential, ...)

- Least Squares method
- Straight line
- Polynomial
	- Parabola
	- Exponential
- - -
## [[Least Square Method]]
Way of fitting the approximating curve such as we mentioned before, trying to minimise the sum of the squared (and therefore always positive) errors
$$\sum^M_{i=1} \epsilon^2_i = \sum^M_{i=1} (y(x_i)-f_i)^2$$

## [[Fitting Straight Line]]
How do we determine the $a,b$ such that $y(x)=a+bx$ goes through every $(x_i, f_i)$ for $i=1...M$ ? 
We consider errors $\epsilon_i=a+bx_i-f_i = y(x_i) -f_i$ and want to minimise $\psi(a,b)=\sum^M_{i=0} \epsilon^2_i$ as expressed in [[Least Square Method]]. How do we minimise? making the derivative and equaling it to 0, so $\frac{\partial \psi}{\partial a}= \frac{\partial \psi}{\partial b}= 0$ . We know that the partial derivative of the sum of all instances of error is 0.  
Using chain rule $$\begin{align}\frac{\partial \psi}{\partial b} &= 0 \\ \frac{\partial}{\partial b} \left ( \sum^M_{i=0} \epsilon^2_i \right ) =  2\epsilon_i \frac{\partial \epsilon_i}{\partial b} = 2 \sum_{i=0}^M \epsilon_i x_i &= 0\\\sum^M_{i=0} \epsilon_i = 0,  \sum^M_{i=0} \epsilon_ix_i &= 0 \end{align}$$
and substituting $\epsilon_i=a+ bx_i -f_i$ arrive at $M_0 a + M_1 b = F_0, M_1 a + M_2 b = F_1$ where $$\begin{align} M_0 &= M, M_1 = \sum^M_{i=1} x_i, M_2 = \sum^M_{i=1} x_i^2 \\ F_0 &= \sum^M_{i=1} f_i, F_1 = \sum^M_{i=1} f_i x_i\end{align}$$ and then solve for values of $a,b$.

## [[Fitting a polynomial]]
You need at least three points for a polynomial fit, so in a similar fashion we will have a list of $$\begin{align} M_0 a_0 + M_1 a_1 + M_2 a_2 + \cdots + M_{N+0} a_N &= F_0 \\ &\vdots \\ M_N a_0 + M_{N+1} a_1 + M_{N+2} a_2 + \cdots + M_{2N} a_N &= F_N \end{align}$$ whose $M_N, F_N$ are calculated similarly to previous section. 
### [[Fitting a parabola]]
We may be interested in centring the datapoints ($x_i=2,4,6,8,10$) with a transformation ($\hat{x}= \frac{x-6}{2}$) so that is all around 0, we will have more balanced an easier to solve set of equations (matrix).Then don't forget to transform back when potting it into the final parabola

### [[Fitting an exponential]]
There are two types: first $y(x)=a e^{bx}$
When we are working with an exponential we will want to use `ln()` such that $\ln(y)=\ln(a)+\ln(e^{bx})= ln(a)+bx$ which is of the form $\hat{y}=\hat{a}+\hat{b}x$ which is linear. 

We can also fit $y(x)=ax^b$ by using $ln(y)=ln(a)+bln(x)$ which is also of the form  $\hat{y}=\hat{a}+\hat{b}x$ which is linear.

Therefore we can do [[Fitting Straight Line]] and then transform back. This is called [[data linearization]]