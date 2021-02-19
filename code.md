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

% J_der = (alpha: int, z: float) => float - Bessel function derivative of the first kind
% Y_der = (alpha: int, z: float) => float - Bessel function derivative of the second kind

% Sellmeier = (lambda: float, coefficients: [floats]) => float - Sellmeier equation

% -------------------------------

% -------------------------------
% GLOBAL VARIABLES
% -------------------------------
global step_size
step_size = 1E-15; % Bisection step size
sumprod_upper = 1E5; % As Bessel Functions use infinite summations, this defines the upper bound
Z_0 = 377; % Electromagnetic Impedance in Vacuum

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
i = 1300:1599;
for ii = i
    temo(ii-1299) = coremode_n_eff(ii*power(10,-9),r_1);
end
plot(i,temo); title('$n_{eff}$ vs $\lambda$',"Interpreter","latex");
ylabel('$n_{eff}$','Interpreter',"latex"); xlabel('Wavelength ($\lambda$) [$nm$]','Interpreter',"latex");

function [left, right] = core_lp_approx(lambda_0,r_1,n_1,n_2,n_eff_1)
    b = (n_eff_1^2 - n_2^2)/(n_1^2 - n_2^2);
    v = V(lambda_0, n_1, n_2, r_1);

    sqr_temp1 = sqrt(1-b);
    sqr_temp2 = sqrt(b);
    c = v * sqr_temp1;
    d = J(1, c);
    e = J(0, c);
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
    while n_eff_1_post - n_eff_1_prev > 0.0000000001
        n_eff_1 = (n_eff_1_prev + n_eff_post_core)/2;
        [left, right] = core_lp_approx(lambda_0,r_1,n_1,n_2,n_eff_1);

        % What happens when left === right...?
        if (left - right < 0)
            n_eff_1_post = n_eff_1;
        elseif (left - right > 0)
            n_eff_1_prev = n_eff_1;
        end
    end
    n_eff_1 = (n_eff_1_prev + n_eff_1_post)/2;
end


% -------------------------------
% CLADDING MODE
% -------------------------------

function [zeta_0, zeta_0_prime] = cladding_mode(lambda, r_1, r_2)
    u_1 = u(lambda, n_1, n_eff);
    u_2 = u(lambda, n_2, n_eff);
    z_1 = u_2*r;
    z_2 = u_2*r_1;
    w_3 = w(lambda, n_3, n_eff);

    u_21 = (1/(u_2^2)) - (1/(u_1^2));
    u_32 = (1/(w_3^2)) + (1/(u_2^2));

    sigma_1 = I*alpha*n_eff/Z_0;
    sigma_2 = I*alpha*n_eff*Z_0;

    % REPEATED CALCULATIONS ------------
    J_v = j_func(alpha,u_1,r_1);
    K_v = k_func(alpha,r_2,w_3);

    P_l = p(alpha, z_1, z_2);
    Q_l = q(alpha, z_1, z_2);
    R_l = R(alpha,z_1,z_2);
    S_l = s(alpha, z_1, z_2);

    J_K = J_v*K_v;
    sigma_u = sigma_1*sigma_2*u_21*u_32;
    r_12 = r_1*r_2;
    K_Q = K_v*Q_l;
    J_R = J_v*R_l;
    n2_2 = n_2^2;
    n1_2 = n_1^2;
    % ---------------------------------

    zeta_0 = (1/sigma_2)*((u_2*(J_K + (sigma_u)/((n2_2) * r_12))...
    *P_l - K_Q + J_R - (1/u_2)*S_l)...
    /(-u_2*(J_v*(u_32/(n2_2 * r_2)) - K_v*(u_21/(n1_2 * r_1)))*P_l...
     + Q_l*(u_32/(n1_2 * r_2)) + R_l*(u_21/(n1_2 * r_1))));

    % REPEATED CALCULATIONS ------------
    u32_r2 = u_32/r_2;
    n3_2 = n_3^2;
    % ----------------------------------

    zeta_0_prime = (sigma_1)*((u_2*(J_v*u32_r2 - K_v*((n3_2 * u_21)/(n2_2 * r_1)))...
    *P_l + Q_l*(u32_r2) + R_l*(u_21/r_1))...
    /(u_2*(J_K*(n3_2/n2_2) + sigma_u/(n1_2*r_12))...
    *P_l - K_Q*(n3_2/n1_2) + J_R - S_l*(n2_2/(n1_2*u_2))));
end
% -----------------

function J_v = j_func(alpha, u_1,r_1)
    z = u_1*r_1;
    J_v = (J_der(alpha, z))/(u_1* J(alpha, z));
end

function K_v = k_func(alpha,r_2,w_3)
    z = w_3*r_2;
    K_v = (Y_der(alpha, z))/(w*Y(alpha, z));
end

function u = u(lambda, n, n_eff)
    u = (2*pi/lambda)*sqrt(n^2 - n_eff^2);
end

function w_3 = w(lambda, n_3, n_eff)
    w_3 = (2*pi/lambda)*sqrt(n_eff^2 - n_3^2);
end

function p = p(alpha, z_1, z_2)
    % z_1 = u_2*r;
    % z_2 = u_2*r_1;
    p = J(alpha, z_1)*N(alpha, z_2) - J(alpha, z_2)*N(alpha, z_1);
end

function q = q(alpha, z_1, z_2)
    % z_1 = u_2*r;
    % z_2 = u_2*r_1;
    q = J(alpha, z_1)*N_der(alpha, z_2) - J_der(alpha, z_2)*N(alpha, z_1);
end

function r = R(alpha, z_1, z_2)
    % z_1 = u_2*r;
    % z_2 = u_2*r_1;
    r = J_der(alpha, z_1)*N(alpha, z_2) - J(alpha, z_2)*N_der(alpha, z_1);
end

function s = s(alpha, z_1, z_2)
    % z_1 = u_2*r;
    % z_2 = u_2*r_1;
    s = J_der(alpha, z_1)*N_der(alpha, z_2) - J_der(alpha, z_2)*N_der(alpha, z_1);
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

function x = J_der(alpha, z)
    syms a b
    c = J(a,b);
    d = diff(c);
    x = d(alpha, z);
end

function x = Y(alpha, z)
    x = (J(alpha, z)*cos(alpha*pi)-J(-alpha, z))/sin(alpha*pi);
end

function x = Y_der(alpha, z)
    syms a b
    c = Y(a,b);
    d = diff(c);
    x = d(alpha, z);
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
