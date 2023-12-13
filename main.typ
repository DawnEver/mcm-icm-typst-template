#import "template.typ": project
#import "appendices.typ" : appendices
#show: appendices.with()

#show: project.with(
  title: "Enjoy a Cozy and Green Bath",
  abstract: [
A traditional bathtub cannot be reheated by itself, so users have to add hot water from time to time. Our goal is to establish a model of the temperature of bath water in space and time. Then we are expected to propose an optimal strategy for users to keep the temperature even and close to initial temperature and decrease water consumption.

To simplify modeling process, we firstly assume there is no person in the bathtub. We regard the whole bathtub as a thermodynamic system and introduce heat transfer formulas.

We establish two sub-models: adding water constantly and discontinuously. As for the former sub-model, we define the mean temperature of bath water. Introducing Newton cooling formula, we determine the heat transfer capacity. After deriving the value of parameters, we deduce formulas to derive results and simulate the change of temperature field via CFD. As for the second sub-model, we define an iteration consisting of two process: heating and standby. According to energy conservation law, we obtain the relationship of time and total heat dissipating capacity. Then we determine the mass flow and the time of adding hot water. We also use CFD to simulate the temperature field in second sub-model.

In consideration of evaporation, we correct the results of sub-models referring to some scientists' studies. We define two evaluation criteria and compare the two sub-models. Adding water constantly is found to keep the temperature of bath water even and avoid wasting too much water, so it is recommended by us.

Then we determine the influence of some factors: radiation heat transfer, the shape and volume of the tub, the shape/volume/temperature/motions of the person, the bubbles made from bubble bath additives. We focus on the influence of those factors to heat transfer and then conduct sensitivity analysis. The results indicate smaller bathtub with less surface area, lighter personal mass, less motions and more bubbles will decrease heat transfer and save water.

Based on our model analysis and conclusions, we propose the optimal strategy for the user in a bathtub and explain the reason of uneven temperature throughout the bathtub. In addition, we make improvement for applying our model in real life.
    ],
  keywords: ("Heat transfer", "Thermodynamic system", "CFD", "Energy conservation"),
  team-number: "00000",
  problem-chosen: "A",
  year: "2024",
  bibliography-file: "refs.bib",
)


= Introduction

== Background

Bathing in a tub is a perfect choice for those who have been worn out after a long day's working. A traditional bathtub is a simply water containment vessel without a secondary heating system or circulating jets. Thus the temperature of water in bathtub declines noticeably as time goes by, which will influent the experience of bathing. As a result, the bathing person needs to add a constant trickle of hot water from a faucet to reheat the bathing water. This way of bathing will result in waste of water because when the capacity of the bathtub is reached, excess water overflows the tub.

An optimal bathing strategy is required for the person in a bathtub to get comfortable bathing experience while reducing the waste of water.

== Literature Review

Korean physicist Gi-Beum Kim analyzed heat loss through free surface of water contained in bathtub due to conduction and evaporation #cite(<example0>). He derived a relational equation based on the basic theory of heat transfer to evaluate the performance of bath tubes. The major heat loss was found to be due to evaporation. Moreover, he found out that the speed of heat loss depends more on the humidity of the bathroom than the temperature of water contained in the bathtub. So, it is best to maintain the temperature of bathtub water to be between 41 to 45 $attach(C,tl:circle)$ and the humidity of bathroom to be 95%.

When it comes to convective heat transfer in bathtub, many studies can be referred to. Newton's law of cooling states that the rate of heat loss of a body is proportional to the difference in temperatures between the body and its surroundings while under the effects of a breeze #cite(<example1>). Claude-Louis Navier and George Gabriel Stokes described the motion of viscous fluid substances with the Navier-Stokes equations. Those equations may be used to model the weather, ocean currents, water flow in a pipe and air flow around a wing #cite(<example2>).

In addition, some numerical simulation software are applied in solving and analyzing problems that involve fluid flows. For example, Computational Fluid Dynamics (CFD) is a common one used to perform the calculations required to simulate the interaction of liquids and gases with surfaces defined by boundary conditions #cite(<example3>).

