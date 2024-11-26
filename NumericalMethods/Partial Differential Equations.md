[[PartialDifferentialEquations.pdf]] 

Index: 
- [[Parabolic PDE]]s
- Stability and consistency
	- Consistency ([[Local Truncation Error]])
	- [[Stability]]
	- [[Lax Equivalence Theorem]]
-  Discretisations
	- Spatial discretisation
	- Explicit time discretisation
	- Implicit time discretisation
- Crank Nicolson
- - -
# [[Parabolic PDE]]s
PDEs being [[Partial Differential Equations]] that describe things like heat conduction, temperature, diffusion, time-dependence of concentrations, viscous effects... etc. 
For example this is a diffusion equation for variable $u=u(x,t)$ with diffusion coefficient $D$ $$\frac{\partial u}{\partial t} = D \frac{\partial^2 u}{\partial x^2}$$ however, it may also be the heat diffusion coefficient $\kappa = \frac{\lambda}{\rho C_p}$ for heat conduction coefficient $\lambda$, density $\rho$ and specific heat $C_p$.

Is important to keep in mind both temporal initial conditions such as at $t=0, u(x,0) = \phi(x)$ and spatial boundary conditions such as $u(0,t)=U_L(t), u(L,t)= U_R(t)$ for spatial coordinates $x \in [0,L]$ 
- - -
# Stability, Consistency

The discretisation is [[Consistent]] with the [[Parabolic PDE]] when the difference between them $\rightarrow 0$ for $\Delta x \to 0, \Delta t \to 0$. This difference is expressed in the [[Local Truncation Error]], which is the order of $\Delta t, \Delta x$ thrown away for approximation given a discretisation and method. 

For example, spatial explicit discretisation has $T(m\Delta x, n\Delta t)= \mathcal{O}(\Delta t, \Delta x^2)$. This doesn't mean convergence just yet, since we need $u^n_m \to u(x,t)$ for  $\Delta x \to 0, \Delta t \to 0$ for that.

[[Stability]]: errors in initial and boundary conditions shouldn't grow too fast. Coefficients must be $0 \leq r \leq \frac{1}{2}$ so choose $\Delta t, \Delta x$ appropriately. If stable, convergent. In fourier analysis: no Fourier component of the numerical solution should grow faster than the fastest possible growth of the exact solution.

[[Convergence]]: a scheme is convergent if $\epsilon^n_m := u^n_m - u(m\Delta x, n\Delta t) \to 0, \Delta x \to 0, \Delta t \to 0$ and it happens if we have [[Stability]].

[[Lax Equivalence Theorem]]: If a numerical scheme is consistent with the differential equation (i.e., the scheme’s truncation error goes to zero as the step sizes go to zero) and is stable, then it is guaranteed to converge to the true solution as the grid is refined.
- - -
## Discretisation 

1. [[Spatial Discretization]]
Technique to approximate the second derivative via relations between $u$-values at mesh points (as already introduced in [[Matrix-vector methods]]). 
First we make $M$ intervals in the range $[0,L]$ so that $\Delta_x = L/M$, such that the mesh points go from $1:M+1$ 
$$\frac{\partial^2 u}{\partial x^2} (X_m,t) = \frac{u(x_{m+1},t) +2u(x_m,t) +u(x_m,t)}{\Delta x^2} + \mathcal{O}(\Delta x^2)$$
We can neglect the higher order terms because the second order accurate approximation because for sufficiently small $\Delta x^2$, the higher orders are negligible.
Spatial discretisation function $u$ has to have the temporal and spatial initial conditions as mentioned in the [[Parabolic PDE]]s section but this time for $u(t=0), u_0, u_{M+1}$ 

2. [[Explicit Time Discretization]]
At each time $t= (n+1)\Delta t$ we can approximate $$\frac{d u_m}{dt} (t) = D \frac{u_{m+1}(t) -2u_m (t) + u_{m-1}(t)}{\Delta x^2} = f(u_{m-1}, u_m, u_{m-1})$$ which for example for an explicit euler method $u_m^{n+1}= u^n_m + \Delta t f(u_{m-1}, u_m, u_{m-1})$ will be $$u^{n+1}_m = r u^n_{m-1}+ (1-2r) u^n_m +ru^n_{m+1}$$ for $r= \frac{\Delta t D}{\Delta x^2}$ 

3. [[Implicit Time Discretization]]
When using implicit euler $u^{n+1}_m = u^n_m + \Delta t D \frac{u^{n+1}_{m+1} -2u^{n+1}_m +u^{n+1}_{m-1}}{\Delta x^2}$ with same $r$ value and final eq $$\begin{align} -r u^{n+1}_{m+1} + (1-2r) u^{n+1}_m - r u^{n+1}_{m+1} &= u^n_m \\ -u^{n+1}_{m+1} + (1/r-2) u^{n+1}_m - u^{n+1}_{m+1} &= u^n_m/r \end{align}$$Same as explicit: 1st order convergence in time and 2nd order spatial convergence. Consistent. The amplification factor $\frac{1}{1+4r \sin^2 (b\Delta_x /2)} <1$ for all $r > 0$ so implicit is unconditionally stable. Because it's stable and consistent, according to [[Lax Equivalence Theorem]], it will converge.
We can also make this system of equations into a linear system 
$$\begin{pmatrix}1 & 0 & & \\
-1 & 2+ 1/r & -1 \\ & \ddots & \ddots & \ddots \\ & & -1 & 2+1/r & -1 \\ & & & \ddots & \ddots & \ddots \\ & & & & - 1 & 2+1/r & -1 \\ & & & & & 0 & 1 \end{pmatrix} \begin{pmatrix} u^{n+1} \\ u_2^{n+1} \\ \vdots \\ u^{n+1}_m \\ \vdots \\ u^{n+1}_M \\ u^{n+1}_{M+1} \end{pmatrix} = \begin{pmatrix} U_L(t) \\ \frac{1}{r} u^n_2 \\ \vdots \\ \frac{1}{r} u^n_m \\ \vdots \\ \frac{1}{r} u^n_M \\ U_R(t) \end{pmatrix}$$
- - -
# [[Crank-Nicholson]]
[[Implicit Euler Method]] is only 1st order linear convergence, but we can improve it with the [[Trapezoidal Rule]] $\frac{u^{n+1}_m - u^n_m}{\Delta t}$ such that our resulting difference equation is $$ \begin{align} -r u^{n+1}_{m+1} + (2-2r)u^{n+1}_m - ru^{n+1}_{m+1} &= ru^n_{m-1} + (2-2r)u^n_m + ru^n_{m+1} \\ - u^{n+1}_{m+1} + (2/r-2)u^{n+1}_m - u^{n+1}_{m+1} &= u^n_{m-1} + (2/r-2)u^n_m + u^n_{m+1} \end{align}$$ this has a 2nd order both spatial and time convergence, can also be put in a linear system and might allow higher $\Delta t$ (less computation time) with equal or better results due to its 2nd order convergence.