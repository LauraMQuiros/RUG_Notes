
# 2.1 Reminders and Concepts

[[Regular Curve]]: the velocity vector is nonzero for every parameter value. In other words, $\gamma′(t) \neq 0$ for all t in the domain. Not always simple curves
[[Simple Curve]]: it does not intersect itself (except possibly at its endpoints). In other words, $\gamma(t_1​) \neq \gamma(t_2​)$ for all $t_1 \neq t_2$​ in the domain
[[Locus]]: set of points that share a common geometric property or satisfy certain conditions
[[Level Set]]: set of all points in the domain of the function that map to a specific constant value $c$ in the codomain, so if $f: x^2 + y^2$ then $L_c(f)=  \{(x_1, ... , x_{n}) \mid f(x_1, ... ,x_n)=c\}$

[[Smooth Map]]: 
we set up a smooth map $\gamma: (-\epsilon, \epsilon) \rightarrow \mathbb{R}^2$ for which $\epsilon$ represents the neighbourhood around the point where the map is defined
	if we assume $\gamma'(0) \neq 0$ there exists a possibly smaller neighbourhood $(-\delta, \delta)$ of $0 \in \mathbb{R}$ 
	around the point 0, there is a smaller open interval where the map is well-behaved and where the derivative is nonzero. $(-\delta, \delta) \subset (−\epsilon,\epsilon)$
	such that there exists:
		![[Drawing.png]]

1. A [[Regular curve]] gamma $\gamma |_{(-\delta, \delta)}$ restricted to the neighbourhood $(-\delta, \delta)$ with no intersections (also [[Simple Curve]]) i.e. $\gamma'(t) \neq 0, \forall t \in (-\delta, \delta)$ 

2. A [[Locus]] $X= \{\gamma (t)=(x(t), y(t))| t \in (-\delta, \delta) \}$ (points in neighbourhood) that coincides with the level set of a function $F: u(0) \subset \mathbb{R}^2 \rightarrow \mathbb{R}: F(x,y)= 0$. In other words, there exists a set of points for which the parametric curve lies on the level set $F=0$.
		$F(x,y)$ represents some real-valued function defined on a neighbourhood u around 0, this neighbourhood being made out of real numbers $u(0) \subset \mathbb{R}^2$ 
		Since the function $F=0$ this means that the set of points will be restricted to the ones for which this happens, making the [[Locus]] a [[Level Set]]
		The locus can be considered an implicit equation bc is defined by an equation F that takes both x and y
		The locus is the graph of function $y=f(x)$ if $F(x,y)=0$ can be expressed as such.
		i.e. X is the solution set to $F=0$ 

3. A graph $\gamma$ of a function, whose points are in  $X = \{(x, f(x)) | x \in (-\eta, \eta)\}$ such that $y'(0) \neq 0$ 

>[!info] What is a [[Graph]]?
>A map can be considered as a set of points storing all ordered pairs of x and f(x), for which f is the function the graph or map is using to store the points. The map can also be seen as a curve, since the points will build a planar or spatial curve.

- - -
Moreover, for suitable $\delta, \eta$ and $u(0)$ all 3 conditions are equivalent, which is a corollary of the [[Implicit Function Theorem (IFT)]]. 

Would a smooth map with increased dimensionality still have all 3 equivalent conditions?
	The first and third points would remain the same, but 2 would change since the derivative would have to be calculated in every dimension according to the following definitions

A [[Smooth curve]] $\gamma: (a,b) \rightarrow \mathbb{R}^n$ is called a [[Regular Curve]] if $\gamma' (t) \neq 0, \forall t \in (a,b)$. If $\gamma' (t_0) = 0$, $t_0$ is called a [[Singular Point]] of $\gamma$ and $\gamma(t_0)$ is a [[Singular Value]].
Similarly if $n=2$ and curve is defined as $F(x,y)=0$ then $(x_0, y_0)$ is singular if $$d |_{(x_0,y_0) F(x,y)=0} \ \ \ \ and \ \ \ \ F(x_0, y_0)=0$$ similarly if $F: \mathbb{R}^2 \rightarrow \mathbb{R}$ is a [[Smooth Map]] then $dF(x,y)=0 \Rightarrow (x_0, y_0)$ is a singular point and $F(x_0, y_0)$ is a singular value. 

# 2.2 Conics

