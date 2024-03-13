[[Tangent Spaces]] for a given surface
proposition: the following are equivalent representations of a tangent space to a regular hypersurface $M^{n-1} \subset \mathbb{R}^n$

1. By definition tangent space $TpM \bot \vec{n}(p), p \in TpM$ , $n \bot$ vectors $\vec{r_1} (p), \vec{r_{n-1}}$, where $\vec{r_i} = \begin{pmatrix} \frac{\delta x^1}{\delta u^i} \\ \frac{\delta x^n}{\delta u^i} \end{pmatrix}$ which are velocity vectors. We get two parametrised curves $u_1, u_2$ that cross at point p, and we derive them to get the two tangent vectors. The normal vector must be orthogonal to those r_1 and r_2 tangent vectors. 
Positive basis of $\mathbb{R}^n$: $(\vec{n}, \vec{r_i}, ..., \vec{r_{n-1}})$ if you also specify the orientation of the vectors, also this is the tangent hyperplane and the direction of the plane is specified. So hyperplane is orthogonal to the gradient 

2. Can be conceptualised as a space of velocity vectors of curves $T_p M= \{ \gamma'(0)$ where $\gamma \cdot I \rightarrow M^{n-1}$ is $C^1$-smooth and $\gamma(0)=p\}$
3. $T_pM= \{$ the set of derivations $D: C^\infty(U \subset M^{n-1}) \rightarrow \mathbb{R}$ , for which $p$ is inside object $U$ such that
- $D_1 + \lambda D_2$ is a derivation
- $D(f + \lambda g) = D(f) + \lambda D(g)$
- $D(fg) = (Df)(g(p)) + (Dg)f(p)$: [[Leibnitz Rule]] }

4. Directional derivative along the tangent vector. If $\xi \in T_pM, \xi= \dot{\gamma}(0) \Rightarrow$ one can define a derivation as $\nabla_\xi (f)= df(\xi)= \frac{d}{dt} |_{t=0} f(\gamma(t))$. So, formally, if $\nabla_\xi(f)= df(\xi)$, then $$\begin{align}\nabla_{\xi + \lambda\xi_2}(f) &= df(\xi + \lambda\xi_2) \\ &= df(\xi_1) + \lambda df(\xi_2) \\ \nabla_\xi(f + \lambda g) &= d(f+ \lambda g)(\xi) \\ &= df(\xi) + \lambda dg(\xi) \\ &= \nabla_{\xi}f + \lambda \nabla_3 g \\ \nabla_\xi (fg) &= grad (fg) (\xi) = d(fg) \\ &= (grad f \cdot g)(\xi) + (f \cdot grad g)(\xi) \\ &= g df(\xi) + fdg(\xi) \\ &= \nabla_\xi f \cdot g + f \nabla_\xi g \end{align}$$
Takeaway: we can define surfaces as hyperplanes, in terms of curves or in terms of directional derivations

[[Riemannian Metric]]: let $M^{n-1} \subset \mathbb{R}^n$ be a regular hypersurface in $\mathbb{R}^n$, then the Euclidean inner product $<.,.>$ in $\mathbb{R}^n$ gives $\forall p$ in an inner product on the tangent space $T_pM^{n-1}$ 

>[!info]
>This inner product on $T_pM^{n-1}$ varies smoothly bilinear form wrt p and the group of inner products is called a Riemman metric 

If M$^{n-1}=\{(x_1, \cdots, x^n \mid F(x^1, \cdots, x^n) = 0\}$ locus of points for an equation $F: \mathbb{R}^n \rightarrow \mathbb{R}$ and there are two conditions 
1. $grad F |_{n^{n-1}} \neq 0$, then $T_pM \bot \frac{gradF}{||gradF||} \mid_p = \vec{n}(p)$ 
2. definition of the tangent space we know that p is inside the tangent plane $T_pM$ 

[[Riemannian Metric]]: let $D \subset \mathbb{R}^k$, and therefore hypersurfaces. Let ($u^1, \cdots, u^k$) be coordinates on D and then a smoothly varying positive definite and symmetric bilinear form (inner product) on $T_pD, p \in D (p= (u^1, \cdots, u^k)$ is called a Riemannian metric on D. 

Euclidean inner products on hard surfaces, but Riemannian metrics are family of inner products that may be euclidean or from hypersurfaces and manifolds. 

Example: let $D= \{ z \in \mathbb{C} \mid \Im{z} > 0\}$, then $$G(u,v) = \frac{<u,v>}{(\Im z)^2}$$ is a [[Riemannian Metric]].  Complex imaginary positive section of numbers.
can be rewritten as
$$G = \frac{du^2 + dv^2}{v^2}, u + iv = z$$

Example. Assume that we're in 3D euclidean space $M^2\in R^3$, is given by a graph $z=z(x,y)$. Then the Riemannian metric is parametrised by $(x,y)$ and since its a family of definite positive, every time you fix the parametrisation you obtain a 2x2 matrix. The euclidean inner product corresponding to the two tangent vectors x and y. $$\begin{align}G &= \begin{pmatrix} g_{11}(x,y) & g_{12}(x,y) \\ g_{21}(x,y) & g_{22}(x,y) \end{pmatrix} \\ g_{11}(x,y) &= \langle \vec{r_1}(x,y),\vec{r_1}(x,y) \rangle \end{align}$$ where $$\vec{r_1}(x,y) = \frac{\delta}{\delta x} (\vec{r}(x,y)) \equiv \frac{\delta}{\delta x} ((x,y,z(x,y)) = (1,0,\frac{\delta z}{\delta x} ))$$that is parametrisation of the surface, and then when derivate, we get the tangent vector in the tangent space. 
$$\begin{align} g_{11}(x,y) &= \langle (1,0,z_x)^T, (1,0,z_x)^T \rangle = 1 + (\frac{\delta z}{\delta x} )^2 \\ g_{22}(x,y) &= \langle \vec{r_2}, \vec{r_2} \rangle = 1 + (\frac{\delta z}{\delta x} )^2 \\ g_{12} = g_{21} &= \langle \vec{r_1}, \vec{r_2}\rangle = \frac{\delta z}{\delta x} \cdot \frac{\delta z}{\delta y} \\ \end{align}$$

you can compute diagonal components of the matrix and those are given by euclidean inner product, where $r_2$ is the 2nd tangent vector. $r_1$ for which y is kept fixed and x is changed and viceversa. 

>[!Remark] If $M^{n-1} \subset \mathbb{R}^n$ is a parametrised hypersurface
> $x^i = x^i (u^1, \cdots, u^{n-1}), i=0, \cdots , n$ with the condition that jacobian matrix rank $rk (\frac{\delta x^i}{\delta u^i}) = n-1$ then the Riemannian metric given by $$G(u',v^{n-1})= (g_{ij}(u', \cdots, u^{n-1})) = \langle \vec{r_i}(u', \cdots, u^{n-1}), \vec{r_j}(u', \cdots, u^{n-1}) \rangle$$, which is a more general version

Example: hyperbolic paraboloid tho it works for all quadrics
$$\begin{align}  g_{11}(x,y) &=  1 + (\frac{\delta z}{\delta x} )^2 = 1 + (\frac{2x}{\delta a^2} )^2 = 1 + (\frac{4x^2}{a^4} )\\ g_{12} = g_{21} &= \frac{\delta z}{\delta x} \cdot \frac{\delta z}{\delta y} = \frac{2x}{a^2} \cdot \frac{-2y}{b^2} = \frac{-4xy}{a^2b^2} \\  g_{22}(x,y) &=  1 + (\frac{\delta z}{\delta x} )^2 = 1 + (\frac{2y}{\delta b^2} )^2 = 1 + (\frac{4y^2}{b^4}) \\ G \mid_{(x,y)} &= \begin{pmatrix} 1 + \frac{4x^2}{a^4} & \frac{-4xy}{a^2b^2} \\ \frac{-4xy}{a^2b^2} & 1 + \frac{4y^2}{b^4} \end{pmatrix} \\ \det G &= 1 + \frac{4x^2}{a^2} + \frac{4y^2}{b^2} > 0 \end{align}$$

bc the 11 is positive and so is the determinant, then the matrix is positive definite
