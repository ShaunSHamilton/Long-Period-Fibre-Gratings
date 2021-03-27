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
% K = (alpha: int, z: float) => float - Bessel function (modified) of the second kind

% J_der = (alpha: int, z: float) => float - Bessel function derivative of the first kind
% Y_der = (alpha: int, z: float) => float - Bessel function derivative of the second kind
% K_der = (alpha: int, z: float) => float - Bessel function (modified) derivative of the second kind

% Sellmeier = (lambda: float, coefficients: [floats]) => float - Sellmeier equation

% -------------------------------

% -------------------------------
% GLOBAL VARIABLES
% -------------------------------
global step_size Z_0
step_size = 1E-15; % Bisection step size
Z_0 = 377; % Electromagnetic Impedance in Vacuum

r_1 = 4.15E-6;
r_2 = 62.5E-6;

% 3.1% Ge-Doped
sell_core = [0.7028554,0.4146307,0.8974540,0.0727723,0.1143085,9.896161];
sell_clad = [0.6961663,0.4079426,0.8974794,0.0684043,0.1162414,9.896161];

% -------------------------------
% TESTING
% -------------------------------

% PLOT CORE MODE
% temp1 = zeros(300,1);
% i = 1300:1599;
% for ii = i
%     x = coremode_n_eff(ii*power(10,-3),r_1, sell_core, sell_clad);
%     temp1(ii-1299) = x;
% end
% figure(1)
% plot(i,temp1); title('Core $n_{eff}$ vs $\lambda$',"Interpreter","latex");
% ylabel('ERI Core ($n_{eff}$)','Interpreter',"latex"); xlabel('Wavelength ($\lambda$) [$nm$]','Interpreter',"latex");

% PLOT CLADDING MODES
lambda_test = 1550E-3; % in micrometers
n_core = coremode_n_eff(lambda_test, r_1,sell_core, sell_clad);
n_eff = linspace(1.44,n_core,10000);
[zeta_0, zeta_0_prime] = cladding_mode(lambda_test,r_1,r_2, n_eff, sell_core, sell_clad);
% plot(n_eff,zeta_0, n_eff, zeta_0_prime);
figure(2)
plot(n_eff,real(zeta_0), n_eff, real(zeta_0_prime));
legend('Zeta0',"Zeta0'");

intersections = find_intersections(n_eff, real(zeta_0), real(zeta_0_prime));

load train
sound(y, Fs)
