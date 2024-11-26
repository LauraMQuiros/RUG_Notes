# 1 Direct Methods for Ax=b 
[[DirectMethodsforAx=b.pdf]]

You want to solve a linear system $A\vec{x} = \vec{b}$ where A is an NxN matrix. 
There are subdivision methods such as: 
- direct methods: Gaussian elimination, LU
- iterative methods: Jacobi, Gauss-seide, SOR
## [[Direct Subdivision Methods]]
### [[L-substitution]]
Consider that the linear system is $L\vec{x}=\vec{b}$ and $L$ is a lower-triangular matrix. We can solve top to bottom by substituting and we get $n^2$ operations, which is not ideal $$\begin{align}\begin{pmatrix} l_{11} & 0 & 0 \\ l_{21} & l_{22} & 0 \\ l_{31} & l_{32} & l_{33} \end{pmatrix} \begin{pmatrix}  x_1 \\ x_2 \\ x_3\end{pmatrix} &= \begin{pmatrix} b_1 \\ b_2 \\ b_3\end{pmatrix} \\ x_1 &= b_1/l_{11} \\ x_2 &= (b_2 - l_{21}x_1)/l_{22} \\ x_3 &= (b_3 - l_{31}x_1 - l_{32}x_2)/l_{33} \\ \cdots \\ x_i &= \frac{1}{l_{ii}} (b_i - \sum^{i-1}_{j=1} l_{ij} x_j) \end{align}$$ had we had an upper-triangular matrix, it would've had same number of operations and same substitution method but $\sum^n_{j=i+1}$ because we go backwards.
### [[Gaussian Elimination Method (GEM)]]
row reduction of general matrix $A_{ij}$ until you arrive to the upper-triangular matrix. So the $m$ is the multiplier, which is the division of the previous column and the current column for row $i>k$. Now we update the values in row $i$ and column $j$ to be the previous value minus the multiplier by the value of previous row, same column.
$$\begin{align}m_{ik} &= \frac{a^k_{ik}}{a^k_{kk}} \\ a_{ij}^{k+1} &= a_{ij}^k - m_{ik} a_{kj}^k \\ b_{i}^{k+1} &= b_{i}^k - m_{ik} b_{k}^k \end{align}$$
we have $\frac{2}{3} n^3$ operations and an upper-triangular matrix we can solve with [[L-substitution]]. Due to the way this division works, the main diagonal cannot be made out of zeros.

>[!info] GEM Theorem
>If matrix A is diagonally dominant per row or column or it's symmetric and positively definite, then it is [[Gaussian Elimination Method (GEM)]] safe

What is diagonally dominant?
	When $|a_{ii}| \geq \sum^n_{j=1,j\neq i} |a_{ij}|$ aka the sum of all the other diagonals are smaller or equal than the main diagonal
What is a symmetric and positive definite matrices?
	Symmetric ($a_{ij}=a_{ji}$), pos def $(Ax,x)>0, \forall x \neq 0$ aka for any vector $x\neq0, x^TAx=0$, and therefore all eigenvalues are pos and matrix is invertible
### [[LU-factorisation]]
Less operations if we say that $LU=A$ such that $L$ is the lower-triangular + diagonal filled with 1 and $U$ is the upper diagonal and OG diagonal. The method itself uses the [[Gaussian Elimination Method (GEM)]] multiplier and row reduction method, but because both are triangular systems now, the solution is faster. Same number of operations as [[Gaussian Elimination Method (GEM)]] tho.

>[!info] LU Factorisation theorem
>If a matrix $A$ is diagonally dominant per row or column then [[LU-factorisation]] exists

### [[TDMA]]
When we have tridiagonal matrices we can do a different kind of [[LU-factorisation]] where $a_1=\alpha_1, a_i = \alpha_i + b_i\gamma_{i-1}, \alpha_i \gamma_i = c_i, \alpha_1\gamma_1 =c_1$
$$A = \begin{pmatrix}a_1 & c_2 & 0 &  & 0 \\ b_2 & a_2 & c_2 &  & 0 \\ 0 & b_3 & a_3 & c_3 & 0 \\ \vdots & & \ddots & \ddots & \vdots \\ 0 & & & b_n & a_n \end{pmatrix} = LU = \begin{pmatrix}\alpha_1 & 0 & 0 & & 0 \\ b_2 & \alpha_2 &0 &  & 0 \\ 0 & b_2 & \alpha_2 & & 0 \\ \vdots & & \ddots & \ddots & \vdots \\ 0 & & & b_n & \alpha_n \end{pmatrix} \begin{pmatrix} 1 & \gamma_1 & 0 & & 0 \\ 0 & 1 & \gamma_2 & & 0 \\ \vdots & & \ddots & \ddots & \vdots \\ \vdots & & & 1 & \gamma_{n-1} \\ 0 & & & 0 & 1 \end{pmatrix}$$
now storage is no problem, just speed and because [[LU-factorisation]] goes much faster, the number of operations is $\mathcal{O}(2np + 2nq)$ where p is the lower and q is the upper bands over the main diagonal. Making [[TDMA]] $\mathcal{O}(n)$ 