Polar coordinates $(r, \phi)$, where radius is a constant $r >0$ defines a circle 
$$r = \frac{\beta}{1 + e \cos(\phi)}, \beta > 0$$ where the $e$ denotes [[Eccentricity]] (constant $e < 0$ ellipse, $e = 0$ circle, $e > 0$ parabola) and $\beta$ denotes the size
	![[eccentricity.png]]

The algebraic definition (in which we use coefficients) of conic sections in the form of $Q(x, y) = 0$, where $Q = ax^2 + by^2 + cxy + dx + ey + f$ , represents conics as implicit functions derived from the [[Implicit Function Theorem (IFT)]]. 

Conics can also be understood as solutions to second-order differential equations. For example
	a conic can be the distance $x$, second derivative of the acceleration. This is useful in physics such that $$F = m \cdot a = \frac{G \cdot m \cdot m_1}{r^2} \cdot \vec{e_r} \rightarrow dd\vec{x} = \frac{GM}{r^2} \cdot \vec{e_r}$$g const grav, m planet mass, $e_r$ vector, we simplify m away

- - -
Given this curve $$\gamma(t)= (\frac{t^3}{1-t^4}, \frac{t}{1+t^4})$$

i. is $\gamma$ a smooth curve? Yes, both component functions are differentiable, denominators do not become zero for any $t$ so $\gamma$ is smooth.
ii. is $\gamma$ a regular curve? Yes, because $\gamma'(t) \neq 0$ everywhere in $$\gamma'(t)= (\frac{3t^2(1-t^4)+4t^5}{(1-t^4)^2}, \frac{1-t^8+4t^4}{(1+t^4)^2})$$
iii. is $\gamma$ a simple curve? Yes, based on parametrisation we see the curve doesn't self-intersect
- - -
[[Locus]] of the curve on cartesian coordinates $$x^2= (\frac{\frac{x}{y} \cdot \sqrt{\frac{x}{y}}}{1 + \frac{x^2}{y^2}}) \approx x^2 = \frac{x^3y}{x^2+y^2} \approx xy= (x^2 + y^2)$$
# 2.3 Cycloids 
![[cycloids.png]]

$z= z(\phi) = \frac{1}{m+1} (m\cdot e^{im \phi} + e^{im \phi}), m \in \mathbb{R} \smallsetminus \{1\}$ is the equation for a [[Cycloid]] 
$m= \frac{R}{r}$ is the relation between radius of cycloids
cusps are tangent when $m < 0$ (epicycloids), when $m = 0$ is a circle, when $m > 0$ is a hypocycloid

# 2.4 Envelopes
Suppose we have a family of lines in affine space $\mathbb{R}^2$ parametrised by $t: D_t, t \in \mathbb{R}$. An envelope of $D_t$ is a [[Smooth curve]] $\gamma(t)$ such that 
1. $\gamma(t)$ is a point in $D_t$
2. $\gamma'(t) || D_t$ [[collinear]]

### How to construct an envelope:
say $D_t = \{a(t)x+ b(t)y + w(t) = 0\}$ set of lines and curve  $\gamma(t) = (x(t), y(t)) \in D_t$ 
1. substitute curve in the general set of lines $a(t)x(t)+ b(t)y(t) + w(t) = 0$ in which the phase is below $\frac{w_1}{w_2}$ 
2. we get $w(t)$ by making the equation equal 0. This way it always goes through the origin
3. derivative calculation $a(t)x'(t)+ b(t)y'(t) = 0$ 
4. the envelope solution is described by $$\begin{pmatrix} a(t) & b (t) \\ a'(t) & b'(t)\end{pmatrix} \begin{pmatrix} x(t) \\ y(t) \end{pmatrix} = \begin{pmatrix} -w(t) \\ -w'(t)  \end{pmatrix} \Rightarrow \begin{pmatrix} x(t) \\ y(t) \end{pmatrix} = \begin{pmatrix} a(t) & b (t) \\ a'(t) & b'(t) \end{pmatrix}^{-1}\begin{pmatrix} -w(t) \\ -w'(t)  \end{pmatrix}$$
### Envelope of the family of perpendicular by sections
 **AKA when the envelope is a cycloid**

Some envelopes arise from numerous geometry problems. Let's say we gave a Euclidean oriented plane $C$ and in it a circle of centre $O$ and radius $R$. Two complex points  $M_1$, $M_2$, describe the circle with constant angular velocities $w_1, w_2$. The envelope arising from the family of lines  $M_1M_2$ will be a cycloid.

