TA Leendert Los (p.l.Los@rug.nl)
[[Geometry]]

[[Vector Space]]: set of vectors equipped with vector addition and scalar multiplication. In a vector space V for all vectors in V and all scalars in $\mathbb{K}$ we have identity, distributivity, existence of a 0 vector, associativity and closure in addition and multiplication.

>[!info] Notation
>The field $\mathbb{K}$ can be thought of as a general field. $\mathbb{Z}$ denotes the set of integers both positive and negative. Operations in both include addition and multiplication. 
>A field $\mathbb{K}^n$ is a set of collections of n integers
>others: $\mathbb{R}$ real numbers, $\mathbb{C}$ complex numbers

[[Affine Space]]:
	the set of points $\mathcal{E}$ related to a vector space E such that E is a [[Vector Space]] over a commutative field $\mathbb{K}$ which has a mapping $f$ for any ordered pair of points in $\mathcal{E}$. This means for every vector and scalar
		$\forall x,y \in E$ is a vector in the vector space and $\forall \lambda_1, \lambda_1  \in \mathbb{K}$  
	If his mapping $$\begin{align}f: \mathcal{E} \times \mathcal{E} \rightarrow E \\ f(A, B) = \vec{AB} \end{align}$$
	has the following two properties
	1. $\forall A \in \varepsilon$, $f(A, \cdot): \mathcal{E} \rightarrow E$  is a bijection. So for any point A in the set $\mathcal{E}$, there is an equivalent vector in the vector space E and viceversa.
		$f(A, \cdot)$ stands for a fixed point A in a connection between point A and any point B such that $B \in \mathcal{E}$ and $B \mapsto \vec{AB} \in E$ 
	2. $\forall A,B,C \in \mathcal{E}$, $\vec{AB} + \vec{BC} = \vec{AC}$. When A,B and C are points in the set $\varepsilon$ we can map them to vectors and perform vector addition
	 then $\mathcal{E}$ is an affine space

>[!info] E as finite dimensional vector space
>We will treat it as such even though it doesn't have to be

Summary: 
E contains vectors, vector space, bijection between points and vectors
$\mathcal{E}$ contains points, affine space, defines properties of vector space

[[Parallelogram Rule Theorem]]: if $A,B,C,D$ are four points in an affine space such that $\vec{AC} = \vec{BD} = \vec{d}$ then $\vec{AB}= \vec{CD}$
Proof using second property of affine spaces:
$$\begin{align} C = A + d \\ D= B + d \\ \vec{AC}=\vec{d} \\ \vec{BD}=\vec{d} \\
\vec{AC} + \vec{CD} = \vec{AD} \\ \vec{AB} + \vec{BD} = \vec{AD} \\ \vec{AC} + \vec{CD} = \vec{AB} + \vec{BD} \\  \vec{d} + \vec{CD} = \vec{AB} + \vec{d} \\ \vec{CD} = \vec{AB} \\ \end{align}$$

**Definition of addition of points and vectors in an affine space**
If $A \in \mathcal{E}$ and $\vec{d} \in E$ then $A + \vec{d} \in E$ such that $A+ \vec{d} =C$ and $\vec{AC} = \vec{d}$ 

**Coordinates in Affine Spaces**
When we have a field $\mathbb{K}^n$ consisting of points of n-dimensionality we can consider it a set of coordinates. According to the first property of affine spaces, for every point x s.t. $x \in \mathbb{K}^n$ there is a vector $\vec{x}= x- 0$ which is also the identity property of $\mathbb{K}$.

>[!info] Relation between vector space and affine space
>The only difference between a vector space and an affine space is that in a vector space every point can be considered a vector due to the existence of an origin.


