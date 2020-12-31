# Fibre Optics - Modes of a Fibre <!-- omit in toc -->

## Table of Contents <!-- omit in toc -->

- [1.0 Introduction](#10-introduction)
- [2.0 Description](#20-description)

# 1.0 Introduction

Modal analysis is needed to accurately determine the light propagation behaviour.

For transmitting light through a fibre, modal analysis is needed to optomise the propagation behaviour of the light throughout the fibre. For example, how the intensity pattern changes as the light propagates through the fibre.

![Figure 1.0 - Light Modes in Fibre](./assets/light-modes-in-fibre.png)

The first field pattern is random, and is not uniform throughout the length of the fibre.
In the above, field patterns which are sustained throughout the length of the fibre is called a mode of the fibre. The velocity of each mode can be unique.

**NOTE:** _Is the velocity of each mode unique? Or, can the light field have a different pattern, but the same velocity profile?_

![Figure 2.0 - Mode in Core and Cladding](assets/mode-in-core-and-cladding.png)

In the above, the random field pattern is fully within the one medium (core) of the fibre. This means the velocity can be described as:

$$
v = \frac{c}{n}
$$

The second section shows an example of when a mode propagates partially in the core, and partially in the cladding. The effective refractive index is described with:

$$
n_2 < n_{eff} < n_1
$$

Proportion of field in the core and in the cladding for different modes is different, hence their $n_{eff}$ are different. That is, different modes travel with different velocities.

**Guided Modes:** modes for which the field is mostly confined to the core

**Radiation Modes:** modes for which the field radiates out in the cladding - $n_{eff} < n_2$

These modes are orthogonal, and form a complete set. Any arbitrary field distribution can be expressed as a superposition of _guided_ and _radiation_ modes.

Therefore, since it is possible to completely define the propagation of individual modes, it is possible to predict the evolution of an arbitrary field pattern, based on _guided_ and _radiation_ modes.

For a given core and cladding radius, the number of modes depends on the numerical appature, and the effective index.

- A fibre with a lower numerical appature has fewer modes
- A fibre with a smaller core has fewer modes

# 2.0 Description