== Restatement of the Problem

We are required to establish a model to determine the change of water temperature in space and time. Then we are expected to propose the best strategy for the person in the bathtub to keep the water temperature close to initial temperature and even throughout the tub. Reduction of waste of water is also needed. In addition, we have to consider the impact of different conditions on our model, such as different shapes and volumes of the bathtub, etc.

In order to solve those problems, we will proceed as follows:


- *Stating assumptions*. By stating our assumptions, we will narrow the focus of our approach towards the problems and provide some insight into bathtub water temperature issues.

- *Making notations*. We will give some notations which are important for us to clarify our models.

- *Presenting our model*. In order to investigate the problem deeper, we divide our model into two sub-models. One is a steady convection heat transfer sub-model in which hot water is added constantly. The other one is an unsteady convection heat transfer sub-model where hot water is added discontinuously.

- *Defining evaluation criteria and comparing sub-models*. We define two main criteria to evaluate our model: the mean temperature of bath water and the amount of inflow water.

- *Analysis of influencing factors*. In term of the impact of different factors on our model, we take those into consideration: the shape and volume of the tub, the shape/volume/temperature of the person in the bathtub, the motions made by the person in the bathtub and adding a bubble bath additive initially.

- *Model testing and sensitivity analysis*. With the criteria defined before, we evaluate the reliability of our model and do the sensitivity analysis.

- *Further discussion*. We discuss about different ways to arrange inflow faucets. Then we improve our model to apply them in reality.

- *Evaluating the model*. We discuss about the strengths and weaknesses of our model:

  1. ...
  2. ...
  3. ...
  4. ...

= Assumptions and Justification

To simplify the problem and make it convenient for us to simulate real-life conditions, we make the following basic assumptions, each of which is properly justified.

- *The bath water is incompressible Non-Newtonian fluid*. The incompressible Non-Newtonian fluid is the basis of Navier–Stokes equations which are introduced to simulate the flow of bath water.

- *All the physical properties of bath water, bathtub and air are assumed to be stable*. The change of those properties like specific heat, thermal conductivity and density is rather small according to some studies #cite(<example4>). It is complicated and unnecessary to consider these little change so we ignore them.

- *There is no internal heat source in the system consisting of bathtub, hot water and air*. Before the person lies in the bathtub, no internal heat source exist except the system components. The circumstance where the person is in the bathtub will be investigated in our later discussion.

- *We ignore radiative thermal exchange*. According to Stefan-Boltzmann’s law, the radiative thermal exchange can be ignored when the temperature is low. Refer to industrial standard #cite(<example4>), the temperature in bathroom is lower than 100 $attach(C,tl:circle)$, so it is reasonable for us to make this assumption.

- *The temperature of the adding hot water from the faucet is stable*. This hypothesis can be easily achieved in reality and will simplify our process of solving the problem.

= Notations

// \begin{center}
// \begin{tabular}{clc}
// {\bf Symbols} & {\bf Description} & \quad {\bf Unit} \\[0.25cm]
// $h$ & Convection heat transfer coefficient & \quad W/(m$^2 \cdot$ K) 
// \\[0.2cm]
// $k$ & Thermal conductivity & \quad W/(m $\cdot$ K) \\[0.2cm]
// $c_p$ & Specific heat & \quad J/(kg $\cdot$ K) \\[0.2cm]
// $\rho$ & Density & \quad kg/m$^2$ \\[0.2cm]
// $\delta$ & Thickness & \quad m \\[0.2cm]
// $t$ & Temperature & \quad $attach(C,tl:circle)$, K \\[0.2cm]
// $\tau$ & Time & \quad s, min, h \\[0.2cm]
// $q_m$ & Mass flow & \quad kg/s \\[0.2cm]
// $\Phi$ & Heat transfer power & \quad W \\[0.2cm]
// $T$ & A period of time & \quad s, min, h \\[0.2cm]
// $V$ & Volume & \quad m$^3$, L \\[0.2cm]
// $M,\,m$ & Mass & \quad kg \\[0.2cm]
// $A$ & Aera & \quad m$^2$ \\[0.2cm]
// $a,\,b,\,c$ & The size of a bathtub  & \quad m$^3$
// \end{tabular}
// \end{center}

