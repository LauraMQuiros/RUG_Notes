A [[Quadric hypersurface]] in $\mathbb{K}^n$ the locus of pts satisfying a degree 2 eq-n $\sum_{i,j=1}^n a_{ij} x_i x_j + \sum_{j=1}^n b_j + x_j + c = 0$. This is a polynomial q.
Assuming $\sum a_{ij} x_i x_j \neq 0$. 
A [[Quadric]] is an equivalence class of such degree 2 polynomials where two such polynomials p and q are equivalent iff $p= \lambda Q,\lambda \neq 0$ where $\lambda$ is an arbitrary $\mathbb{K}$.

These are distinction between polynomial and points forming the polynomial but this is notation.
[[Ruled surface]]: is such that it is spanned by a constant-s family of lines. For every point you fix a line, so the lines will span you a surface out of this family of lines. Surface that can be written as a union of lines.
>[!important] This means:
>That the ruled surface at all points, there is a straight line parametrised by arclength s going through that point. All of these lines can be parametrised as a family of lines. By knowing these family of line that "span" the surface,  you can connect or span the lines and  recreate the surface or a surface segment if u don't have all lines




Some quadrics in $\mathbb{R}^3$ and whether their surface is ruled or not
1. ellipsoid, not $$\frac{x^2}{a^2} + \frac{y^2}{b^2} +\frac{z^2}{c^2} = 1$$
2. hyperboloid of 1-sheet, yes $$\frac{x^2}{a^2} + \frac{y^2}{b^2} -\frac{z^2}{c^2} = 1 $$
3. hyperboloid of 2-sheets, not, topologically same as elliptic paraboloid. locus has real solution if beta a or real solution $$\frac{x^2}{a^2} - \frac{y^2}{b^2} +\frac{z^2}{c^2} = 1$$
4. elliptic paraboloid, yes 
![[elliptic-paraboloid.jpeg | 200]]$$z = \frac{x^2}{a^2} + \frac{y^2}{b^2}$$
6. hyperbolic paraboloid (saddle), yes $$z = \frac{x^2}{a^2} - \frac{y^2}{b^2}$$
7. union of two planes equates to a constant, yes $$\frac{x^2}{a^2}=1$$
8. parabolic cylinder, equates to a linear function, yes $$z = \frac{x^2}{a^2}$$
9. cylinders, yes 

Coefficients. $\lambda_i$ is equal to $\pm 1$ or 0, so the abc are defined by matrix w diagonal lambdas. 

Why is hyperbolic paraboloid a ruled surface?
	a line spanning a ruled surface will be mapped to another line due to the characteristics of the affine/linear map $x \mapsto ax, y \mapsto by$, then is equivalent to ask whether $z= x^2 -y^2$ is a ruled surface
	Now lets replace $\eta= x+y, \xi = x-y$ so $z=\xi \cdot \eta$ 
	Let's say $\xi$ is a parameter and z is a line in $z-\eta$ plane, with a system of equations $$\begin{cases}\xi=\xi \\ \eta=\eta \\ z = \xi \cdot \eta\end{cases}, \gamma(t)= \{I= \xi \cdot \eta\}, D_t = \begin{cases}\xi=\xi \\ \eta=\frac{1}{\xi} \cdot t\\ z = t\end{cases}$$ as we know the original equation system and we know the general eq of a line $D_t$ with point in curve, parametrised by $t$, hyperbola $I$ eq and we get the system of equations $D_t$

[[Double point line]]: where a polynomial has two solutions in the surface aka when the surface meets itself

funfact about [[Singular Point]]. Tangent planes have no limit at singular points