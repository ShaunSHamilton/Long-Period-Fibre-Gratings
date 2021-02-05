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
% n_eff_1 - effective refractive index of core
% n_eff_2 - effective refractive index of cladding

% lambda - wavelength of light

% r_1 - radius of core
% r_2 - radius of cladding

% b - normalised effective index

% B, C - Sellmeier Coefficient

% FUNCTIONS ---------------------

% core_lp_approx = (lambda_0: float, r_1: float, n_eff_1: float)
% => [left: float, right: float] - linearly polarised approximation for core

% coremode_n_eff(lambda_0: float, r_1: float)
% => float - Effective refractive index for core

% V = (lambda: float, n_1: float, n_2: float) => float - normalised frequency
% J = (alpha: int, z: float) => float - Bessel function of the first kind
% Y = (alpha: int, z: float) => float - Bessel function of the second kind

% Sellmeier = (lambda: float, coefficients: [floats]) => float - Sellmeier equation

% -------------------------------

% -------------------------------
% GLOBAL VARIABLES
% -------------------------------
global step_size
step_size = 0.000000000000001; % Bisection step size
sumprod_upper = 10000; % As Bessel Functions use infinite summations, this defines the upper bound

r_1 = 4.15E-6;
r_2 = 62.5E-6;

global SELLMEIER_COEFFICIENTS_CORE SELLMEIER_COEFFICIENTS_CLAD
SELLMEIER_COEFFICIENTS_CORE = [0.7028554,0.4146307,0.8974540,0.0727723,0.1143085,9.896161];
SELLMEIER_COEFFICIENTS_CLAD = [0.6961663,0.4079426,0.8974794,0.0684043,0.1162414,9.896161];

% -------------------------------
% BISECTION METHOD (NATIVE)
% -------------------------------

% -------------------------------
% TEST
% -------------------------------
temo = size(0,300);
i = 1300:1601;
for ii = i
    temo(ii-1299) = coremode_n_eff(ii*power(10,-9),r_1);
end
plot(i,temo)

function [left, right] = core_lp_approx(lambda_0,r_1,n_eff_1)
    global SELLMEIER_COEFFICIENTS_CORE SELLMEIER_COEFFICIENTS_CLAD
    n_1 = Sellmeier(lambda_0, SELLMEIER_COEFFICIENTS_CORE);
    n_2 = Sellmeier(lambda_0, SELLMEIER_COEFFICIENTS_CLAD);
    b = (n_eff_1^2 - n_2^2)/(n_1^2 - n_2^2);
    v = V(lambda_0, n_1, n_2, r_1);
    
    sqr_temp1 = sqrt(1-b);
    sqr_temp2 = sqrt(b);
    c = v * sqr_temp1;
    d = J(1, c);
    e = J(0, dc);
    left = c * d / e;
    f = v *sqr_temp2;
    g = Y(1,f);
    h = Y(0,f);
    right = f * g/ h;
end


function [n_eff_1] = coremode_n_eff(lambda_0,r_1)
    global SELLMEIER_COEFFICIENTS_CORE SELLMEIER_COEFFICIENTS_CLAD step_size;
    n_1 = Sellmeier(lambda_0, SELLMEIER_COEFFICIENTS_CORE);
    n_2 = Sellmeier(lambda_0, SELLMEIER_COEFFICIENTS_CLAD);
    n_eff_1_prev = n_2 + step_size;
    n_eff_1_post = n_1 - step_size;
    while n_eff_1_post - n_eff_1_prev > 0.000000001
        n_eff_1 = (n_eff_1_prev + n_eff_post_core)/2;
        left_right = core_lp_approx(lambda_0,r_1,n_eff_1);
        
        % What happens when left_right(1) === left_right(2)...?
        if (left_right(1) - left_right(2) < 0)
            n_eff_1_prev = n_eff_1;
        elseif (left_right(1) - left_right(2) > 0)
            n_eff_1_post = n_eff_1;
        end
    end
    n_eff_1 = (n_eff_1_prev + n_eff_1_post)/2;
end



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