[[Curvature]] of curves in 2-plane
	Let $\gamma: \mathbb{R} \rightarrow \mathbb{R}^2$ be a [[Regular Curve]]. Assume that $k(t) \neq 0$. Then the circle that has centre on the line $\gamma(t)+ \tau \vec{n}(t), \tau \in \mathbb{R}$ and radius $g=\frac{1}{k(t)}$ is called the [[Osculating Circle]] of the curve (and passing through $\gamma(t)$). 
	![[Osculating_circle.png | 300]]
	Alternative definition: 
	$s(t)$ passes through $x,\gamma(t)$ and is tangent to $\gamma$ at $\gamma(t)$. As the curve $\gamma$ approaches the point $\gamma(t)$ (i.e., as the parameter s approaches $s_0​$), the deviation or difference between the curve $\gamma$  and its osculating circle $\delta(x)$ becomes smaller and approaches zero in the limit. $$\begin{align}\gamma(s)&= \gamma(t(s_0)) + \gamma'(s_0) (s- s_0)+ \gamma''(s_0)(s - s_0)^2 + h.o.t \\ \alpha(s) &= \gamma(s_0) + \tau(s_0) (s- s_0)+ \frac{1}{2} k(s_0) r(s_0)(s - s_0)^2 \end{align}$$ where $k(s_0)= \frac{1}{g(s_0)}, s_0 = t$  
 
>[!info] h.o.t is higher-order terms

Relation between curve and oscillating circle
[[Curvature]] $$k(t)= \frac{\dot{x}\ddot{y} - \ddot{x}\dot{y}}{(x^2 + y^2)^{3/2}}$$
[[Curvature]] and [[Torsion]] in 3-space: 
if $\gamma$ is the curve $$H = \frac{det(\dot{\gamma}(t), \ddot{\gamma}(t), \dddot{\gamma}(t))}{||\dot{\gamma} \times \ddot{\gamma}||^2}  \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ k(t)= \frac{||\dot{\gamma}(t) \cdot \ddot{\gamma}(t)||}{||\dot{\gamma}(t)||^3}$$ proof: let's $t \leftrightarrow s$, being s the arc-length we calculate the three main derivatives we will use $$\begin{align} \dot{\gamma}(t) &= \tau(s)\dot{s} = \gamma'(s) \dot{s} \\ \ddot{\gamma}(t) &= k(s)n(s)s^2 +\tau(s)\ddot{s} = \gamma''(s)s^2 + \gamma'(s) \ddot{s} \\ \dddot{\gamma}(t) &= \cdots = \gamma'''(s)s^3 + 3\gamma''\ddot{s}\dot{s} +\gamma'(s) \dddot{s}  \end{align}$$
then we can get into calculating the torsion $H$ and the curvature $k(t)$ in 3-space $$\begin{align} det(\dot{\gamma}(t), \ddot{\gamma}(t), \dddot{\gamma}(t)) &= s^6 k^2(s) H(s) \\ ||\dot{\gamma} \times \ddot{\gamma}||^2 &= (s^3)^2 k^2(s) \\ H &= \frac{s^6 k^2(s) H(s)}{(s^3)^2 k^2(s)}= H(s) \end{align}$$
Example is of an helix $\gamma= \{x(t)=r \cos(t), y(t)=r \sin(t), z(t)=c \cdot t\}$ has the main derivatives $$\begin{align}  \dot{\gamma}(t) &= (-r\sin(t), r \cos(t), c) \\ \ddot{\gamma}(t) &= (-r \cos(t),- \sin(t),0) \\ \dddot{\gamma}(t) &= (r\sin(t),-r\cos(t),0) \\  ||\dot{\gamma} \times \ddot{\gamma}||^2 &= r^2 c^2 + r^2 \\ H &= \frac{c}{r^2 + c^2} \end{align}$$ If c ever approaches 0, that makes it a [[Singular Curve]] and if H ever approaches 0, that makes the spatial curve a planar curve. If c ever approaches $\infty$, then H will be 0, so the helix would have max stretch and just be a line

Theorem: let $\gamma:(a,b) \rightarrow \mathbb{R}^2$ be a [[Regular Curve]] with non-vanishing curvature. Then the [[Evolute]] of $\gamma$ coincides with the curve of curvature centres of $\gamma$. i.e. curve traversed by centres of [[Oscillating Circle]]s 

proof the curve of the curvature centers $$\begin{align*} c(t)&= \gamma(t) + g(t)\vec{n}(t) \tag{use arc-length param} \\ c'(s)&= \gamma'(s) + g(s)\vec{n}'(s) +   g'(s)\vec{n}(s) \\ c'(s)&= g(s)\vec{n}'(s) \\ c'(s)&= \frac{-1}{\vec{n}'(s)}\vec{n}'(s)  \end{align*}$$

[[Huygen's Principle]]: The [[Evolute]] of $\gamma$ is given by $\{\gamma(t) +a\vec{n}(t) | \gamma'(t) +a\vec{n}'(t)= 0\}$. In other words, this is the set of points were wave-fields $\gamma(t)+ an(t)$ develop a singular point

Proof: let $(\gamma(t) +an(t))'=0$ and $t \rightarrow s$, the arc-length. When it's a singular point, it doesn't depend in the parameter. 
$$\gamma(s) + an(t) = \begin{cases} \gamma'(s) + a \cdot \vec{n}(s) \\ \tau(s) -a \cdot k(s) \cdot \vec{\tau}(s)= 0\end{cases}$$
Remember $a= \frac{1}{k(s)}=g(s)$ so is a curvature centre and hence is on the convolute

[Evolute computed from oscillating circles](https://demonstrations.wolfram.com/EvolutesOfSomeBasicCurves/)