**Curves in Affine spaces** 
curves in $\mathbb{R}^n (\mathbb{C}^n)$ (affine spaces that admit coordinates that are collections of real or complex numbers) are given by parametric equations $\gamma = (x'(t) ... x^n (t))$ for $\mathbb{R} \rightarrow \mathbb{R}^n$ 
- - -
## [[Differentiability]] 

[[Chain rule]]: let $F: \mathbb{R}^n \rightarrow \mathbb{R}^m$ which is differentiable at a point $x_0 \in \mathbb{R}^n$ and $G: \mathbb{R}^m \rightarrow \mathbb{R}^k$ which is differentiable at a point $y_0 = F(X_0) \in \mathbb{R}^m$ . Then $G \circ F$ is differentiable at a point $x_0$ and $$d(G \circ F) = dG \circ dF$$ in other words, the derivative of the composite function $G \circ F$ at a point $x_0$ is given by the product of the derivatives of dG and dF at the corresponding points in their domains
Remember that $$\begin{align} dF: T_{x_0} \mathbb{R}^n \rightarrow T_{y_0} \mathbb{R}^m \\ dG: T_{y_0} \mathbb{R}^m \rightarrow T_{G(y_0)} \mathbb{R}^k \end{align}$$
for which $T_{x_0} \mathbb{R}^n$ is the plane tangent to $\mathbb{R}^n$ at point $x_0$, the derivative of this tangent space would result in 0, as this plane is tangent. The derivation of the property F maps the tangent plane at point $x_0$ for $\mathbb{R}^n$ to the tangent plane at point $y_0$ for $\mathbb{R}^m$.

>[!note] Taylor expansion
>the Taylor expansion provides a way to express a function and its derivatives in terms of the derivatives of its composite functions. So instead of $d(G \circ F) = dG \circ dF$ you get $H(x)=G(F(x))=G(F(x0​))+dGF(x0​)​⋅dFx0​​⋅(x−x0​)+ ..$


[[Implicit Function Theorem (IFT)]] 
there exists a function $F$ that expresses one set of variables (late $\mathbb{R}^n$) as a function of another set ($\mathbb{R}^{m+n}$), and the relationship between the variables is defined implicitly through a system of n equations with n variables, which always have 1 solution.
let $F: \mathbb{R}^m \times \mathbb{R}^n \rightarrow \mathbb{R}^n$, $F(x_0, y_0)= z_0$ for which $\mathbb{R}^m$ is a parameter space

Conditions:
If the [[Jacobian matrix]] $$\left[\frac{\partial F}{\partial x}\right|_{(x_0, y_0)}$$ has n-rank which means
	determinant $\neq 0$
	max number of linearly independent rows or columns is equal to the actual matrix dimensionality
If the F is continuously differentiable in an open neighbourhood of a point $(x_0, y_0)$ such that $F(x_0, y_0)=0$
then it exists a function $y$ ($\exists y = y(x)$) such that any of the y-variables can be expressed in terms of the x-variables ($y_0 = y(x_0)$ and $F(x, y(x))=z_0$).

IFT allows us to locally solve for one set of variables ($y$) as a function of another set of variables ($x$) when the relationship between them is defined implicitly through a system of equations

**[[Implicit Function Theorem (IFT)]] to curves**
let $\gamma : \mathbb{R} \rightarrow \mathbb{R}^2$ be a [[Smooth curve]] with derivation at time $t_0$ defined by function that is never 0 ($\gamma ' (t_0) = (x'(t_0), y'(t_0)) \neq 0$). 
If the derivation of the point is not 0 ($x'(t_0) \neq 0$), then locally:
1. we can parametrise $\gamma$ by $x$ such that $y$ is a function of $x$. So $\gamma (t(x)) = (x, y(x))$ locally near $(x(t_0), y(t_0))$ 
2. curve $\gamma$ can also be described by implicit equation $F(x,y)=0$ 
3. the [[Jacobian matrix]] F at the point is non-zero, ensuring [[Implicit Function Theorem (IFT)]] can be used locally $dF(x_0, y_0) \neq 0$ 
if parabola $y=x^2$, $(x(t), y(t))=(t,t^2)$ or $F(x,y)= y-x^2=0$

[[Bernoulli Lemniscate]]: $\infty$ shaped ellipse, used for tracing classic asymptotes, formula $(x^2+y^2)^2= a(x^2 + y^2)$ for which $a = 2 \sqrt{c}$ 