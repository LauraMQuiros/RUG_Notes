Often ODEs are not analytically solvable. You can have a function $y\prime = f(x,y)$ with a boundary condition $y(0)=0$. We start at the boundary condition value to make the grid. We want the $y_1$ to be as close as possible to the true solution value.

## [[Eulers Method]]
The point is that $y=\frac{y_{n+1}-y_n}{x_{n+1}-x_n}$ is an approximation of $y\prime$ for which $h= x_{n+1}-x_n$ 

If the epsilon is smaller than 1 what we mean is that there is a possible requirement for stability such that 
$$\begin{align}-1&<|1+ah|<1 \tag{$h > 0, a = -5$} \\ -1&<|1-5h|\\ -2&< -5h \\ h &< \frac{2}{5} \end{align}$$

If you look at same location with smaller finer grid, you can half the exact error. Euler is a first order method.
Is a first order method so we can calculate error estimates. For second order [[Trapezoidal Method]] we have $1/3 (T(h/2)-T(h))$ and 4th order is $1/15 (T(h/2)-T(h))$ so we can say that the error estimate for [[Eulers Method]] is $1/1 (T(h/2)-T(h))$. 

> [!info] Remember that in the finer grid we can only use common locations

### [[Richardson Extrapolation]] in [[Eulers Method]]
It was 2nd order method $4/3 T(h/2) -1/3 T(h)$ so for first order is $2/1 T(h/2) -1/1 T(h)$ 

[[Stability]] in [[Eulers Method]]
If when calculating stability with a pseudo function gives you a poor stability value then the real thing will also be bad.

## [[Runge-Kutta Method]]
Large stability region, small truncation error (1st or 2nd order of convergence)

stability computation