![[ch7.fig3.png | 300]]

So cycloids appear as envelopes of $M_1$, $M_2$, parametric equations for complex numbers that define a family of lines.  $$M_1 =  Re^{iw_1 t}, M_2 =  Re^{iw_2 t}$$
- $R$ is the radius of the circle, determines the scale or size of the resulting cycloid
- $w_1​$ and $w_2​$ are angular velocities, rate at which the complex numbers rotate in the complex plane
- $\frac{w_1}{w_2}$ influences the shape of the resulting curves resulting in different epicycloids and hypocycloids
Assume $w_1 + w_2 \neq 0$. Let $G$ be the [[Barycentre]] of $((M_1, \omega_2),(M_2, \omega_1))$ and $\vec{V_M}$ the velocity of the point M so that $$\begin{align*}(\omega_1 + \omega_2) \vec{OG} = \omega_2 \vec{OM_1} + \omega_1 \vec{OM_2}= \omega_2 Re^{i\omega_1 t}+ \omega_1Re^{i\omega_2t} \\(\omega_1 + \omega_2) \vec{V}_G = \omega_2 \vec{V}_{M_1} + \omega_1 \vec{V}_{M_2}\end{align*}$$ We can calculate the coordinates of the vector $\vec{OM_1}$ and derive it to obtain the velocity at the point. 
 $$\begin{align*}\vec{OM_1}&= \begin{pmatrix} R\cos(\omega_1 t) \\ R \sin(\omega_1t)\end{pmatrix}, \ \ \ \vec{OM_2}= \begin{pmatrix} R\cos(\omega_2 t) \\ R \sin(\omega_2t)\end{pmatrix} \\ \vec{VM_1}&= \omega_1 \begin{pmatrix} - R\sin(\omega_1 t) \\ R \cos(\omega_1t)\end{pmatrix},  \ \ \  \vec{VM_2}= \omega_1 \begin{pmatrix} - R\sin(\omega_2 t) \\ R \cos(\omega_2t)\end{pmatrix} \end{align*}$$

When $t$ varies, the point $G$ describes a curve whose tangent is parallel to the line $M_1M_2$ and, of course, it belongs to this line, being a barycentre of $M_1$ and $M_2$. This curve is thus the envelope we were looking for.
The envelope is $\vec{OG}$, which we will call $G(t)$ and we can derive from the previous function, simplifying with $\theta= w_1 t$ and $m= \frac{\omega_2}{\omega_1}$ 
$$ \begin{align*} (\omega_1 + \omega_2) G(t(\phi)) &= \omega_2 Re^{i\omega_1 t}+ \omega_1Re^{i\omega_2t} \tag{rewriting} \\  G(t(\phi)) &= \frac{R}{\omega_1 + \omega_2} \ \ \omega_2 e^{i\omega_1 t}+ \omega_1e^{i\omega_2t} \tag{we replace $\theta=\omega_1t$} \\ G(t(\phi)) &= \frac{R}{\omega_1 + \omega_2} \ \ \omega_2 e^{i\theta}+ \omega_1e^{i\omega_2t} \tag{ $t=\frac{\theta}{\omega_1}$} \\ G(t(\phi)) &= \frac{R}{\omega_1 + \omega_2} \ \ \omega_2 e^{i\theta}+ \omega_1e^{i \theta \frac{\omega_2}{\omega_1}} \tag{$m=\frac{\omega_1}{\omega_2}$} \\ G(t(\phi)) &= \frac{R}{\omega_1 + \omega_2} \ \ \omega_2 e^{i\theta}+ \omega_1e^{i \theta m} \tag{$\omega_1=\omega_2m$} \\ G(t(\phi)) &= \frac{R}{\omega_2m + \omega_2} \ \ \omega_2 e^{i\theta}+ \omega_2me^{i \theta m} \tag{rewriting} \\ G(t(\phi)) &= \frac{R}{\omega_2 (m + 1)} \ \ \omega_2 (e^{i\theta}+ me^{i \theta m}) \tag{rewriting} \\ G(t(\phi)) &= \frac{R}{m + 1} \ \ e^{i\theta}+ me^{i \theta m}\end{align*}$$
This is the final representation of the envelope