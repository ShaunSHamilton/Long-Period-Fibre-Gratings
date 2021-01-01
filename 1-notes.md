# Fibre Optics - Modes of a Fibre <!-- omit in toc -->

## Table of Contents <!-- omit in toc -->

- [1.0 Introduction](#10-introduction)
  - [Single-Mode and Multi-Mode Fibres (SMF & MMF)](#single-mode-and-multi-mode-fibres-smf--mmf)
    - [Step and Graded Indices](#step-and-graded-indices)
- [2.0 Optical Fibre Fabrication](#20-optical-fibre-fabrication)
  - [Common Materials](#common-materials)
    - [Glass](#glass)
    - [Halide Glass](#halide-glass)
    - [Active Glass](#active-glass)
    - [Chalcogenide Glass](#chalcogenide-glass)
    - [Polymer](#polymer)
  - [Fabrication](#fabrication)
    - [Fabrication of Pre-Form](#fabrication-of-pre-form)
      - [Chemical Processes](#chemical-processes)
      - [Methods](#methods)
      - [Modified Chemical Vapour Deposition](#modified-chemical-vapour-deposition)
      - [Outside Vapour Deposition](#outside-vapour-deposition)
    - [Drawing Fibre from the Pre-Form](#drawing-fibre-from-the-pre-form)
    - [Fibre Bundle](#fibre-bundle)

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

## Common Materials

### Glass

- Fused silica glass (A.K.A silicate glass)
- Currently, the most widely used material for telecommunication fibre
- Low power losses
- Chemically inert
- Optically stable throughout material
- High glass transition temperature

### Halide Glass

- Flouride glass
- Low transmission losses at mid-infrared wavelengths
- Composition: $ZrF_4$, and $BaF_2, LaF_3, AlF_3, NaF$
- Under development for $2\mu m$ systems

### Active Glass

- Rare earth doped glass
- $Er$/$Nd$/$Tm$ doped within fused silica
- Used in optical fibre amplifiers, and fibre lasers

### Chalcogenide Glass

- Composition: $As_{40}S_{58}Se_2$ / $As_2S_3$
- High optical non-linearity (long interaction length)
- High losses (~$1 dBm^{-1}$)
- Used in mid-infrared sources, fibre amplifiers, and switches

### Polymer

- Composition: Polymethyl methacrylate / perfluorinated polymer
- High losses (~$0.2 dBm^{-1}$)
- Cheap to manufacture
- Light weight, and easy to install
- Dimensionally large
- Used in short distance communication (~$100 m$), sensing, and lighting

## Fabrication

### Fabrication of Pre-Form

The Pre-Form determines the reflective index profile, geometry of core and cladding, and core concentricity. The quality determines the propagation characteristics of the final fibre.

![Preform Fabrication with Doping Concentrations](assets/preform-fabrication-with-doping.png)

**NOTE:** _$Germanium$ develops colour-centres, which absorbs ionising radiation. Hence, $Flourine$ is used as the cladding with undoped-core, when in an environment with ionising, nuclear radiation_

#### Chemical Processes

$$
SiCl_4 + O_2 \rightarrow SiO_2 + 2Cl_2 \\
GeCl_4 + O_2 \rightarrow GeO_2 + 2Cl_2 \\
4POCl_3 + 3O_2 \rightarrow 2P_2O_5 + 6Cl_2 \\
TiCl_4 + O_2 \rightarrow TiO_2 + 2Cl_2 \\
4BCl_3 + 3O_2 \rightarrow 2B_2O_3 + 6Cl_2
$$

#### Methods

| Flame Hydrolysis               | Chemical Vapour Deposition                  |
| ------------------------------ | ------------------------------------------- |
| Vapour Axial Deposition        | Modified Chemical Vapour Deposition         |
| Outside Vapour Phase Oxidation | Plasma Modified Chemical Vapour Deposition  |
| Outside Vapour Deposition      | Plasma Activated Chemical Vapour Deposition |

#### Modified Chemical Vapour Deposition

![Modified Chemical Vapour Deposition](./assets/modified-chemical-vapour-deposition.png)

A gaseous mixture of reactants is fed at the end of a rotating, silica tube. The tube is heated by a traversing, oxi-hydrogen burner. Glass particles (soot) are deposited on the internal tube wall. A thin, glass layer is formed, as the soot is vitrified by the burner. Finally, the temperature of the burner is increased to ~$2000 \degree C$, in order for the tube to collapse into a solid preform.

#### Outside Vapour Deposition

![Outside Vapour Deposition](assets/outside-vapour-deposition.png)

Layer by layer, soot is deposited on an aluminium oxide, or graphite, mandrel. After deposition, the central mandrel is removed. Finally, the hollow, porous preform is dehydrated and collapsed in an inert environment, through sintering.

### Drawing Fibre from the Pre-Form

![Fibre Drawing](assets/fibre-drawing.png)

Using a precision-controlled, feeding mechanism, preform is lowered into the high-purity graphite furnace. Gravity draws the glass into a glob. Acrylic is coated on the fibre, and cured in a furnace, before the final diameter is measured. Finally, the fibre is wound on a drum.

### Fibre Bundle

**Coherent Bundle** - the relative positions of the fibres at the input and output are the same.

- Image is not scrambled
- Used in endoscopy

**Incoherent Bundle** - the fibres are not aligned in a particular way.

- Image is scrambled
- Used as a coder or illumination
- Decoded using a similar bundle
