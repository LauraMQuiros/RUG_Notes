[[Geodesics]]: 3 points defined last lecture

Geodesics in (r^n, <.,.> ) are 
$r^i_kj = 1/2 g^{is} (\delta_k g_{is} - \delta_s g_{jk} + \delta_j g_{sk})$
for which $g_ij$ is identity, since universal basis for r n is the dot product and $G(e_1, \cdots, e_i) = \delta_{ij}$

Geodesics on 
cilinders $x^2 + y^2 = r^4 \in \mathbb{R}^3$
cones in  $\mathbb{R}^3$ one given by "folding"  $\mathbb{R}^2$ into a cylinder. They are images of straight lines, but possibly also helix.

$$
\begin{align}
x^2 + y^2 &= \xi = r^2 \\
z &= \frac{\xi}{R}\\
r &= (\xi \cos (\phi), \xi \sin (\phi), \frac{\xi}{r})\\
r_\phi &= (- \xi \sin (\phi), \xi \cos (\phi), 0) \\
r_\xi &= \frac{}{}(\cos (\phi), \sin (\phi), \frac{\xi}{r}) \\
\end{align}
$$


[[Gauss-bonnet theorem]] (tutorials)
the gaussian curvature on a closed surface $M^2$ ($s^2 + g$ handles or $s^2 + M$ mobius bands), $\frac{1}{2\pi} \int k ds = \begin{cases} 2-2g \\ 2 - M \end{cases}$  for $ds = \sqrt{g} ds \wedge d\phi$ is the derivative of the surface

local [[Gauss-bonnet theorem]]$$\int kds = - \pi - (\alpha + \beta + \gamma)$$ for a geodesic triangle on $M^2$ ABC with angles $\alpha \beta \gamma$

proof of step 1 can be found in [[H. S. M. Coxeter - Introduction to Geometry.pdf]]
1. Geodesic polar coords (s, phi) for arc-length, angle and the $$G= \begin{pmatrix} 1 & 0 \\ 0 & g(s) \end{pmatrix}$$ this is in pages 370-371
2. express $k= k(g) = - \frac{(\sqrt{g})''s}{\sqrt{g}}$, pages 267-268
3. $\frac{1}{2\pi} \int k ds$ , page 372

look at [[Euler's Theorema Egregium]] in polar coords, plug it in and integrate

say $k= -1$ area ABC $\pi > (\alpha + \beta + \gamma)$ , $k=0, \pi \equiv (\alpha + \beta + \gamma)$
this will be in hw/ exam