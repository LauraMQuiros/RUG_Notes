[[Manifold]] $M$: 

A 2-surface Min $\mathbb{R}^3$ is ruled if exists a curve $\gamma= \gamma(t), t \in (a,b)$ or $[a,b]$ and a vector-valued function $h(t)$ w some range as parameter t, and $M^2={\gamma(t) +s\vec{h}(t)\mid t \in (a,b), s \in R}$
similarly u can define ruled surfaces in $\mathbb{R}^n$ and $\mathbb{C}^n$. For $\mathbb{R}^n$ you need to have dimension -1, so co-dimension, curve will be a surface and increased dimension w s parameter. 
in c we have complex curve and complex parameter s. 

Which of the quadrics in $\mathbb{C}^3$ are ruled surfaces?
	All of them, since the signature of a quadric, which  is eq the number of negative eigenvalues is not an invariant of the quadric anymore
	Example: elliptic paraboloid $z=\frac{x^2}{a^2} + \frac{y^2}{b^2}$ and w - is a hyperbollic paraboloid. No difference here when making linear transformation $y=iy$.  

Example 2-surfaces (compact and without boundary)
Möbius strip-  compact surface with boundary. How many boundary components does this have? s^1. $\mathbb{R}p^2$-2d projective space. $\mathbb{R}p^2= M^2 \cup D^2 = S^2 / x \sim -x$. Smooth surface from IFT perspective. Is projective bc it can be represented as the sphere squared minus the antipolar point (bottom part of the sphere). Antipolar fashion of getting the boundaries. Antidisc is complement to the mobius strip. 
![[MobiusStrip_1000-1970155419.gif]] 
Example 2-torus $\pi^2=(s^2 \setminus (d^2 \cup D^2)) \cup C^2$ where the first part is a cilinder in disguise
![[DoubleTorus_800.gif]]
Alternative 2nd hw: proof one of the following theorem
classification of 2-surfaces
every closed 2-surfaced (closed means compact and without boundary) is [[Diffeomorphic]] to either
1. $s^2 \setminus nD^2 \cup nM^2$ for n >1 is a non-orientable case as seen [here](https://www.geogebra.org/m/CdpnKuzS)
2. $s^2 \setminus 2gD^2 \cup gC^2$ for g is the genus of surface
[[Genus]] is number of cylinders 2 -2g = 7(s^2 + g handles)
[[Euler's Characteristic]] topological and combinatorial invariance at the same time
$X(s^2 \setminus nD^2 \cup nM)= 2-n$

- - -
The first fundamental form of a surface aka [[Riemannian Metric]]
let $M^2 \subset \mathbb{R}^3$ be a regular 2-surface then for a point p in m2 if $r= r(u,v)$ is a smooth an regular parameter n of $m^2$ around p, then the tangent space $T_pM^2$ to M^2 at p is the [[Affine Space]] plane through p spanned by two tangent vectors coming from the parametrisation of the surface, $\frac{\delta r}{\delta u}, \frac{\delta r}{\delta v}$ so knowing $p= \vec{r}(0,0)$ $$TpM^2=\{p + s_1 \frac{\delta r}{\delta u}\mid_{p=(0,0)} +s_2\frac{\delta r}{\delta v} \mid_{(0,0)} \mid s_1, s_2 \in \mathbb{R}^2\}$$
We have a couple of basis vectors and the surface and surface so we use
G(u,v) the inner product on $T_pM^2$, specifically the restriction of the dot product on R^3 to TpM^2. in coordinates guv, is a 2x2 matrix $$G(u,v) = \begin{pmatrix} l1,l & l1, l2 \\ l2,l1 & l2,l2 \end{pmatrix} = \begin{pmatrix} \frac{\delta\vec{r}}{\delta u},\frac{\delta\vec{r}}{\delta u} & \frac{\delta\vec{r}}{\delta u}, \frac{\delta\vec{r}}{\delta v} \\ \frac{\delta\vec{r}}{\delta v},\frac{\delta\vec{r}}{\delta u} & \frac{\delta\vec{r}}{\delta v},\frac{\delta\vec{r}}{\delta v} \end{pmatrix}$$
 Recap: an inner product <.,.> on a vector space V R, is a bilinear form that is symmetric and positive definite i.e.
 1. $\langle \lambda a+b, c \rangle = \lambda \langle a, c \rangle + \langle b,c \rangle$
 2. a,b = b,a
 3. a,a = 0 iff a= 0, abc in V and lambda in R