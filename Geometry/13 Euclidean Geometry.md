let $f: \mathcal{E} \rightarrow \mathcal{E}$ be affine and such that
$\exists O \in \mathcal{E}$, $\forall A \in \mathcal{E}$ and $f(A) = O + \lambda(A) \cdot \vec{OA}$
Deduce that f is a scaling (dilation/ho)

- - -
isometries, aflections and inversions

1. given two points in a euclid space one can draw a straight line connecting them
related to geodesics
3. to produce a finite line segment writing a line (notion of distance and connotation of finite)
4. to draw circles of arbritary radius and center
related to polar geodesics
6. All right = \pi /2 angles are equal to another
FFF or riemannian metric G(u,v) and at a point you diagonalise + orthonormalise u get I, you get usual euclidean structure at point, so you can consider the angle at a point in tangent spaces. 
6. If alpha and beta are smaller than two right anfles, then the two lines have an intersection in O, for which O is in both lines d1 and d2 that make the two angles w an intersected line D
properties of geodesics highly dependent on topology
8. Given a line D in a euclidean plane and a point p not in D, there exists a line d' through p that is parallel to D

affine geometry: there is no notion of distance, only obliges axioms 1,2,5'

- - -

[[Euclidean isometries]]
Every isometry $f: \mathbb{R}^n \rightarrow \mathbb{R}^n$ has the form $f(x)= Ax + b$, where $A$ is an orthogonal matrix. This is the same as saying $AA^T = E$, where $E$ is the identity matrix.

proof: 
[[First Fundamental Form]] euclidean dot product and pullback first definition of isometry
second definition of isometry uses $\langle f(x) - f(y), f(x) - f(y) \rangle = \langle x - y, x - y \rangle$ for all weights. You can add vectors to points. Denotes euclidean inner product, also constant [[First Fundamental Form]] that doesn't depend on the choice of the basis.

Take an isometry g such that $g \circ f(O) = O$, the composition of the origin will be sent to the origin and the basis vector will be sent to the basis vectors. $g \circ f(e_i) = e_i$
Notation change, euclidean affine frame, composition assigns this frame to collection n+1 points $\vec{OP_1}, \cdots \vec{P_n}$ form an affine euclidean frame, such that $g \circ f(p_i) = p_i$, in an orthogonal plane.

We can always find an isometry g that will fix the affine frame. This is because of translations. If we have a function $f(O) = B$, we can take $g_1 = x - \vec{OB}$, such that $g_1 \circ f (O) = g_1 (B) = B - \vec{OB} = B + \vec{BO} = O$. 
With such choice of $g_1, g \circ f$ is nothing else than the identity transformation, implying $g$ is the inverse of $f$.

Now let's get $g_2$ such that is a rotation that aligns with the vector $O(g_1 \circ f)(P_1)$ with $\vec{OP_1}$. This vector has some angle, and once we apply this angle to any other, we no longer need a rotation but rather a mirror map. 
This has to do with $det(A) \pm 1$, this is why there is ambiguity in the sign of $P_3$ (point in z-axis that makes 3rd dimension in vector basis)

To prove $g \circ f$= id, 
recall the [[Fundamental Theorem of Affine Geometry]], which states that if $g \circ f$ maps 3 collinear points to collinear points, this means that $g \circ f$ is affine, which implies that $g \circ f$ is actually linear since $gf(O) = O$. Then $g \circ f$ must be the identity bc it acts trivially on the [[Affine Frame]] $\vec{OP_1}, \cdots \vec{P_n}$

It's left to show collinear points are mapped to collinear points. The proof is by the property that given a pair of points $O, P_1$ and another point $C \in \mathbb{R}^n$, if all these points are collinear and the distances from the origin to these other two points are fixed, then the coordinates of C are uniquely defined. 

This is relevant for ellipsoids because the fact that several points are collinear means that one of them could be the center (O) and then the distance to C could be the radius $r_2$ and from center $P_1, r_1$ until C. These two circles/ellipses are then tangent, which uniquely defines the coordinates of C. 

