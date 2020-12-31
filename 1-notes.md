# Fibre Optics - Modes of a Fibre <!-- omit in toc -->

## Table of Contents <!-- omit in toc -->

- [1.0 Introduction](#10-introduction)
  - [Single-Mode and Multi-Mode Fibres (SMF & MMF)](#single-mode-and-multi-mode-fibres-smf--mmf)
    - [Step and Graded Indices](#step-and-graded-indices)
- [2.0 Optical Fibre Fabrication](#20-optical-fibre-fabrication)

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

For a given core and cladding radius, the number of modes depends on the numerical appature ($A_N$), core radius ($a$), and the wavelength of light ($\lambda$).

- A fibre with a lower numerical appature has fewer modes
- A fibre with a smaller core has fewer modes

Integrating the above parameters gives the _normalised frequency_:

$$
V = \frac{2\pi}{\lambda_0}aA_N
$$

_where_

$$
A_N=\sqrt{n_1^2-n_2^2}
$$

## Single-Mode and Multi-Mode Fibres (SMF & MMF)

| Normalised Frequency | Fibre Mode  |
| -------------------- | ----------- |
| $V \ll 2.4048$       | Single-Mode |
| $V \gg 2.4048$       | Multi-Mode  |
| $V \approx 2.4048$   | Few-Mode    |

| Single-Mode Fibre                                            | Multi-Mode Fibre                                             |
| ------------------------------------------------------------ | ------------------------------------------------------------ |
| Long Haul Communication                                      | Local Area Networks                                          |
| Core Diameter $\backsim 10\mu m$                             | Core Diameter $\backsim 50\mu m$                             |
| Light Source - Laser Diode                                   | Light Source - LED                                           |
| Difficult to Couple Light                                    | Easier to Couple Light                                       |
| Difficult to Splice Fibres                                   | Not Necessary to Splice Fibres                               |
| Precision Equipment/Components Required                      | Cheaper System Components                                    |
| Silica Glass: $\Delta = 0.003, A_N \backsim 0.1, a = 5\mu m$ | Silica Glass: $\Delta = 0.01, A_N \backsim 0.2, a = 25\mu m$ |

### Step and Graded Indices

![Figure 3.0 - Step and Graded Index](assets/step-and-graded-index.png)

# 2.0 Optical Fibre Fabrication
