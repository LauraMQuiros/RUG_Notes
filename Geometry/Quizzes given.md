---
Q&A: 2 questions and 3 def
---
[[Isometry]]: under action of Euclidean isometries on $\mathbb{R}^n$ which form the group of orthogonal matrices $O(n) \in A \Leftrightarrow A^TA=id$
[[Implicit Function Theorem (IFT)]]: Given a map $F: \mathbb{R}^n \rightarrow \mathbb{R}^m \times \mathbb{R}^n$, assume there is $F(x_0, y_0)=z_0$ and that rank $\frac{\delta f}{\delta x}\mid_{(x_0, y_0)} = n$. Then equation-n $F(x,y)=z_0$ has locally a unique and smooth solution $y=y(x), F(x,y(x))=z_0$
[[Inverse Function Theorem]]: If a map $F: \mathbb{R}^n \rightarrow  \mathbb{R}^n$ is such that rank $\frac{\delta f}{\delta x}\mid = n$ then f is invertible: there exists a smooth map for $f(x_0)=z_0, f^{-1}$, such that $f^{-1} \circ f =$ id and $f^{-1}$ is smooth. f is locally a diffeomorphism
# 1. [[Curvature]] of the regular curve 

- [ ] Complete isometry is invariant in regular spatial curve
- [ ] Complete isometry is invariant in regular plane curve
- [ ] If regular spatial curve is identically 0, then the curve is planar

In plane, you can reconstruct the curve with its isometries, $$\begin{pmatrix} \tau \\ n \end{pmatrix}' = \begin{pmatrix} 0 & k \\ -k & 0 \end{pmatrix} \begin{pmatrix} \tau \\ n  \end{pmatrix}, \begin{cases} \tau' = k \cdot n \\ n'= -k \cdot \tau = -k \cdot \gamma'(s) \end{cases}$$
In space you have additional direction so it's a 2-variable system, like a constant curvature helix. Knowing one of the variables is not enough anymore, so second point is not true. $$\begin{pmatrix} \tau \\ n \\ b \end{pmatrix}' = \begin{pmatrix} 0 & k & 0 \\ -k & 0 & h \\ 0 & -h & 0 \end{pmatrix} \begin{pmatrix} \tau \\ n \\ b \end{pmatrix}$$
# 2. Quadric surfaces
- [ ] Which quadric surfaces can be ruled surfaces [[05 Quadric surfaces]]