We can map this through isometries, knowing that the origin will map to itself, and so will basis vector $p_1$, so then in the sphere isometric, C will have to be in the same line.

So in summary
1. make g
2. remember [[Fundamental Theorem of Affine Geometry]], so that is an [[Affine Map]]
3. composition map is an identity
4. g is gonna be its inverse 

- - -

If $g_1 \circ f(O) = O, \vec{Og_1f(p_i)} = \vec{a_i}$, then $$A= \begin{pmatrix} a^1_1 & \cdots & a^1_n \\ \vdots & & \vdots \\ a^n_1 & & a^n_n \end{pmatrix}= A(\vec{OP_i})= \vec{a_i}$$
# Reflections and Inversions
The case of $\mathbb{R}^n u,v \approx C \in u + iv = z$, for which $z_1 = u, z_2 = v$
Say you have a line in R^2 $B\bar{z} + \bar{B}z + c \in R = 0$ defines a real line in C, such that B is the vector and also a complex number
sum of two vectors equals $2(\vec{B}, \vec{Z}) = (b_1 + ib_2)(z_1 - iz_2) + (b_1 -ib_2)(z_1 + iz_2) = 2 (b_1z_1 + b_2z_2)$ 
so we can rewrite the line as $2(\vec{B}, \vec{Z})+ C = 0$, which if D= C/2, then $b_1z_1 + b_2z_2 + d = 0, b_1x + b_2y + d = 0$

An equation for a circle is similar 
$$\begin{align} A|z|^2 + B\bar{z} + \bar{B}z + c = 0, A,C \in R \\ ||z-a||^2 = r^2 = (z-a)(\bar{z}- \bar{a}) = |z|^2 -\bar{a} z - \bar{z} a + |a|^2  \\\frac{-C}{A} + \frac{|B|^2}{A^2} = \frac{|B|^2-CA}{A^2} = r^2\end{align}$$

A reflection of a line L is defined as line $S_i(z)$, such that this line goes through point z, and it's intersected by the exact middle of it by L, with a rectangular angle. The projection of z into the line L is O. And directional vector of $S_i(z)$ is $\vec{B}$ normal to L, making our line follow the equations mentioned earlier. when O in L: 
$$\begin{align}S_i(z) &= z + \frac{z \cdot B}{|B|^2}B \\ \vec{OZ} \cdot \vec{OB} &= \frac{ZB}{2} \\ z - \frac{2 z \cdot B}{|B|} \frac{\bar{B}}{|B|}&= z - \frac{B\bar{z} + \bar{B}z}{|B|^2} B = - \frac{B}{\bar{B}} \bar{z} \end{align}$$

inversions
for a circle with centre a, radius r and vector z going through a and inv(z) $$\begin{align} |z-a| \cdot |inv(z)-a| &= r^2 \\ inv(z) &= a + \frac{z-a}{|z-a|} \cdot |inv(z)-a| \\ &= a + \frac{(z-a)r^2}{} \frac{a(z-a)(\bar{z}-\bar{a})+ (z-a) r^2}{(z-a)(\bar{z}- \bar{a})}  \\ &= \frac{B\bar{z}+ C}{A\bar{z} - \bar{B}} \end{align}$$
If a= 0 then $inv(z)= r^2/ z = C / A\bar{Z}$
in general A to O, $S_i(z) = - \frac{B}{\bar{B}} \bar{z} - \frac{C}{\bar{B}}, C \in R$

- - -

Theorem : An isometry of $P \approx \mathbb{R}^2$ can be written as a composition of $\leq 3$ reflections in lines. 
By inductions, more generally, an isometry of $\mathbb{R}^n$ euclidean metric is a composition of $\leq n+ 1$ reflections in hyperplanes

- - -
“rigid motion” to describe an affine isometry
Proposition 1.1. Two unit vectors of a plane being given, there exists a unique rotation that maps one to the other.
Proof. Let u and u' be two unit vectors of P. Let v be a unit vector such that (u, v) is an orthonormal basis. Then u' can be written in this basis: u' =au+bv