- - -
# 2.  Differential Eq and $A\vec{u}=\vec{f}$
[[DEandAu=f.pdf]]

Reminder, mesh on range $[a,b]$, points $x_i = a + (i-1)\Delta x$ for mesh size $\Delta x = (b-a)/N$ 
Making ODE into taylor series as expressions for $U \prime (x)$ leads to first order accuracy (halving $\Delta x$ leads to error being halved). 
For second order derivatives we can get second order accuracy (halving  $\Delta x$ leads to error being $*1/4$) $$U\prime \prime_i \approx \frac{\frac{U_{i+1}-U_i}{\Delta_x}-\frac{U_i - U_{i-1}}{\Delta_x}}{\Delta_x} = \frac{U_{i+1}-2U_i+U_{i-1}}{\Delta_x^2}$$
[[Linear system]] for a second derivative we need two boundary conditions $U(a)= \tilde{U}_a,U(b)= \tilde{U}_b$ for $u\prime\prime +x^2u = sin(x)$ where the grid starts at $u_a = u_1$ and $u_b = u_{N+1}$ we can calculate from the [[Matrix-vector system]]
$$\begin{pmatrix}1 & & & \\
L & D & R \\ & \ddots & \ddots & \ddots \\ & & L & D & R \\ & & & \ddots & \ddots & \ddots \\ & & & & L & D & R \\ & & & & & & 1 \end{pmatrix} \begin{pmatrix} U_1 \\ U_2 \\ \vdots \\ U_i \\ \vdots \\ U_N \\ U_{N+1} \end{pmatrix} = \begin{pmatrix} U(a) \\ \sin{(x_2)} \\ \vdots \\ \sin{(x_i)} \\ \vdots \\ \sin{(x_N)} \\ U(b) \end{pmatrix}$$

![[2NDOrderODE.png | 500]]
for this case $L= 1/ (\Delta x)^2, D= -2/ (\Delta x)^2 + x_i^2, R= 1/(\Delta x)^2$

In a bridge example $U_i\prime\prime= A U_i + B (U_{x_i - 1)x_i}$ we get matrices
$$\begin{pmatrix} 1 & 0 & 0 \\ -1 & 2+\alpha-1 & 0 \\ 0 & 0 & 1 \end{pmatrix} \begin{pmatrix} w_1 \\ w_i \\ w_N \end{pmatrix} = \begin{pmatrix} 0 \\ RHS_i \\0 \end{pmatrix}$$
We solve tridiagonal matrices with things like [[LU-factorisation]], where $A=LU$ and then we only need to solve $L \vec{v} = \vec{f}, U\vec{u}= \vec{v} \to A \vec{u}= \vec{f}$ . The number of operations for it is $\mathcal{O}(2np+2nq)$ for which $p,q$ are the number of non-zero diagonals above and below the main diagonal. For tridiagonal matrices, the number of equations is $\mathcal{O}(5n) \sim \mathcal{O}(n)$  
Using TDMA, which stores only the relevant diagonals will be faster.
- - -
# 3. Iterative Methods
[[IterativeMethodsforAx=b.pdf]]

## [[Stationary methods]]
point-wise methods for $Ax = b$ there is two partition methods
1. $A=N -P$, $P$ stands for previous, $N$ is new $$\begin{align} (N-P)x &= b \\
Nx^{m+1} &= Px^m + b \\ x^{m+1} &= N^{-1}b+ N^{-1}Px^m\end{align}$$
2. $A=L+D+R$ as in Left, Diagonal and Right. This can be traced from the previous partition method as $N=D, P=-(L+R)$, which is what [[Jacobi method]] does, while [[Gauss-Seidel Method]] has $N=D+L, P=-R$ 