where we define the main parameters while specific value of those parameters will be given later.

= Model Overview

In our basic model, we aim at three goals: keeping the temperature as even as possible, making it close to the initial temperature and decreasing the water consumption.

We start with the simple sub-model where hot water is added constantly.
At first we introduce convection heat transfer control equations in rectangular coordinate system. Then we define the mean temperature of bath water.

Afterwards, we introduce Newton cooling formula to determine heat transfer
capacity. After deriving the value of parameters, we get calculating results via formula deduction and simulating results via CFD.

Secondly, we present the complicated sub-model in which hot water is
added discontinuously. We define an iteration consisting of two process:
heating and standby. As for heating process, we derive control equations and boundary conditions. As for standby process, considering energy conservation law, we deduce the relationship of total heat dissipating capacity and time.

Then we determine the time and amount of added hot water. After deriving the value of parameters, we get calculating results via formula deduction and simulating results via CFD.

At last, we define two criteria to evaluate those two ways of adding hot water. Then we propose optimal strategy for the user in a bathtub.
The whole modeling process can be shown as follows@fig1.


#figure(
  image("./img/fig1.jpg",width: 60%),
  caption: [Modeling process],
)<fig1>

Citation example of Fig.@a,@b.

#grid(
    columns: (auto, auto),
    rows:    (auto, auto),
    gutter: 1pt,
    [ #figure(
      image("./img/image.png"),
      caption: [1biudwi8d10do12h-1dj],
    )<a> ],
    [ #figure(
      image("./img/image.png"),
      caption: [1biudwi8d10do12h-1dj],
    )<b> ],
    [ #figure(
      image("./img/image.png"),
      caption: [1biudwi8d10do12h-1dj],
    )<c> ],
    [ #figure(
      image("./img/image.png"),
      caption: [1biudwi8d10do12h-1dj],
    )<d> ],
)\

= Sub-model I : Adding Water Continuously

We first establish the sub-model based on the condition that a person add water continuously to reheat the bathing water. Then we use Computational Fluid Dynamics (CFD) to simulate the change of water temperature in the bathtub. At last, we evaluate the model with the criteria which have been defined before.

== Model Establishment

Since we try to keep the temperature of the hot water in bathtub to be even, we have to derive the amount of inflow water and the energy dissipated by the hot water into the air.

We derive the basic convection heat transfer control equations based on the former scientists’ achievement. Then, we define the mean temperature of bath water. Afterwards, we determine two types of heat transfer: the boundary heat transfer and the evaporation heat transfer. Combining thermodynamic formulas, we derive calculating results. Via Fluent software, we get simulation results.

=== Control Equations and Boundary Conditions

According to thermodynamics knowledge, we recall on basic convection
heat transfer control equations in rectangular coordinate system. Those
equations show the relationship of the temperature of the bathtub water in space.

We assume the hot water in the bathtub as a cube. Then we put it into a
rectangular coordinate system. The length, width, and height of it is $a, b$ and $c$.


#figure(
  image("./img/fig2.jpg",width: 60%),
  caption: [Modeling process],
)<fig2>

In the basis of this, we introduce the following equations \cite{5}:


- *Continuity equation:*

// \begin{equation} \label{eq1}
// \frac{\partial u}{\partial x} + \frac{\partial v}{\partial y} +\frac{\partial w}{\partial z} =0
// \end{equation}

where the first component is the change of fluid mass along the $X$-ray. The second component is the change of fluid mass along the $Y$-ray. And the third component is the change of fluid mass along the $Z$-ray. The sum of the change in mass along those three directions is zero.


- *Moment differential equation (N-S equations):*

