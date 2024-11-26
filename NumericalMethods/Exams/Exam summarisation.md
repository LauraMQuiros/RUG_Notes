2. [[Numerical Integration]]
Methods: [[Midpoint Rule]], [[Trapezoidal Method]], [[Simpson's Rule]]
Tools: [[Error Estimate]], [[Richardson Extrapolation]], [[Convergence Ratio (q-factor)]], [[Convergence Order]]

Example question; midpoint method with two subintervals
$[-1,0,1]$ formula for midpoint method comes from the values of midpoints of the segment in comb w grid sizes
$$ \begin{align}I= 1 * f(- \frac{1}{2}) + 1 * f(\frac{1}{2}) \\ f(x) = \int^1_{-1} (2x+1)e^{x} \\ I = 1*0+1* 2e^{1/2} = 2e^{1/2} \end{align}$$
A follow up is to do the [[Halving error theorem]] which states that the error $\epsilon \leq \frac{b-a}{24}h^2M = \frac{2*1^2*M}{24}$ for which $M = \max_{[-1,1]} |f\prime \prime | = \max_{[-1,1]} | 2e^x + (2x+3)e^x |$ for this i need to differentiate once again and equal to 0 but the hint tell us that only relevant points are 1 and -1, so  $f\prime \prime (-1) = 3e^{-1}, f\prime \prime (1) = 7e$ because the highest is $f\prime \prime (1)$ then we say that $\epsilon \leq \frac{2*7e}{24}$ 
Another follow up is why error estimate is not accurate. Because $f\prime \prime (1)$ is such a huge error because the grid is too coarse and the segments are too big. We discussed that for local errors we can analyse it in terms of taylor series to have higher power of h. If h is 1 or bigger we cannot neglect higher orders of $h^n$ so not even taylor series approximation will work.
Because the M comes from one location it becomes a crude upper bound that makes the whole estimation way higher than the approximation average, it tells the error worse than using halving error theorem than the global error (???)

Exam question: how many segments do i need for an accuracy of $10^{-8}$. 
I know error is divided by four, so i can iteratively divide so i can arrive to the desired error. I will compute the error for second order
$\epsilon_{h/2} \approx 1/3 (I_{h/2} - I_{h})$ which for $\epsilon_{256} = 6.72* 10^{-5}$ and i only need to divide iteratively in our pocket calculator to know we only need to refine 7 more times. So 2^7 * 256= 32768 segments. 

A follow up is to do extrapolation $T_2(128)= 4/3 I_{128} - 1/3 I_{64}$ and for the exact error we subtract from the 3/e + e solution. 
Compared to the error from the 256 solution and ideal 32768 solution is not different while its 340 times a smaller grid (340 [[Gain factor]])

3. [[ODE]]
Methods: [[Eulers Method]], [[Runge-Kutta Method]], [[Crank-Nicholson]]
Tools: [[Convergence Ratio (q-factor)]], [[Error Estimate]], [[Richardson Extrapolation]], [[Stability Region]]

Exam question: Euler
$$\begin{align} y_{n+1} = y_n + h*f(x_n,y_n) \\ y_{1/2} = y_0 + 1/2 (4x_0y_0^2) \\ y_{1/4} = y_0 + 1/4 (4x_0y_0^2)\\ y_{1/2} = y_{1/4} + 1/4 (4x_0y_0^2)= 1+ 1/4 (4*1/4 * 1^2) = 5/n \end{align}$$ so extrap = 2(5/4) -1(1) = 3/2
$$\begin{align} y_{1/2} = y_0 + 1/2(4x_{1/2} y_{1/2}^2) = 1 + y_{1/2}^2 \\
y_{1/2} = \frac{1 \pm \sqrt{-3}}{2} \end{align}$$
Exam question: 2nd order of RK method 
show that it converges according to theory (i need to use values that live at the same grid location). $q(0.4)= approx 2^2$ according to 2nd order convergence
A follow up: epsilon(0.3) and epsilon(0.4) are e^{-5} and e^{-4} respectively. So error estimate is larger because the location is larger, since it accumulates.
A follow up: coefficient for 2nd order method is used for the extrapolation at value 0.4, so 4/3 y(0.0125) - 1/3 y() = 0.0 705 sth sth

4. [[Curve Fitting]]
Methods: [[Fitting Straight Line]], [[Fitting a parabola]], [[Fitting a polynomial]], [[Fitting a polynomial]]
Tools: [[Transformation]] 

we do coord transformation 
hat x = x -1 -2 0 2
hat y = ln(y) -1 0 2
M_0 = 3 M1= 0 M2=8 a = 1/3
b = 3/4
y(x) = e^1/3 e^3/4 (x-1)= e^{-5/12}e^{3/4 x}

5. [[Matrix-vector methods]]
Methods: [[Gaussian Elimination Method (GEM)]], [[LU-factorisation]], [[TDMA]] and iterative methods: [[Jacobi method]], [[Gauss-Seidel Method]], [[(SOR)]]
Techniques: application 2nd order ODE

Exam question: compute the max-norm of the initial residual for $\vec{x_0}$ 
$R_n = A x_n - b$ is the residual of the current solution factor $x_n$. Then if you do the inf norm of that $R_n$ (getting the abs max value of that vector)

How many [[Jacobi method]] iterations are needed to reduce this error with a factor 100
row 1: 0/1 = 0
row 2: 8/20 = 0.4 
row 3= 0.4
row 4 = 0
sum of the absolute of the sides of the diagonal divided by the absolute of the diagonal gives you the diagonally dominant value (max). That is the diagonally dominant value we will use to calculate the number of iteration
$(0.4)^n < 0.01, n \geq 6$

Exam q: perform one SOR iteration with $\omega = \frac{1}{2}$ , 
$x_i^{(m+1)} = \frac{1}{a_{ii}} \{b_i - \sum^n_{j=1, j \neq i} a_{ij} x_j^{(m)}\}, i=1 \cdots n, x_i^{m+1} = \omega * \hat{x}_i + (1-\omega)*x^m_i$ 
$\hat{x_1} = \frac{1}{20} (b_2 - ())$

Exam q: determine the value a of an ode $y^n + ay= 0$ 
we have four grid points since we have four N in NxN matrix A and boundary conditions x=0, x=1. 
Let's describe the ODE in terms of these grid points
$$\begin{align}\frac{y_{i+1} - 2y_i + y_{i-1}}{\Delta x^2} + a y_i &= 0 \\ 9(y_{i+1} - 2y_i + y_{i-1}) + a y_i &= 0 \\ 9y_{i+1} + (-18+a)y_i + 9y_{i-1} &= 0 \\ 4y_i = -1 + \frac{4}{9}(-18+a)y_i + 4y_{i+1} &= 0 \\ \frac{4}{9}(-18+a) &= -20 \\ a= - \frac{9 * 20}{4} + 18 = -9*5+18 &= -27 \end{align}$$

6. [[Partial Differential Equations]]
Methods: [[Eulers Method]], [[Implicit Euler Method]], [[Crank-Nicholson]]
Techniques [[Convergence Ratio (q-factor)]], [[Convergence Order]], [[time-stepping procedure]]

Exam q: $\frac{\partial u}{\partial t} = D \frac{\partial^2 u}{\partial x^2} + \beta (u+x)$
a) what is the max possible itme step for the explicit euler
$R= \frac{D dt}{dx^2} = \frac{0.09 * dt}{9} \leq \frac{1}{2}$, so dt < 50
b) determine solution after one timestep of dt=10 with explicit euler
$$\begin{align} u^{n+1}_m &= R u^n_{m-1} + (1-2R)u_m^n + Ru^n_{m+1} \\ u^{n+1}_2 &= 0.1 u^n_{1} + 0.8 u_2^n + 0.1 u^n_{3} = 9 \end{align}$$
c) beta =0.1
$\frac{U_i^{n+1} - u_i^n}{\Delta t} = D \frac{U_{i+1} - 2U_i + U_{i-1}}{\Delta x^2} + \beta U_i + \beta x_i$  
