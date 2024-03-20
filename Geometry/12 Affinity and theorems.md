[[Barycentre]] and its [[Barycentric coordinates]]
For convenience we assume that field $\mathbb{K}$ has $char \mathbb{K} \neq 2$ which is the characteristic of the field. 0-characteristic means it's a field

Assume that we are given an [[Affine Frame]] $A_0, \cdots, A_n$ in $\mathcal{E} = \mathbb{K}^n$ then a collection of weights $(\alpha_0, \cdots, \alpha_n)$ s.t. $\sum^n_{i=0} d_i \neq 0$ taken  up to proportionality $(\alpha_0, \cdots, \alpha_n) \sim (\lambda\alpha_0, \cdots, \lambda\alpha_n), \forall \lambda \in \mathbb{K}\{0\}, i= 0$ are called [[Barycentric coordinates]] or [[Homogeneous coordinates]]

let's say that $$G= \frac{\alpha_0 \vec{OA_0} + \alpha_1 \vec{OA_1}}{\alpha_0 + \alpha_1}$$
and then 
1. because both $\alpha_0, \alpha_1 > 0$, then G is between $A_0$ and $A_1$ (for $\mathbb{K} = \mathbb{R}$)
2. if $\alpha_0 >0,  \alpha_1 < 0$ and $\alpha_0 + \alpha_1 = 1$ (normalisation condition), then $G= \mid \alpha_0 \mid \cdot \vec{OA_0} - \mid \alpha_1 \mid \cdot \vec{OA_1}$ is to the left of $A_0$
3. if $\alpha_0 < 0,  \alpha_1 > 0$ and $\alpha_0 + \alpha_1 = 1$ (normalisation condition), then $G= - \mid \alpha_0 \mid \cdot \vec{OA_0} + \mid \alpha_1 \mid \cdot \vec{OA_1}$ is to the right of $A_0$
4. if $\alpha_0 < 0, \mid \alpha_0 \mid < \alpha, \mid \alpha_0 \mid \leftarrow \alpha_1$ then $G= (\frac{\alpha_0}{\alpha_1 - \mid \alpha_0 \mid}, \frac{\alpha_1}{\alpha_1 - \mid \alpha_0 \mid})$, for which $(\alpha_1 - \mid \alpha_0 \mid) \rightarrow 0$ so, in summary $\alpha_0 = - \alpha_1 \Rightarrow G$ is undefined

The [[Barycentre]] of pts $A_0, \cdots, A_n$ with weights $(\alpha_0, \cdots, \alpha_n), \sum^n_{i=0} d_i \neq 0$ is the point $$G= O + \frac{1}{\sum^n_{i=0} d_i} \sum^n_{i=0} \alpha_i \vec{OA_i} \in \mathcal{E}$$ In particular G is independent of O. Recall that G is defined as according to Linear Algebra $$G= \sum^n_{i=0} \vec{GA_i} \cdot \alpha_i = 0$$ take another point O' $\begin{align}O' \Rightarrow O'+ \frac{1}{\sum^n_{i=0} d_i} \sum^n_{i=0} \alpha_i \vec{O'A_i} \in \mathcal{E} &= O + \vec{OO'} + \frac{1}{\sum^n_{i=0} d_i} \sum^n_{i=0} \alpha_i \vec{O'O} + \frac{1}{\sum^n_{i=0} d_i} \sum^n_{i=0} \alpha_i \vec{O'A_i}\\ &= O + \vec{OO'}+ \vec{OO'} + \frac{1}{\sum^n_{i=0} d_i} \sum^n_{i=0} \alpha_i \vec{O'A_i} = G \end{align}$ this proves it is independent.
We can also prove the linear equation definition by giving a point O and calculating $$\begin{align} \sum \vec{GA_i} \alpha_i &= \sum \vec{GO} \alpha_i + \sum \vec{GA_i} \alpha_i \\ &= \Lambda \vec{OG} + \Lambda \vec{OG} = \Lambda (\vec{GO} + \vec{OG})= 0 \end{align}$$
Now let's go over some classical theorems 
[[Thales Theorem]]: suppose we are given two lines D_1 and D_2 in an [[Affine Plane]] $\mathcal{E},  dim \mathcal{E} = 2$. Suppose we are also given 3 more lines $d_1, d_2, d_3$ st they are all parallel to each other and intersecting $D_1, D_2$ at $A_1, A_1', A_2, A_2', A_3, A_3'$
![[thales.png | 200]]
if $vec{A_1A_3} = \lambda \vec{A_1A_2} \Rightarrow vec{A'_1A'_3} = \lambda \vec{A'_1A'_2}$. Moreover, if B is s.t. w the same lambda A_1'B =  \lambda A_1'A_2' then B in D_2 and B = A'_3

If $D_1 \cap D_2 \neq \phi$, let O be there unique point of intersection. Then use a scaling factor beta, scuh that $f(O)= O + \beta \vec{O \cdot}$ with center O. 
$A_1A_3 = \beta_3 OA_1, A_1A_2 = \beta OA_1, \beta_3 = \beta \cdot \lambda$. Similarly, since d_2 || d_1 and so on, 
$A'_1A_2 = \beta OA'_1, A$

$A'_1B = \lambda A'_1A_2 \Rightarrow A'_1B = \beta_3 \cdot OA_1$ for $B= A'_3$

this cases O \in d_1 and when D_1 || D_2 are similar

[[Pappus's Theorem]]: translations and scalings conserve parallelism (preserve their properties of lines, planes, etc being parallel or not)

[[Desargues's Theorem]] : translation $f(x)= x + AB$ scalings with centre O in E $f(O)= O + \lambda \vec{Ox}$