Brief review: what is a [[Riemannian Metric]]? Look in [[07 prep Tangent spaces and Riemannian Metric]]
An embedding of $M^{n-1} \subset \mathbb{R}$ regular hyper plane s, parametrised by $\vec{r}(u', \cdots, u^{n-1})$ such that G defines an inner product in $T_\vec{u} \mathbb{R}^{n-1}$ 
You can also think of it as a smooth in u family of pos def symmetric bilinear forms on $\mathbb{R}^{n-1}, u \in D \subset \mathbb{R}^{n-1}$, for which D is open and $G=G(u) \in Mat_{n-1 \lambda n-1} \mathbb{R}^{n-1}$, for pos def G
One can use $g_{ij}$ to measure distances and angles. $$d(p,q) := inf_\gamma length(\gamma)= inf_\gamma \int^b_a \mid \mid \dot{\gamma}(t) \mid \mid dt \equiv  inf_{\gamma= r(u(t))} \int \sqrt{g_{ij}\dot{u}^i(t)\dot{u}^j(t)} dt$$ for which $\gamma(a)=p, \gamma(b)=q$ and $\gamma$ is a smooth curve. inf is infimo

[[Homeomorphism]]: a bijective and continuous function between topological spaces that has a continuous inverse function (open mapping)
- - -
[[Gaussian Curvature]]
for hypersurfaces in $\mathbb{R}^n$. I need an open embedding of a surface in $\mathbb{R}^n$ like $\vec{r}: D \subset \mathbb{R}^{n-1} \rightarrow \mathbb{R}^n$ which is injective, smooth t homeo into the image and regular (the partial derivative vectors are linearly independent $\forall u \in D$). This three conditions are what it means to be an embedding. 
	homeo condition not that important to local patches, which is what we are studying

We can therefore assume there is a normal vector to the surface $\vec{n}(u): D \rightarrow S^{n-1}$ knowing that $D \rightarrow \mathbb{R}^n$. From there we can get the [[Gaussian Curvature]] of $M^{n-1}$ at $\vec{r}(u)$ $$\begin{align}d\vec{n} \mid_u : T_uD &\rightarrow T_{\vec{n}(u)}S^{n-1} \\ T_uD &\rightarrow T_{\vec{r}(u)}M^{n-1} \\ det(d\vec{n}\mid_u) &= K(u)\end{align}$$
Also, trace $d\vec{n} \mid_u = H(u)$ is the [[Mean Curvature]]
 We can parametrise $\vec{n}(u)$ using n-1 coordinates since $\vec{n}(u) \in S^{n-1}$. $\vec{n}(u): D \subset \mathbb{R}^{n-1} \rightarrow U \subset \mathbb{R}^{n-1}$, $d\vec{n} \mid_u \in M_{n-1 \times n-1} (\mathbb{R}), d(-\vec{n})\mid_u = (-1)^{n-1} d(\vec{n}) \mid_u$  

  >[!error] Spivale
  >Intro into differential geometry
  
  Another way to compute $K(u)$ the setup is that of a surface $M^{n-1} \subset \mathbb{R}^n, \vec{r}(u', \cdots, u^{n-1})$ 
[[Second Fundamental Form]]: $$ \langle d\vec{n} \mid_{u} (.), . \rangle_{} : T_{\vec{r}(M)}M^{n-1} \times T_{\vec{r}(u)}M^{n-1} \rightarrow \mathbb{R}$$
A matrix n-1 x n-1 has a bilinear form (2-forms from Multivariable Analysis, 1st fundamental form, tensors (0,2)), operators ($d\vec{n}, A$, tensors (1,1)) and dual object to bilinear forms (tensors of type (2,0)). 

We can go from bilinear forms to operators. Operator $A: \mathbb{R}^{n-1} \rightarrow \mathbb{R}^{n-1}$ if we combine with inner product $\langle .,.\rangle$ we get bilinear form $\langle A\vec{u}, \vec{v} \rangle$, and we can do similar operation from bilinear form $B(.,.)$ such that $A(u) \cdot \langle A(u), . \rangle := B(u,.)$ 

The [[Second Fundamental Form]] $$II_{\vec{r}}(\vec{v_1} \vec{v_2}) = \langle d\vec{n} \mid_{\vec{r}(u)} \vec{v_1}, \vec{v_2} \rangle = \langle \frac{\delta^2 \vec{r}}{\delta v_1 \delta v_2}, \vec{n}(u)\rangle$$ for which the first part is $d^2 \vec{r} (\vec{v_1}, \vec{v_2})$ in a basis of partial derivatives of $r$ from $u^1$ to $u^{n-1}$ of $T_u M^{n-1}$,  $$II_{\vec{r}(u)} (\frac{\delta \vec{r}}{\delta u_i}, \frac{\delta \vec{r}}{\delta u_j}) = \langle \frac{\delta^2 \vec{r}}{\delta u_i \delta u_j} \mid_{\vec{r}(u)}, \vec{n}(u)\rangle$$
corollary for $p= \vec{r}(u)$ $$K(u)= \frac{det(II_p \mid_{\vec{r}(u)})}{det(I_p \mid_{\vec{r}(u)})}$$