// \begin{equation} \label{eq2}
// \left\{
// \begin{array}{l} \!\!
// \rho \Big(u \dfrac{\partial u}{\partial x} + v \dfrac{\partial u}{\partial y} + w\dfrac{\partial u}{\partial z} \Big) = -\dfrac{\partial p}{\partial x} + \eta \Big(\dfrac{\partial^2 u}{\partial x^2} + \dfrac{\partial^2 u}{\partial y^2} + \dfrac{\partial^2 u}{\partial z^2} \Big) \\[0.3cm]
// \rho \Big(u \dfrac{\partial v}{\partial x} + v \dfrac{\partial v}{\partial y} + w\dfrac{\partial v}{\partial z} \Big) = -\dfrac{\partial p}{\partial y} + \eta \Big(\dfrac{\partial^2 v}{\partial x^2} + \dfrac{\partial^2 v}{\partial y^2} + \dfrac{\partial^2 v}{\partial z^2} \Big) \\[0.3cm]
// \rho \Big(u \dfrac{\partial w}{\partial x} + v \dfrac{\partial w}{\partial y} + w\dfrac{\partial w}{\partial z} \Big) = -g-\dfrac{\partial p}{\partial z} + \eta \Big(\dfrac{\partial^2 w}{\partial x^2} + \dfrac{\partial^2 w}{\partial y^2} + \dfrac{\partial^2 w}{\partial z^2} \Big)  
// \end{array}
// \right.
// \end{equation}


- *Energy differential equation*

$
// rho*c_p*u*partial t/ partial x
$<eq3>

where the left three components are convection terms while the right three components are conduction terms.

By Equation @eq3, we have ......

......

On the right surface in Fig.@fig2, the water also transfers heat firstly with bathtub inner surfaces and then the heat comes into air. The boundary condition here is ......

=== Definition of the Mean Temperature

......

=== Determination of Heat Transfer Capacity

......

= Sub-model II: Adding Water Discontinuously

In order to establish the unsteady sub-model, we recall on the working principle of air conditioners. The heating performance of air conditions consist of two processes: heating and standby. After the user set a temperature, the air conditioner will begin to heat until the expected temperature is reached. Then it will go standby. When the temperature get below the expected temperature, the air conditioner begin to work again. As it works in this circle, the temperature remains the expected one.

Inspired by this, we divide the bathtub working into two processes: adding
hot water until the expected temperature is reached, then keeping this
condition for a while unless the temperature is lower than a specific value. Iterating this circle ceaselessly will ensure the temperature kept relatively stable.

== Heating Model

=== Control Equations and Boundary Conditions

=== Determination of Inflow Time and Amount

== Standby Model

== Results

We first give the value of parameters based on others’ studies. Then we get the calculation results and simulating results via those data.

=== Determination of Parameters

After establishing the model, we have to determine the value of some
important parameters.

As scholar Beum Kim points out, the optimal temperature for bath is
between 41 and 45$attach(C,tl:circle)$ #cite(<example1>). Meanwhile, according to Shimodozono's study, 41$attach(C,tl:circle)$ warm water bath is the perfect choice for individual health [2]. So it is reasonable for us to focus on 41$attach(C,tl:circle)$ 45 $attach(C,tl:circle)$. Because adding hot water continuously is a steady process, so the mean temperature of bath water is supposed to be constant. We value the temperature of inflow and outflow water with the maximum and minimum temperature respectively.

The values of all parameters needed are shown as follows:

.....

=== Calculating Results

Putting the above value of parameters into the equations we derived before, we can get the some data as follows:


#figure(
  table(
  columns: (auto, auto, auto),
  inset: 3pt,
  align: horizon,
  [*Parameter*], [*Value*], [*Unit*],
  [$A_1$],[1.05],[$m^2$],
  [$A_2$],[2.24],[$m^2$],
  [$Phi_1$],[189.00],[$W$],
  [$Phi_2$],[43.47],[$W$],
  [$Phi$],[232.47],[$W$],
  [$q_m$],[0.014],[$"g/s"$],
  ),
  caption: [The calculating results],
)<tab2>\

