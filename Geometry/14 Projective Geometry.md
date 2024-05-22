1. A completion of an affine space by points at infinity
lets consider homogeneous or barycentric coordinates of a point $x=(\mu_1, \mu_2)$ on an affine line E^1 with respect to an [[Affine Frame]] A,B \in E^1
not unique coordinates $x=(\mu_1: \mu_2)$ means they can be scaled. For homogenerous coordinates $x=(\mu_1: \mu_2) = (\lambda\mu_1: \lambda\mu_2), \forall \lambda \in K \setminus \{0\}$ 
x is a suspension point, which means that $$\begin{align}\vec{xA}\mu_1 + \vec{xB}\mu_2 &= 0 \\ \mu_1 + \mu_2 &\neq 0 \\ \vec{xA} = + \vec{xB}\end{align}$$
given $x \neq (0,0)$, we make point $(-\mu:\mu)$ be the point at infinity of E^1. Remember that these coordinates can be scaled. So in a x-axis $\mu_1$ and y-axis $\mu_2$, [[Affine Plane]] this $\lambda(-\mu:\mu)$ line can cross the origin.
Symmetric around the y-axis we have $\lambda(\mu_1:\mu_2)$ and we can make a collection of lines for each choice of $\lambda$. A normalisation of $\mu_1 = 1$, gives a semicircle, resulting in a collection of points, in the image of any point $(-\mu; \mu), \forall \mu \neq 0$
x scales to $\infty$ in right or left direction, giving the points in the projective space, extremes of the semicircle. Here $-\infty = \infty$ in homogeneous coordinates

2. P(C) as $P \cup \{t_0\}$ in connection to reflections and inversions in C
$$\begin{align} \mathbb{R}P' \equiv P'(\mathbb{R}) \equiv S^1 \\ P'(\mathbb{C}) \equiv S^2 \end{align}$$
2*. Recall that a reflection or inversion in line/circle $$A|z|^2 + \bar{B}\bar{z} - B \bar{z} + C = 0, A,C \in \mathbb{R}, B \in \mathbb{C}, |B|^2-AC >0$$ is given by $$\begin{align}S= \frac{\vec{{Bz} - c}}{\vec{Az} + c}\end{align}$$
If you do the composite you get a linear fraction that no longer depends in z bar, but z bc they cancel out $$\begin{align} S_1 \circ S_2 = \frac{\alpha z + \beta}{\gamma z + \delta} = \frac{B_1(\frac{B_2 \bar{z} - C_2}{A_2 \bar{z} + C_2}) - C_1}{A_1(\frac{B_2 \bar{z} - C_2}{A_2 \bar{z} + C_2}) + C_1} \\ S_1 \circ S_2 \circ S_3 \circ S_3 (z) = \frac{{\widehat{\vec{Az}} - \widehat{B}}}{\widehat{\vec{Cz}} + \widehat{B}} \end{align}$$
An even number of reflections or inversions can always be written as a linear fractional transformational and conversely, $f=\frac{az+b}{cz+d}, ad-bc \neq 0$

The definition: the full group of compositions of reflections and inversions is called a [[Circular Group]]
- - -

Example of 1
On the level of the geometry of lines in $\mathbb{C}$ (or equivalently, circles on $S^2 = C \cup \{\infty\}$), the transformations are linear fractional transformations. one can show that these (and in fact the whole circular group) map circles on lines to circles on lines.
The transformations are linear invertible transformations of the affine plane with coordinates ($\mu_1$, $\mu_2$)

Proof (that transformations are the same): 
Given invertible linear map with is well-defines $A: P(C) \to P(C)$
$A(\mu_1, \mu_2) = (\alpha \mu_1 + b \mu_2, c\mu_1 + d \mu_2)$, which in homogeneous coordinates is $A(\mu_1: \mu_1)= (\alpha \mu_1 + b \mu_2: c\mu_1 + d \mu_2)$
$A(z= \frac{\mu_1}{\mu_2}:1)= (\frac{az+b}{cz+d}:1)$ in complete accordance to what said earlier
- - -

[[Projective Space]]: let E be a vector space. Then the projective space $p(E)$ is the set of all lines through the origin in E.
If E is finite dimensional and isomorphic to $\mathbb{K}^n \to \dim(P(E))= n-1$ because every line gets mapped to a single dimensional point, so there is a reduction.
$P(E = \mathbb{K}^n)$ gets equipped with [[Homogeneous coordinates]] $(x^1: \cdots : x^n)$

[[Projective Transformation]]: the [[Projective Transformation]] of a [[Projective Space]] P(E) are defined as quotients of invertible linear transformations of E. So f: E \to E linear gives a map $$f_p: P(E) \to P(E)$$ defined by $f_p(\lambda \vec{v} = (f(\vec{v}) \cdot \lambda_2)$, whose $\lambda_1, \lambda_2 \neq 0$ are arbitrary constants of the field $\mathbb{K}$
$$\begin{pmatrix} E & \rightarrow^f &E\setminus\{0\} \\ Q \downarrow & & Q \downarrow \\ P(E) & \rightarrow^{f_p} & P(E) \end{pmatrix}$$
for which $f_p$ is the unique map that makes the diagram commutative ($Q \circ f = f_p \circ Q$) and Q is the natural quotient map. So projective transformation is the quotient of a linear transformation.
$Q(x^1: \cdots: x^n =^{def} (x^1: \cdots: x^n)$ where $(x^1: \cdots: x^n) \neq 0$

How is the line image defined and the transformation unique
we get $\vec{v}$ in the original projective plane, regardless of the vector selected since this is only but an scaling, if we project (another addition of arbitrary scalings), that won't make the projected line less well-defined, since it still refers to the same projected line.

[[Projective Completion]] of an [[Affine Space]]: let $\mathcal{E}$ be an affine space are $\mathbb{K}$. Consider the affine space $h: \mathcal{E} \times \mathbb{K}$. Fix the hyperplane $h=1$ in $\mathcal{E} \times \mathbb{K}$. Then the [[Projective Completion]] of $\mathcal{E}$ is $P(E \oplus \mathbb{K})$. Thus, the $\dim(P(E \oplus \mathbb{K})) = \dim (\mathcal{E})$. And points in $P(E \oplus \mathbb{K})$ are lines through the origin in $E \oplus \mathbb{K}$. 
$(\mathcal{E}=\{h=1\}) \cap e$ single point when $e \nparallel \mathcal{E}$. This implies that $P(E \oplus \mathbb{K})) = \mathcal{E} \cup$ "points at infinity" $\equiv \mathcal{E} \cup P(E)$

Corollary for different planes $$\begin{align} P(\mathbb{R}^{n+1}) &= \mathbb{R}^n \cup P(\mathbb{R}^{n-1}) = \mathbb{R}^n \cup \mathbb{R}^{n-1} \cup \cdots \cup \mathbb{R}^1 \cup \{opt\} \\ P(\mathbb{K}^{n+1}) &= \mathbb{K}^n \cup P(\mathbb{K}^{n-1}) = \mathbb{K}^n \cup \mathbb{K}^{n-1} \cup \cdots \cup \mathbb{K}^1 \cup \{opt\} \end{align}$$
Exercise: A trapezium in $\mathbb{R}^2$ is projectively equivalent to a square