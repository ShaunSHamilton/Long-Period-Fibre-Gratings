<link rel="stylesheet" href="index.css">
<nav>
  <a href="/Long-Period-Fibre-Gratings/logbook.html">Logbook</a>
  <a href="/Long-Period-Fibre-Gratings/1-notes.html">Notes</a>
  <a href="/Long-Period-Fibre-Gratings/code.html">Code</a>
</nav>

# Logbook <!-- omit in toc -->

- [Dates](#dates)
  - [20/12/2020](#20122020)
    - [Supervisor Questions](#supervisor-questions)
    - [Report Progress](#report-progress)
    - [Notes Progress](#notes-progress)
  - [28/12/2020](#28122020)
    - [Report Progress](#report-progress-1)
    - [Notes Progress](#notes-progress-1)
  - [04/01/2021](#04012021)
    - [Report Progress](#report-progress-2)
    - [Notes Progress](#notes-progress-2)
    - [Meeting (08/01/2021)](#meeting-08012021)
  - [11/01/2021](#11012021)
    - [Report Progress](#report-progress-3)
    - [Notes Progress](#notes-progress-3)
    - [Miscellaneous](#miscellaneous)
  - [18/01/2021](#18012021)
    - [Supervisor Questions](#supervisor-questions-1)
    - [Report Progress](#report-progress-4)
    - [Notes Progress](#notes-progress-4)
  - [25/01/2021](#25012021)
    - [Supervisor Questions](#supervisor-questions-2)
    - [Report Progress](#report-progress-5)
    - [Code Progress](#code-progress)
    - [Notes Progress](#notes-progress-5)
  - [01/02/2021](#01022021)
    - [Supervisor Questions](#supervisor-questions-3)
    - [Report Progress](#report-progress-6)
    - [Code Progress](#code-progress-1)
  - [08/02/2021](#08022021)
    - [Code Progress](#code-progress-2)
  - [15/02/2021](#15022021)
    - [Code Progress](#code-progress-3)
  - [22/02/2021](#22022021)
  - [01/03/2021](#01032021)
    - [Code Progress](#code-progress-4)
  - [08/03/2021](#08032021)
    - [Code Progress](#code-progress-5)
    - [Supervisor Questions](#supervisor-questions-4)
  - [15/03/2021](#15032021)
  - [22/03/2021](#22032021)
- [Miscellaneous](#miscellaneous-1)
  - [Report Writing](#report-writing)

# Dates

## 20/12/2020

### Supervisor Questions

- Harvard Referencing, or Numbered Referencing?
  - Numbered
- Previous student's paper code is horribly formatted (and in Python), might I as well start from scratch?
  - Start afresh
- Fibre or Fiber? (Do you care...)
  - British - Fibre
- Literary Review
  - How much detail should I go into w.r.t. basics of optical light transmission?
  - How much of the previous student's paper should be reviewed if we are replicating results? (I would imagine this belongs more in the discussion/evaluation)
    - Tell the story of how I got to where I am now. How original gratings are made...how they are made...now at a point of different materials...context
    - Hold hand in introduction for non-optics specialists...explain to a student collegue

### Report Progress

- Prelim report submitted

### Notes Progress

- Introduction Complete - Single-Mode and Multi-Mode

## 28/12/2020

### Report Progress

- Interim Report Started
  - Cleaned up spelling mistakes from prelim
  - Added Layout
  - Included Literary Review

### Notes Progress

- Added Chapter 1: Introduction

## 04/01/2021

### Report Progress

- Final Report
  - Added full layout

### Notes Progress

- Added Chapter 2: Fabrication
- Added Chapter 3: Transmission Characteristics

### Meeting (08/01/2021)

- Weekly/Bi-weekly updates to JS
- If stuck, ask for references
- Look into phase matching specifically for LPFGs
- Mention fabrication methods - UoG change diametre rather than $n$
- MATLAB has easier to use, included functions than vanilla bi-section method
- Compare time it takes to calculate modes from previous student paper to my use of MATLAB
  - Number of operations to find $b$
  - Built-in functions faster than vanila methods?
  - Not a Python vs MATLAB comparison!
  - Use same values previous user used
- LPG Glass fibres...then move on to Saffire fibres
- Validate whether saffire vs glass is correct for same mathematics
- Move on to cladding
  - Which mode causes $n_{eff}$ couple phases
- How much power travels through fibre
- Look into V ($\Lambda$) number

- Calculate Sellmeir
- Calculate $n_{eff}$ in Core
- Calculate $n_{eff}$ in Cladding

Assumptions

- Experiment with $\leq100T$ gratings - to validate
- How long to make the grating?
- Linear-Polerised mode ($LP$)
- Look at number of periods vs power loss

- HE modes: H - magnetic, E - electric

To evaluate paper

- How sensitive is this to parameters
- Journey of research - How can this be expanded into Saffire or HE modes

## 11/01/2021

### Report Progress

- Introduction ✔️
- Literary Review ✔️
- Methodology ✔️
- Results ✖️
- Prelimenary Conclusion ✖️
- TODO Outline ✔️
- Health and Safety ✔️

### Notes Progress

- Added Chapter 4: Optical Fibre Gratings

### Miscellaneous

[Effective Refractive Index described in StackExchange](https://physics.stackexchange.com/questions/135978/effective-refractive-index-calculation-of-fiber-core)

## 18/01/2021

- **Interim Report Due**

### Supervisor Questions

- Why specific parameters? Does it relate to work being done at UoG
  - 3.1% $GeO_2$
  - Should I limit the work to $1300nm < \lambda 1600nm$, as the previous work, and why?
    _"Use the same parameters, in order to validate the previous work"_
- Previous work pulls equations out of thin air, and I am struggling to verify them
  - Can I take them at their word?
  - Are these resources my _best-bet_ to derive the equations needed? - ISBN 13:978-0-12-088481-0 (I have access to the book) - ISBN 10: 0-12-088481-X - University of Colerado: Modal Analysis of Step-Index Fibres
    _"See 'Weakly Guided Fibres' paper"_
- Previous work's power modes **(TODO: improve question formulation)**

### Report Progress

- Added MATLAB functions for vanilla core effective refractive index calculations

### Notes Progress

- Added Chapter 5: LPGs

## 25/01/2021

### Supervisor Questions

- What is the _problem of the dielectric cylinder_?
  - Does it apply to our conditions?
- Does is make sense to refer to $n_{1}^{\text{eff}}$?
  - That is, are there at least two _effective refractive indices_?
  - _Assume light stays in the core, so ERI is $n_{1}^{\text{eff}}$\_
- Does linearly polarised mean both $x$ and $y$ components of the wave are equal?
  - Is this an assumption I can/need to make?
  - _Assumes magnetic part of wave is negligable._
- What Sellmeier coefficients do I use to calculate $n_2$?
  - _Using pure-silica numbers make sense_
  - Send link to JS for GitHub code

### Report Progress

1. Introduction ❎
   1. Fibre Optics ✔️
   2. Long Period Fibre Gratings ✔️
   3. Fabrication of Fibres and Gratings ✔️
   4. Literary Review ✔️
   5. Objectives and Scope ❎
2. Methods ❎
   1. Conditions and Assumptions ❎
   2. Effective Refractive Indices ❎
      1. Core Mode ✔️
      2. Cladding Mode ✖️
   3. Phase Matching Curves ✖️
3. Results ✖️
   1. MATLAB Performance ✖️
      1. Native MATLAB ✖️
      2. Dedicated Functions ✖️
   2. Large Refractive Index Difference ✖️
4. Discussion ✖️
5. Conclusion and Evaluation ✖️
6. Refrences ❎
7. Appendix ✖️

### Code Progress

### Notes Progress

- Added Chapter 5: Electric and Magnetic Waves
- Moved Chapter 5 $\rightarrow$ 6 & 6 $\rightarrow$ 7

## 01/02/2021

### Supervisor Questions

### Report Progress

1. Introduction ❎
   1. Fibre Optics ✔️
   2. Long Period Fibre Gratings ✔️
   3. Fabrication of Fibres and Gratings ✔️
   4. Literary Review ✔️
   5. Objectives and Scope ❎
2. Methods ❎
   1. Conditions and Assumptions ❎
   2. Effective Refractive Indices ❎
      1. Core Mode ✔️
      2. Cladding Mode ✖️
   3. Phase Matching Curves ✖️
3. Results ✖️
   1. MATLAB Performance ✖️
      1. Native MATLAB ✖️
      2. Dedicated Functions ✖️
   2. Large Refractive Index Difference ✖️
4. Discussion ✖️
5. Conclusion and Evaluation ✖️
6. Refrences ❎
7. Appendix ✖️

### Code Progress

- Forced calculation of $n_{1}^{eff}$
- Need to find how to use Sellmeier equation for $n_2$

## 08/02/2021

### Code Progress

- Added Cladding Mode functions

## 15/02/2021

### Code Progress

- Still unable to get core mode function to be correct

## 22/02/2021

## 01/03/2021

### Code Progress

- Corrected wavelength to be in $\mu m$, as _Sellmeier_ equation assumes such
- Current core mode effective refractive indices are calculated to be lower than the previous work's results
- Corrected the Bessel Function Derivations

## 08/03/2021

### Code Progress

- Need to figure out how to correctly calculate cladding mode dispersion relation equations

### Supervisor Questions

- Is there a difference between a Sapphire fibre, and a Sapphire Derived Fibre?

## 15/03/2021

- **PRESENTATION DUE on 19th**

## 22/03/2021

# Miscellaneous

## Report Writing

- Abstract - Do last
- Introduction
  - Literary Review
    - Start with the broad topic of project - What are long-period, grating-based sensors? Or, what are optical fibres?
    - What has been done in the area, but needs more work - Large RI ratios between core and cladding
    - End with specific implementation - Long-period, grating-based optical fibres in extreme environments
  - Implementation - Potentially, unnecessary? Same as above child?
- Methods
  - How to reproduce this
- Results
- Discussion
  - Compare my results to the results of others - Previous student paper
- Conlusion and Evaluation

  - Conclusion
  - Evaluation
    - Remember **ERRORS** relating to rounding

- Bernd Porr (FYP Advisor)
  - bernd.porr@glasgow.ac.uk
