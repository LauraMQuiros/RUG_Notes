the notion of a [[Perspectivity]]: Consider to [[Affine Hyperplanes]] $H_1, H_2$ in a vector space $E^{n+1}$ of dimension n+1. Let's also take a point $p \in E^{n+1}, p \neq H_i, i= 1,2$, then the perspectivity $f:H_1 \to H_2$ with centre p is the transformation defined as follows: $x \in H_1 \mapsto y \in H_2$ so that $p_1x$ and $y$ are collinear.
![[drawing_14_1.png | 300]]

Every [[Perspectivity]] is a [[Projective Transformation]] between [[Projective Completion]]s of the corresponding hyperplanes $H_1$ and $H_2$. 
Proof: say P is the origin of $E^{n+1}$ (we can assume this by making an identification of $E^{n+1}$ and $\mathcal{E}^{n+1}$). Then $E^{n+1} \setminus \{p\} / v \wedge \lambda v, \forall \lambda \in \mathbb{K} \setminus \{0\} =^{def} P(E^{n+1})$   is a [[Projective Completion]] of both $H_1$ and $H_2.$

Hence in these coordinates f is the identity map and therefore a [[Projective Transformation]].
![[14_2.png | 300]] For which $\mathcal{E}$ are hyperplanes, Q is the intersection of line q of origin in the 

Every [[Projective Transformation]] $f:P(E^{n+1})$  is a composition of a finite number of [[Perspectivitie]]s. Moreover, every [[Projective Transformation]] is determined by the image of $n+2$ points such that no n+1 points belong to the same [[Projective Hyperplane]] 

Consider $P(E^{n+1})$ as our [[Projective Space]], fixing $n+2$ points means fixing $n+2$ line directions in $E^{n+1}: \{v_1, v_2, \cdots, v_{n+1},v\}$. Since this is a basis vector of $E^{n+1}$ this means they belong to a vector space of 1 dimension less, they are in a [[Projective Hyperplane]] (n+1 points in $P(E^{n+1})$)

$f(v_i)$ is uniquely defined up to a scaling
$$\begin{align} v_0 &= \sum^n_{i=1} \lambda_i v_i \\ f(v_0) &= \sum^n_{i=1} \lambda_i f(v_i) \\ \widehat{f}(v_0) &= \widehat{\lambda_0} \cdot f(v_0) = \sum^n_{i=1} \lambda_i f(v_i) \widehat{\lambda_0} \\ \sum^n_{i=1} \lambda_i \widehat{f}(v_i) &= \sum^n_{i=1} \lambda_i \beta_i f(v_i) \\ \lambda_i \cdot \lambda_0 &= \beta_i \lambda_i, i = º, \cdots, n \\ \beta_i &= \widehat{\lambda_0} \Rightarrow \widehat{f}= f \widehat{\lambda_0} \end{align}$$
![[14_3.png]]

- - -
$$\begin{align} Ax &= A(\bar{x} + e_{n+1}) = A\bar{x} + A(e_{n+1}) \\ &= A\bar{x} + \bar{y} + \lambda  e_{n+1}, A\bar{x} = E, \lambda \neq 0 \\ \bar{x} &\mapsto \frac{A\bar{x} + \bar{y}}{\lambda} \end{align}$$
Every [[Projective Transformation]] that projects points at infinity is an [[Affine Map]]. Let $P(E \oplus \mathbb{K})$ be the [[Projective Completion]] of an [[Affine Hyperplanes]]  $\mathcal{E}= \{h=1\}$. 
A [[Projective Transformation]] is a [[Linear map]] $A: E \oplus \mathbb{K} \to E \oplus \mathbb{K}$

1. [[Projective Transformation]]s are defined as [[Quotients]] of linear maps. This entails that
	1. points in a [[Projective Space]] are lines in the underlying [[Vector Space]] $V$ and viceversa
	2. projected lines are 2-planes in $V$
	3. projected k-planes are (k+1)-planes in $V$ 
	all through the origin
2. Use that [[Projective Space]]s are completions of [[Affine Space]]s therefore one needs to add points at infinity and viceversa
3. Use [[Homogeneous coordinates]]

![[14_4.png]]
$(x,1) \mapsto (1,y)$ since $(x,1)$ and $(1,y)$ represent the same line, $(x:1)=(1:y) \Leftrightarrow (x,1)= \lambda (1,y)$ for some $\lambda$, $$\lambda = x, y= \frac{1}{\lambda} = \frac{1}{x}$$ use [[Homogeneous coordinates]] 

[[Projective Duality]]: A k-plane in $\mathbb{K}^n \leftrightarrow$ (n-k) plane in ($\mathbb{K}^n)^* \approx$ isomorphic but non-canonically (same [[Affine Space]])

Given the following example of [[Desargues's Theorem]]: 
![[autodraw 27_03_2024.png]]
AA', BB', CC' are concurrent iff alpha, beta and gamma are collinear. use a projective geometry trick to reduce the theorem to affine version, apply projective duality
our k-1 plane in p(K^n) is equivalent to (n-1-k)-plane in P(K^n*), therefore k'= k-q \leftrightarrow (n-k'-2) plane in p(K^n*) which is the dimension in the projective plane. ((n-1)-k'-1) = n' -k' -1 and n' = n-1
We can say that the points will correspond to hyperplanes and lines will be the dimensions -2, if you have 3 points that are collinear, then 3 lines are concurrent