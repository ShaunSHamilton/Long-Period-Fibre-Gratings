<link rel="stylesheet" href="index.css">
<nav>
  <a href="/Long-Period-Fibre-Gratings/logbook.html">Logbook</a>
  <a href="/Long-Period-Fibre-Gratings/1-notes.html">Notes</a>
  <a href="/Long-Period-Fibre-Gratings/code.html">Code</a>
</nav>

```matlab
% -------------------------------
% Analysis of Grating-Based Optical Sensors in Extreme Environments
% Author: Shaun Hamilton
% -------------------------------

% -------------------------------
% DEFINITIONS
% -------------------------------

% n_1 - refractive index of core
% n_2 - refractive index of cladding
% n_3 - refractive index of surrounding medium

% lambda - wavelength of light

% r_1 - radius of core
% r_2 - radius of cladding

% b - normalised effective index

% B, C - Sellmeier Coefficient

% FUNCTIONS ---------------------

% V = (lambda: float, n_1: float, n_2: float) => float - normalised frequency
% J = (alpha: int, z: float) => float - Bessel function of the first kind
% Y = (alpha: int, z: float) => float - Bessel function of the second kind

% Sellmeier = (lambda: float, coefficients: [floats]) => float - Sellmeier equation

% -------------------------------

% -------------------------------
% GLOBAL VARIABLES
% -------------------------------

sumprod_upper = 1000; % As Bessel Functions use infinite summations, this defines the upper bound

r_1 = 4.15E-6;
r_2 = 62.5E-6;

SELLMEIER_COEFFICIENTS = [0.7028554,0.4146307,0.8974540,0.0727723,0.1143085,9.896161];

n_1 = Sellmeier(lambda, SELLMEIER_COEFFICIENTS);

% -------------------------------
% FUNCTION DECLARATIONS
% -------------------------------

function normalised_freq = V(lambda, n_1, n_2, r_1)
  normalised_freq = (2*pi/lambda)*r_1*(n_1^2 - n_2^2)^(1/2);
end

function x = J(alpha, z)
  summation = 0;
  for k = 0:sumprod_upper
    summation = summation + ((((-z^2)/4)^k)/(factorial(k) * Gamma(alpha + k + 1)));
  end
  x = ((z/2)^alpha)*summation;
end

function x = Y(alpha, z)
  x = (J(alpha, z)*cos(alpha*pi)-J(-alpha, z))/sin(alpha*pi);
end

function n = Sellmeier(lambda, coefficients)
  coeff_cell = num2cell(coefficients);
  [B_1, B_2, B_3, C_1, C_2, C_3] = coeff_cell{:};
  n = (1 + ((B_1*lambda^2)/(lambda^2 - C_1)) + ((B_2*lambda^2)/(lambda^2 - C_2)) + ((B_3*lambda^2)/(lambda^2 - C_3)))^(1/2);
end

function complex_fac = Gamma(z)
  product = 1;
  for n = 1:sumprod_upper
    product = product*(((1+(1/n))^z)/(1+(z/n)));
  end
  complex_fac = (1/z)*product;
end
```
