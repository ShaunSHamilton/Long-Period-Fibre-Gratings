global step_size Z_0
step_size = 1E-17; % Bisection step size
Z_0 = 377; % Electromagnetic Impedance in Vacuum

r_1 = 4.15E-6;
r_2 = 62.5E-6;

global SELLMEIER_COEFFICIENTS_CLAD
SELLMEIER_COEFFICIENTS_CLAD = [0.6961663,0.4079426,0.8974794,0.0684043,0.1162414,9.896161];

% PLOT CORE MODE
coeff_count = 8; % Number of SELLMEIER_COEFFICIENTS_CORE to use
i = 200:1599;
temp = zeros(size(i,1),coeff_count);
hold on;
for j = 1:coeff_count
    switch j
        case 1
            % 0% Ge-Doped
            SELLMEIER_COEFFICIENTS_CORE = [0.6961663,0.4079426,0.8974794,0.0684043,0.1162414,9.896161];
        case 2
            % 3.1% Ge-Doped
            SELLMEIER_COEFFICIENTS_CORE = [0.7028554,0.4146307,0.8974540,0.0727723,0.1143085,9.896161];
        case 3
            % 3.5% Ge-Doped
            SELLMEIER_COEFFICIENTS_CORE = [0.7042038,0.4160032,0.9074049,0.0514415,0.129160,9.896156];
        case 4
            % 4.1% Ge-Doped
            SELLMEIER_COEFFICIENTS_CORE = [0.686717749,0.43481505,0.89656582,0.072675189,0.11514351,10.002398];
        case 5
            % 5.8% Ge-Doped
            SELLMEIER_COEFFICIENTS_CORE = [0.7088876,0.4206803,0.8956551,0.0609053,0.1254514,9.896162];
        case 6
            % 7.0% Ge-Doped
            SELLMEIER_COEFFICIENTS_CORE = [0.6869829,0.44479505,0.79073512,0.078087582,0.11551840,10.436628];
        case 7
            % 7.9% Ge-Doped
            SELLMEIER_COEFFICIENTS_CORE = [0.7136825,0.4254807,0.8964226,0.0617167,0.1270814,9.896161];
        case 8
            % 13.5% Ge-Doped
            SELLMEIER_COEFFICIENTS_CORE = [0.73454395,0.42710828,0.82103399,0.08697693,0.11195191,10.48654];
    end
    c = 1;
    for ii = i
        x = coremode_n_eff(ii*power(10,-3),r_1, SELLMEIER_COEFFICIENTS_CORE);
        temp(c,j) = x;
        c = c + 1;
    end
    plot(i,temp(:,j));
end
title('Core $n_{eff}$ vs $\lambda$',"Interpreter","latex");
legend('0.0% Ge','3.1% Ge','3.5% Ge','4.1% Ge','5.8% Ge','7.0% Ge','7.9% Ge','13.5% Ge');
hold off
ylabel('ERI Core ($n_{eff}$)','Interpreter',"latex"); xlabel('Wavelength ($\lambda$) [$nm$]','Interpreter',"latex");
