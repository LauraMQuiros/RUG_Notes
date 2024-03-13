How to compute [[Gaussian Curvature]] for smooth function graphs. [[Euler's Theorem]] relating the principal and normal curvature of a surface 

1st claim. $r(x,y) = r(x,y, z(x,y))$ for $z=z(x,y)$ smooth is always a regular parametrisation
$(1,0, \frac{\delta z}{\delta x})= \frac{\delta r}{\delta x}, \frac{\delta r}{\delta y}= (0,1, \frac{\delta z}{\delta y})$ is a linearly independent vector we will rewrite as $(r_x,r_y)$ $$I = G= \begin{pmatrix} r_x,r_x & r_x,r_y \\ r_y,r_x & r_y,r_y \end{pmatrix} = \begin{pmatrix} 1 + z^2_x & z_xz_y \\ z_yz_x & 1 + z^2_y \end{pmatrix}$$ for which $det(G)$ is always positive an so is the first item, making the matrix a [[Positive Definite Matrix]]. This is the [[First Fundamental Form]].

[[Second Fundamental Form]]: can be calculated in multiple ways, including for $u_1= x, u_2=y$ so $II= - \langle \frac{\delta^2 \vec{r}}{\delta u_i \delta u_j}, \vec{n}(u)\rangle$ for which we will have to calculate $\vec{n}= \frac{r_x \times r_y}{\mid \mid r_x \times r_y \mid \mid} = \frac{-z_x, -z_y, 1}{\sqrt{1+ z_x^2 +z_y^2}}$, $r_{xx}=(0,0,z_{xx}, r_{yy}=(0,0,z_{yy}, r_{xy}=r_{yx}=(0,0,z_{xy})$, the resulting matrix is symmetric 
$$II = \begin{pmatrix} \langle \vec{r}_{xx}, \vec{n} \rangle & \langle \vec{r}_{xy}, \vec{n}\rangle \\ \langle \vec{r}_{yx}, \vec{n} \rangle & \langle \vec{r}_{yy}, \vec{n} \rangle \end{pmatrix} = \frac{1}{\sqrt{1+z^2_x + z^2_y}} \begin{pmatrix} z_{xx} & z_{xy} \\ z_{yx} & z_{yy}\end{pmatrix}$$
the differential of a map $det(d\vec{n})=k$ can also be calculated by the [[First Fundamental Form]] and [[Second Fundamental Form]] like $d\vec{n} \mid_\vec{u} = I^{-1} \cdot II$ 
$$\frac{z_{xx}z_{yy}-z^2_{xy}}{1+z^2_x + z^2_y} / 1+z^2_xz^2_y + (z^2_x - z^2_y)^2 = k(x,y) = det(I^{-1}II) = \frac{det(II)}{det(I)}$$
also the trace $tr, H(x,y) = t \cdot tr(I^{-1} \cdot II)$
>[!todo] What is the trace?

So let's finish by calculating all the z!
let's say $z= \sqrt{1-x^2 -y^2}$, then $z_x=\frac{-x}{\sqrt{1-x^2 -y^2}}$, $z_{xx}= \frac{-1-y^2}{(1-x^2-y^2)^{3/2}}$, $z_{xy}= \frac{-xy}{(1-x^2-y^2)^{3/2}}$, $z_{yy}= \frac{x^2-1}{(1-x^2-y^2)^{3/2}}$
$$k= \frac{z_{xx}z_{yy}-z^2_{xy}}{1+z^2_x + z^2_y} / 1+z^2_xz^2_y + (z^2_x - z^2_y)^2 = \frac{1}{1}= 1$$


[[Euler's Theorem]]: 
principal curvatures of a $K_{\gamma_{x}}(u)= \cos^2(\theta) \cdot k_1 + \sin^2(\theta) \cdot k_2$
of eigenvalues of d n \mid u = I^-1 \cdot II
the inner product is diagonalisable and therefore has 2 directions, moreover (simple collorary) 
$k(u)= k_1 \cdot k_2, h(u)= \frac{k_! + k_2}{2}$

theorem. a point p in m^2  is elliptic k(p)>0, hyperbolic k(p)<0, parabolic is 0 and h(p) not 0, planar both 0. In suitable parametrisation, z=z(x,y), leads to a pos def solution for e.p

gaussian curvature of the loop surface (pretzel), if we fix tangent plane, we get hyperbolic case, 2-surface is 2-sided w.r.t $T_pM^2$