For the rotational Newton's law $$\begin{align*} J\ddot{\theta} = \tau - \text{stiffness} - \text{friction} = \tau &= ||L \times T ||^2 \tag{Newton's Rotational Law} \\ L = \begin{bmatrix} L \sin{\theta} \\ L \cos{\theta} \end{bmatrix}, T &= [-T_x, -T_y] \tag{$-$ bc of Newton's 3rd law}\\ \det \begin{bmatrix} L \sin{\theta} & L \cos{\theta} \\ -T_x & -T_y \end{bmatrix} &= T_x L \cos{\theta}- T_y L \sin{\theta} \end{align*}$$
Write down the eq of the crane: \ref{eq:state-space}

Draw free body diagram
![[Screenshot 2024-12-03 at 14.40.19.png]]

The NLD is the shock absorption. 
There are two blocks
J1 has Ts same and T_k both pointing towards it, where T_k is the resistance torque of the spring
J2 has NLD and T_k towards the block

J_1 \ddot{\theta_1} = T_s - k(\theta_1 - \theta_2)
J_2 \ddot{\theta_2} = k(\theta_1 - \theta_2) - \frac{\dot{\theta_2} T_0}{|\dot{\theta_2}|} - C |\dot{\theta_2}| \theta_2