From Table @tab2, ......

......

= Correction and Contrast of Sub-Models

After establishing two basic sub-models, we have to correct them in consideration of evaporation heat transfer. Then we define two evaluation criteria to compare the two sub-models in order to determine the optimal bath strategy.

== Correction with Evaporation Heat Transfer

Someone may confuse about the above results: why the mass flow in the first sub-model is so small? Why the standby time is so long? Actually, the above two sub-models are based on ideal conditions without consideration of the change of boundary conditions, the motions made by the person in bathtub and the evaporation of bath water, etc. The influence of personal motions will be discussed later. Here we introducing the evaporation of bath water to correct sub-models.

== Contrast of Two Sub-Models

Firstly we define two evaluation criteria. Then we contrast the two submodels via these two criteria. Thus we can derive the best strategy for the person in the bathtub to adopt.

= Model Analysis and Sensitivity Analysis

== The Influence of Different Bathtubs

Definitely, the difference in shape and volume of the tub affects the
convection heat transfer. Examining the relationship between them can help
people choose optimal bathtubs.

=== Different Volumes of Bathtubs

In reality, a cup of water will be cooled down rapidly. However, it takes quite long time for a bucket of water to become cool. That is because their volume is different and the specific heat of water is very large. So that the decrease of temperature is not obvious if the volume of water is huge. That also explains why it takes 45 min for 320 L water to be cooled by 1$attach(C,tl:circle)$.

In order to examine the influence of volume, we analyze our sub-models
by conducting sensitivity Analysis to them.


= Strength and Weakness

== Strength

- We analyze the problem based on thermodynamic formulas and laws, so that the model we established is of great validity.

- Our model is fairly robust due to our careful corrections in consideration of real-life situations and detailed sensitivity analysis.

- Via Fluent software, we simulate the time field of different areas throughout the bathtub. The outcome is vivid for us to understand the changing process.

- We come up with various criteria to compare different situations, like water consumption and the time of adding hot water. Hence an overall comparison can be made according to these criteria.

- Besides common factors, we still consider other factors, such as evaporation and radiation heat transfer. The evaporation turns out to be the main reason of heat loss, which corresponds with other scientist’s experimental outcome.


== Weakness

- Having knowing the range of some parameters from others’ essays, we choose a value from them to apply in our model. Those values may not be reasonable in reality.

- Although we investigate a lot in the influence of personal motions, they are so complicated that need to be studied further.

- Limited to time, we do not conduct sensitivity analysis for the influence of personal surface area.

= Further Discussion

In this part, we will focus on different distribution of inflow faucets. Then we discuss about the real-life application of our model.

== Different Distribution of Inflow Faucets

In our before discussion, we assume there being just one entrance of inflow.

From the simulating outcome, we find the temperature of bath water is hardly even. So we come up with the idea of adding more entrances.

The simulation turns out to be as follows:

#figure(
  image("./img/fig24.jpg",width: 60%),
  caption: [The simulation results of different ways of arranging entrances],
)<fig24>

From the above figure, the more the entrances are, the evener the temperature will be. Recalling on the before simulation outcome, when there is only one entrance for inflow, the temperature of corners is quietly lower than the middle area.

In conclusion, if we design more entrances, it will be easier to realize the goal to keep temperature even throughout the bathtub.

== Model Application

Before discussion is based on ideal assumptions. In reality, we have to make some corrections and improvement.

1. Adding hot water continually with the mass flow of 0.16 kg/s. This way can ensure even mean temperature throughout the bathtub and waste less water.

2. The manufacturers can design an intelligent control system to monitor the temperature so that users can get more enjoyable bath experience.

3. We recommend users to add bubble additives to slow down the water being cooler and help cleanse. The additives with lower thermal conductivity are optimal.

4. The study method of our establishing model can be applied in other area relative to convection heat transfer, such as air conditioners.