## [[Iterative Subdivision Methods]]
### [[Jacobi method]]
We get that $x^{m+1} = D^{-1}b -D^{-1}(L+R)x^m$ and this is reflected in the for loop $i=1 \dots N$ for iteration rule $$x_i^{(m+1)} = \frac{1}{a_{ii}} \{b_i - \sum^n_{j=1, j \neq i} a_{ij} x_j^{(m)}\}, i=1 \cdots n$$
There is four stop criteria: either 
	- $||x^{m+1} -x^m|| < \epsilon$ the absolute difference between the points and their next iteration is smaller than a given tolerance $\epsilon$
	- $\frac{||x^{m+1} -x^m||}{||x^{m+1} ||} < \epsilon$ the normalised difference between the points and their next iteration is smaller than a given tolerance $\epsilon$
	- $|| r^m || < \epsilon, r^m= Ax^m -b$ the residual difference between the solution $Ax^m$ and $b$ is smaller than a given tolerance $\epsilon$
	- $\frac{||r^m||}{||x^m||} < \epsilon, r^m$ is residual and the criteria is that the residual adjusted for solution size is smaller than a given tolerance $\epsilon$
	If $A$ is diagonally dominant then Jacobi converges with ”linear rate” $\mu$ (independent of start vector $x(0)$) with linear convergence $||e{(m+1)}||_\infty = \alpha || e^{(m)}||_\infty$ with $|\alpha| <1$. For strictly diagonally dominant, $\mu <1$ 

Exact error in iteration $m$: $|| e^m ||_\infty = || x - x^m ||_\infty$ 
Error ratio $\frac{||e^{m+1}||_\infty}{||e^{m}||_\infty}$ 
Linear convergence $||e^{m+1}||_\infty = \alpha || e^m||_\infty$ with a $|\alpha| <1$

>[!info] Jacobi theorem
>If A is diagonally dominant, then Jacobi converges with linear rate, independent of start vector $x^0$

since D is the diagonal, the inverse is just 1/d_11 and so on in the diagonal
$$(L+R)x^n = \begin{pmatrix} 0 a_{12} \ a_{13} \\ a_{21} \ 0 \ a_{23} \\ a_{31} \ a_{32} \  0 \end{pmatrix} \begin{pmatrix} x_1^m \\ x_2^m \\ x_3^m \end{pmatrix} = \begin{pmatrix} a_{12}x_2^m + a_{13}x_3^m \\ \cdots \\ \cdots \end{pmatrix}$$
the bigger the alpha in the matrix, the faster convergence

- - -
$$\begin{align} U_\epsilon = D U_{xx}, U(x=0)&=0, U(x=L=1)=0, U(t=0)=100*\sin(\pi* x) \\ \frac{U_i^{n+1}-U_i^n}{\Delta_x} &=D, \frac{U_{i+1}^{n}-2*U_i^n +  U^n_{i-1}}{\Delta_x^2} \\ U_i^{n+1} - U_i^n &= \frac{D*\Delta_x}{\Delta_x^2} (U_{i+1}^{n}-2*U_i^n +  U^n_{i-1}) \tag{$\frac{D}{\Delta_x}=R$} \\ u_i^{n+1} &= R*U_{i+1}^{n}-(1-2*R)*U_i^n +  R*U^n_{i-1} \\ 0 \leq &R \leq 1/2 \end{align}$$

exercise with the fire in the middle 
Q75 only for that specific location
first derivative 
$$Ux = 0 \left | \frac{U_{i+1}- U_i}{\Delta_x} = 0 \right |$$

### [[Gauss-Seidel Method]]
The same stop criteria and algorithm than Jacobi with update rule for Gauss-Seidel is $$x_i^{(m+1)} = \frac{1}{a_{ii}} \{b_i - \sum^{i-1}_{j=1} a_{ij} x_j^{(m+1)} - \sum^n_{j=i +1} a_{ij} x_j^{(m)}\}, i=1 \cdots n$$ For diagonally dominant matrix, [[Gauss-Seidel Method]] is also linearly convergent and also faster than [[Jacobi method]]. 
### [[(SOR)]] 
is the same update rule but with additional extrapolation using relaxation parameter $\omega$ to accelerate ($1 < \omega < \infty$) or de-accelerate ($0 < \omega < 1$, if unstable) convergence $x_i^{m+1} = \omega * \hat{x}_i + (1-\omega)*x^m_i$
It has $\mathcal{O}(n^2)$ operations and is faster than [[Gauss-Seidel Method]]
[[Gain factor]]: how much times better it is 