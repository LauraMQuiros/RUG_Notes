Concepts to review: 
- The mathematical modeling of a physical system,
- Transfer function and State-space representations of a system,
- the stability of a system ([[Routh-Hurwitz criterion]]), and
- the [[PID controller]] design.
Slides: [[Week1Day1.pdf]]
Office Hours: Mondays after lecture 13:30-14:30 (NB 5111.0151), no questions in the break
No formula sheet at exam, handwritten by two side A4
- - -

What is [[Mechatronics]]? 
- Integration of mechanics with electronics and information processing
- synergistic comb of precision mechanical engineering, electronic control and systems
- synergetic integration of mechanical engineering with electronic and intelligent computer control in the design and manufacture of industrial products and processes

Examples: 
Cruise Control: keeps car at certain speed
	mechanic: engine
	sensors: speed sensor
	actuator: breaks, engine sign to decrease speed

[[Mechatronics Design Cycle]]:
We have user demands (comfy, flexible, useful) and how they translate in functional requirements (lifespan, weight, response time, power source autonomy) and then we arrive at the specifications. The last section is always the same (controller design, modelling and simulation, systems integration).
![[MechatronicsDesignCycle.png | 600]]

[[V-diagram of Mechatronics]]: alternative question to [[Mechatronics Design Cycle]], it includes further steps
![[VDiagram.png | 600]]

[[Coupling Devices]]: conversion from a type of energy to another. If very small amount of energy is converted they are referred to as 

| Source     | Result     | Device       |
| ---------- | ---------- | ------------ |
| electrical | mechanical | DC motor     |
| mechanical | electrical | AC Generator |
1. Actuator electro-mechanical coupling 
for a translational motor
input: current I and voltage V
output: velocity v and force F
why do these relationship exist? F = i / alpha, Valpha = v
2. Actuator fluid-mechanical coupling
hydraulic door?
input: pressure difference $P12$ and flow is like our current $Q_f$
output: torques $T$ and rotation $\omega$ 
T=DP12, rotation= flow/D
An electro-hydraulic servo actuator goes from electrical input to hydraulic output

In general actuators will convert electrical domain into another domain

[[Sensors]]: they are classified according to their measurement objectives, will convert other domains to electrical domain
- - -
[[Systems Engineering]]: interdisciplinary approach and means to enable the successful realisation of complex systems. Focuses on defining user demands and functional requirements early in the design cycle