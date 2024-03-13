part 1

Models of spaces of constant gaussian curvature

|                               | $S^2$                                         | $\mathbb{R}$     | D                                              |
| ----------------------------- | --------------------------------------------- | :--------------- | ---------------------------------------------- |
| $k$                           | 1                                             | 0                | -1                                             |
| Diagonal fundamental form $G$ | $G= \frac{4(du^2 + dv^2)}{(1 + u^2 + v^2)}$ * | $G= du^2 + dv^2$ | $G= \frac{4(du^2 + dv^2)}{(1-u^2-v^2)}$        |
| Geodesics                     | Gradient circles                              | straight lines   | circles intersecting the boundary orthogonally |
*$G= g_{ij}(u,v) = \begin{pmatrix}  \frac{4(du^2 + dv^2)}{(1 + u^2 + v^2)} & 0 \\ 0 & \frac{4(du^2 + dv^2)}{(1 + u^2 + v^2)} \end{pmatrix}$

- - -
part 2 

Let $\mathcal{E}$ be an [[Affine Space]]. A subset $\mathcal{F}$ of $\mathcal{E}$ is called an [[Affine Subspace]] if $$\mathcal{F} = A + F$$ where $A \in \mathcal{E}$ and $F$ is a vector subspace of $E$ (set of vectors in affine space $\mathcal{E}$ ). In other words is a subset of the original vector space re-parametrised to start from A instead of from the origin
$$\mathcal{F} = \{B = A + \vec{v} \mid \vec{v} \in F\}$$
Examples of [[Affine Plane]]s are arbitrary k-planes in R^n (not necessarily passing through the origin) or tangent spaces $T_pM^{n-1}$ to a given object in R^n

Two [[Affine Subspace]]s $\mathcal{F}_1$ and $\mathcal{F}_2$ are called parallel if their underlying vector spaces coincide ($F_1 = F_2$). 
Therefore there is no intersection ($\mathcal{F}_1 \cap \mathcal{F}_2 = 0$) or they are the same. Two options, same dimensionality ($dim \mathcal{F}_1 = dim \mathcal{F}_2 < \infty$ ) or they are different in which case, either they don't intersect or they contain each other ($\mathcal{F}_1 \subseteq \mathcal{F}_2$ )

[[Fundamental Theorem of Affine Geometry]]
If $f: \mathcal{E} \rightarrow \mathcal{F}$ be a bijection where e and f are [[Affine Space]]s over the real numbers $k= \mathbb{R}$ of the same dimension $1 \leq n < \infty$  then if $\forall A,B,C \in \mathcal{E}$ that are collinear (i.e. A,B,C belong to the same line L), then $f(A), f(B), f(C)$ are also collinear

A map $h:\mathcal{E} \rightarrow \mathcal{F}$ between two [[Affine Space]]s cover run arbitrary field $\mathbb{K}$ is called an [[Affine Map]] if a linear map between E and F h follows that $$\vec{h(0)h(A)}: E \rightarrow F$$ such that $\vec{OA} \mapsto \vec{h(0)h(A)}$ for 0 is the grad $\in \mathcal{E}$ and A also \in

$\mathcal{F}$ is an [[Affine Map]] and moreover (for granted bc of bijection) is also an [[Affine Isomorphism]]. Also, $\mathcal{F}^{-1}$ is also an [[Affine Map]]

if $\mathcal{E} = \mathbb{K}^n$ and $\mathcal{F} \equiv \mathbb{K}^m$ then $f: \mathcal{E} \rightarrow \mathcal{F}$ being affine $\Leftrightarrow$ F = Ax + b, where b= f(0)

if e is an affine space of dimentions n then n+1 pts A_1 ... A_{n+1} in e form an [[Affine Frame]] if they do not belong to the same [[Affine Subspace]] F of dimension dim F < n
 e is cal

n+1 points 