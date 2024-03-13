# Concept Review 
[[Curvature]]: let $\gamma: \mathbb{R} \rightarrow \mathbb{R}^2$ be a [[Regular Curve]]. 
	*take* $s= s(t)$ to be its arc-length (smooth and strictly monotonous function, implicit by [[Implicit Function Theorem (IFT)]])
	then $\gamma'(s)$ is a tangent vector to the curve and $||\gamma'(s_0)||=1$ $$S(t)= \begin{cases} \int_{t_0}^t ||\gamma'(s_0)|| dt &\Rightarrow \frac{ds}{dt} = || \dot\gamma (t) || > 0 \\ &\Rightarrow ||\dot{\gamma}(s)|| \equiv|| \gamma' (t(s))|| = ||\frac{d\gamma}{dt}||\cdot ||\frac{dt}{ds}|| = 0\end{cases}$$
	then $\tau(s) = \gamma'(s)$ satisfies the following property $k(s) \cdot h(s) = \tau ' (s) \bot \tau (s)$ where $n(s) \bot \tau(s)$ and points in the direction of acceleration of $\gamma$ (so $\gamma''(s)$). 

>[! important] $k(s)$ is called curvature of the curve

[[Gram-Schmidt orthogonalization procedure]]:  If $(v_1,…,v_m)$ is a list of linearly independent vectors in $V$, then there exists an orthonormal list $(e_2,…,e_m)$ such that $span(v_1,…,v_k)=span(e_2,…,e_m),\forall k = 1, ... , m$
[[Frenet-Serret Formulas]]: $${\begin{aligned}{\frac { {d} {T} }{{d} s}}&=\kappa {N} ,\\{\frac { {d}{N} }{{d} s}}&=-\kappa {T} +\tau {B} ,\\{\frac {{d} {B} }{{d} s}}&=-\tau {N} ,\end{aligned}}$$

# Evolute
[[Evolute]]: let $\gamma = (x(t), y(t)): \mathbb{R} \rightarrow \mathbb{R}^2$ be a [[Regular Curve]] with non-vanishing curvature. Then at each point $(x(t), y(t))$ there is a normal vector to the curve $n(t) || (-y'(t), x'(t))$ 
![[evolute.gif | 400]]
The normal vector $n(t)$ spans a line $D_t || n(t)$ and passes through $x(t), y(t)$. There is a tangent vector to the curve $D_t = \{x'(t)x(t) + y'(t)y(t) + c = 0\}$ 
The envelope of $D_t$ is called the evolute of the curve $\gamma$. 

# Torsions of spatial curve
Torsions move along the curve. 
Say we have defined tensions along the curve parametrised by the arc-length $s$ $k = k(s), k_2(s), ... , k_{m-1} (s)$. Here $m$ is the number of defined tensions and $n$ is the order of derivatives of torsion to be considered. If we have more derivatives than torsions to define ($m-1 < n-1$) then we can define inductively the tension $k_m (s)$ %%TO-DO: What even is k_m(s)? %%

We can consider the derivations $\tau (s), \tau^1 (s), ... , \tau^{n-1}(s)$ to form a basis, and we can assume they are independent. We apply the [[Gram-Schmidt orthogonalization procedure]] to make the basis [[orthonormal]]. The result is some vectors which satisfy the principles of the [[Frenet-Serret Formulas]] ($\vec{\tau (s)}, \vec{n(s)}, ... , \vec{n_{n-1}(s)}$) and can therefore be referred to as the frenet-serret frame for the curve 

[[Frenet-Serret Formulas]] in [[3-space]]:  $\vec{\tau (s)}, \vec{n(s)}, \vec{e(s)} = \tau(s) \times n(s)$ 

- - -

Vector $n_{m-1}$ is the last one of the sequence of torsion vectors $\vec{\tau (s)}, \vec{n(s)}, \cdots , \vec{n_{n-1}(s)}$ where  $\tau(s) \equiv n_0(s)$. We want to take $n_{m-1}$ and get $k_m(s)$ 

1. Normalisation and orthogonality: has to be a unit vector and orthogonal to its derivative
$$\begin{align*}  \langle n_{m-1}(s), n_{m-1}(s) \rangle \ &= 1 \ \  \\ \ \langle n'_{m-1}(s), n_{m-1}(s) \rangle &= 0 \Rightarrow n'_{m-1} \ \bot \ n_{m-1}(s) \end{align*}$$
2.  Decompose the derivative of vector $n'_{m-1}$ as a linear combination of $\vec{n_i}​​(s)$ vectors with coefficients $a_i$, $a_{m-1}(s) \equiv 0$ and previous torsions. This guarantees the vector is orthogonal to previous ones
$$ n'_{m-1}(s) = \sum^m_{i=0} a_i \ \vec{n_i}(s)$$
3. We also make sure there is orthogonality with $n'_{m-2}$ and its derivative
$$\begin{align*} \langle n_{m-1}(s), n_{m-2}(s) \rangle &= 0 \\ (\langle n_{m-1}(s), n_{m-2}(s) \rangle)'&= 0 \end{align*}$$
4. We ensure that the equations in the previous step are satisfied by solving the sum of the coefficients of the two vectors equal 0. The vectors are unit vector so they have value 1.  $$\begin{align*}\ \langle n_{m-1}(s), n_{m-2}(s) \rangle' &= \langle \sum^m_{i=0}a_i \vec{n_i}(s), n_{m-2}(s) \rangle +  \langle n_{m-1}(s), \sum^{m-1}_{i=0}a_i \vec{n_i}(s)\rangle \\ &= \hat{a}_{m-2}(s) + \hat{a}_{m-1}(s) = 0 \\ \end{align*}$$
5. We will want to repeat this process with all previous torsions at order $e$, for $e < m-2$ $$ \begin{align*}\langle n_{m-1}(s), n_e(s) \rangle' &=0  \\ &\Rightarrow \langle \sum^m_{i=0}\vec{a_i}(s) \vec{n_i}(s), n_e(s) \rangle + \langle n_{m-1}(s), \frac{e+1}{2}\vec{a_i}(s) \vec{n_i}(s)\rangle  \end{align*}$$ %%TO-DO: why not sum in the later part of this sum??%%
This will leave us with 
$$\begin{pmatrix}n_0(s) \equiv \tau(s) \\ n_1(s) \\ n_{m-1}\end{pmatrix}' = \begin{pmatrix} 0 & k(s) & 0 & 0 & \dots & 0\\ -k(s) &0 &k_2(s) &0 & \\ 0 & -k_2(s) & 0 & k_3(s) \\ \vdots &  &  & & \ddots \\0 & & & & & -k_{m-1}s(s) \end{pmatrix}\begin{pmatrix} \tau(s) \\ n_1(s) \\ \vdots \\ n_{n-1}(s) \end{pmatrix}$$
Look at $a_{m-2}(s) + \hat{a}_{m-1}(s)=0$ where the first curvature $k(s)$, $k(s) = \hat{a}_{m-1}$ and the last is $\hat{a}_{m-2}= -k_{m-1}(s)$, inductively from 2 curvatures you can derive and so on
%%TO-DO: What does this mean??%%
