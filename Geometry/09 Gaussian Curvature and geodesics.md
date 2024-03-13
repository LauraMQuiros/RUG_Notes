[[Euler's Theorema Egregium]]: 
highlights of he proof
$$k= \frac{det(II)}{det(I)} =\frac{det\begin{pmatrix} \langle f_{uu}, n \rangle & \langle f_{uv}, n \rangle \\  \langle f_{uv}, n \rangle & \langle f_{vv}, n \rangle  \end{pmatrix}}{det\begin{pmatrix} \langle f_{u}, f_{u} \rangle & \langle f_{u}, f_{v} \rangle \\  \langle f_{v}, f_{u} \rangle & \langle f_{v}, f_{v} \rangle  \end{pmatrix}}$$


A surface $P$ inside hypersurface $\mathbb{R}^n$, and normal vector $n$ at point $p$. Unit vector x inside the tangent plane. 
Plane curve $\gamma$ is the intersection of $M^{n-1}$ (spans by the two vectors (n and tangent)) and surface P. The curvature of this plane curve is called  [[Normal Curvature in direction x]]. 
$k_\gamma (p) \rightarrow$ normal curvature
A more specific case arises if $e_1 ... e_{n-1}$ is an orthonormal basis of $T_pM^{n-1}$ (Q is diagonal and [[First Fundamental Form]] G = Identity) then 
	$k_{p(\vec{n}, e_i)} (p) \rightarrow$ principal curvature (p is span by n and $e_i$) $\lambda_i$

>[!todo] Diagonalisation of Q

Gaussian and mean curvature has a relation 
	$k(p) = \Pi^{n-1}_{i=1} \lambda_i$ is a product of the principal curvatures
	$H(p) = \frac{1}{n-1} \frac{1}{n-1} \sum^{n-1}_{i=1} \lambda_i$ mean curvature is a weighted sum

[[Euler's Theorem]]: if $M^2$ is a regular hypersurface in $\mathbb{R}^3$ and we have 
let's get two directions $e_2$ and $e_3$ and $x= \cos \theta \vec{e_1} + \sin \theta \vec{e_2}$, for which x is a unit vector. Then the curvature of the intersection between m and p(n, x) uses the principal curvatures $K_x= \cos^2 \theta \lambda_1 + \sin^2 \theta \lambda_2$ 

Proof: 
$$II (x,x) = k_x = \langle \gamma''(0), \vec{n} \rangle$$

we want to prove that it can be expressed in terms of the first fundamental form
we use $n = \frac{( f_u \wedge f_v)}{|| f_u \wedge f_v || }$
we use $f_u \wedge f_v  = fu^2 * fv^2 * sin^2 \alpha$ which is the det of the first form

so $n= \frac{( f_u \wedge f_v)}{\sqrt{detI'}}$

the 
inner product and cross product that is why $f_uu, n = det(fuu, fu, fv) \ detI '$
the inner product of two inner product determinants is equal to the determinant of the inner product. We can express this in terms of inner products involving the first derivatives

$$\begin{align}
\delta / \delta u <fu, fv> &= <fuu, fv> + < fu, fuv> \\ & \Rightarrow <fuu, fv> = \delta / \delta u g_{12} - 1/2 delta / delta_v g_{11}\\ &= \frac{\delta g_12}{\delta u'} - \frac{1}{2} \frac{\delta g_{11}}{\delta u^2} \\ &= \frac{1}{2} (\delta_1 g_{12} - \delta_2 g_{11} + \delta_1 g_{21}) \\
\delta /\delta v <f_u, f_u> &= 2 \cdot < f_uv, f_u > \\
\delta /\delta v <f_u, f_v> &= <f_uv, f_v> + <f_u + fvv> \\ &\Rightarrow <f_uv, f_v> = \frac{1}{2} (\delta_1 g_{22}) = \frac{1}{2} (\delta_1 g_{22} - \delta_2 g_{21} + \delta_2 g_{21})\\
\delta / i f_v, f_v &= fuv, fv + f_v f_uv \\
\end{align}$$
they cancel out in the process of the computation

$$\langle fu_i u_j, \rangle = \Gamma_{ij,k} = \frac{1}{2} \delta_i g_{jk} . \delta_j $$

- - -
[[Geodesics]]
In geometry, a geodesic is a curve representing in some sense the shortest path (arc) between two points in a surface, or more generally in a Riemannian manifold. The term also has meaning in any differentiable manifold with a connection. It is a generalization of the notion of a "straight line".

[[Christoffel Symbols]]: Christoffel symbols are an array of numbers describing a metric connection. The metric connection is a specialization of the affine connection to surfaces or other manifolds endowed with a metric, allowing distances to be measured on that surface. 

1. locally minimising curves parametrised by unit speed (the parameter is proportional to arc-length) see 
2. curves that satisfy geodesic eq-S: define [[Christoffel Symbols]] of the 1st kind as $$r^i_{kj}(u) = \sum^{n}_{s=1} g^{is} \Gamma^{u}_{kj,s}$$ where $$(g_{u}^{is}) = (g^{u}_{is})^{-1}$$ inverse of the [[First Fundamental Form]]. Then the [[Geodesics]] equations one $$\ddot{u}^i = \Gamma^i_{kj} \dot{u}^k \dot{u}^j = 0$$ 
3. For surfaces $M^{n-1} \subset \mathbb{R}^2$ is a hypersurface R^n then  if r''(s) normal to  n(s). And there is s-(a multiple of) arc-length

Proof of $2 \Leftrightarrow 3$ for hypersurfaces in R^n
gamma(s) = f(u(s)), \gamma = f \circ u 

1st derivative
$$\begin{align}
f'(u(s)) &= \frac{\delta f}{\delta u^i} \cdot \frac{\delta u^i}{\delta s} \\
f''(u(s)) &=  \frac{\delta^2 f}{\delta u^i u^j}  \frac{\delta u^i}{\delta s} + \frac{\delta f}{\delta u^i} \frac{\delta^2 u^i}{\delta s^2} \tag{conditions of normality} \\
0 &= \langle f''(u(s)), f_{u^i}(u(s)) \rangle \tag{for $k= 1, \cdots, n-1$} \\
0 &= \langle \frac{\delta^2 f}{\delta u^i u^j} , \frac{\delta f}{\delta u^k}  \rangle \frac{\delta^2 u^i}{\delta s^2} \\ &= \Gamma_{ij} (u) \dot{u}^i \dot{u}^j + g_{ik} \ddot{u}^i = 0 \tag{multiplicaiton by FFF ($g_ij$) on the left} \\
\Gamma_{ij} (u) \dot{u}^i \dot{u}^j + g_{ik} \ddot{u}^i &\Leftrightarrow \ddot{u}^i = \Gamma^i_{kj} \dot{u}^k \dot{u}^j = 0
\end{align}$$
$w = \sum a_{i_1, ... , i_k} (x) d x^{i1} \wedge \cdots \wedge d x^{ik}$ act upon vectors 

- - -
Geometry of Constant Curvature Spaces

there are three constant curvatures types 

| k \equiv 1 (R > 0)               | k \equiv 0             | k  \equiv -1 (R < 0)            |
| -------------------------------- | ---------------------- | ------------------------------- |
| spheres of radius $1 / \sqrt{R}$ | Affine euclidean space | pseudo-sphere, hyperbolic plane |
|                                  | cylinders, cones       | tractrix                        |
|                                  |                        |                                 |

$S^2_R = \{ (x,y,z) | x^2 + y^2 + z^2 =(\mathbb{R}^2) \}$ is 
and $I = \frac{4 (du^2_1 + du_2^2)}{(1 + (u^2)^2 + (u^2)^2}$ for which first 2 is from u^2 and second one is squared

hyperbolic plane in $\mathbb{D^2}$ the unit disc, 
upper half-plane model $I = \frac{dx^2 + dy^2}{y^2}$ 

HW!