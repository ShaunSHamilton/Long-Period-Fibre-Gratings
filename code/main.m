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

r_1 = 4.15E-6;
r_2 = 62.5E-6;

% 3.1% Ge-Doped
sell_core = [0.7028554,0.4146307,0.8974540,0.0727723,0.1143085,9.896161];
sell_clad = [0.6961663,0.4079426,0.8974794,0.0684043,0.1162414,9.896161];

% -------------------------------
% TESTING
% -------------------------------
mode_in = input("Select a mode: "); % 1-Core Mode ERI; 2-Cladding Modes; 3-Cladding Mode ERIs

switch (mode_in)
    case 1
        % PLOT CORE MODE
        lambda_i = 1300;
        step = 0.1;
        i = lambda_i:step:1600;
        temp1 = zeros(size(i,2),1);
        c = uint64((i-(lambda_i))./step)+1;
        for ii = c
            lambda = (double(ii-1)*step + lambda_i)*power(10,-3);
            x = coremode_n_eff(lambda,r_1, sell_core, sell_clad);
            temp1(ii,1) = x;
        end
        %figure(1)
        %plot(i,temp1); title('Core $n_{eff}$ vs $\lambda$',"Interpreter","latex");
        %ylabel('ERI Core ($n_{eff}$)','Interpreter',"latex"); xlabel('Wavelength ($\lambda$) [$nm$]','Interpreter',"latex");
        
    case 2
        % --------------------------------------------------------------
        % PLOT CLADDING MODES
        num_cladding_modes = 15;
        lambda_test = 1550E-3; % in micrometers
        
        n_core = coremode_n_eff(lambda_test, r_1,sell_core, sell_clad);
        
        n_clad = Sellmeier(lambda_test, sell_clad);
        n_eff = linspace(1.01,n_clad-0.001,10000);
        [zeta_0, zeta_0_prime] = cladding_mode(lambda_test,r_1,r_2, n_eff, sell_core, sell_clad);
        
        
        % FINDING CLADDING MODE INTERSECTIONS
        real_0 = real(zeta_0);
        real_prime = real(zeta_0_prime);
        [intersections, x, y] = find_intersections(n_eff, real_0, real_prime, num_cladding_modes);
        
        % plot(n_eff,zeta_0, n_eff, zeta_0_pr
        plot(n_eff,real_0, n_eff, real_prime, x, y, 'ro');
        xlabel("Refractive Index");
        legend('Zeta0',"Zeta0'", 'intersection');
        
    case 3
        %  --------------------------------------------------------------
        num_cladding_modes = 15;
        lambda_i = 1300;
        step = 1; % Step of 1 does not adversly affect coremode approx.
        i = lambda_i:step:1599;
        % Initialise plotting matrix
        temp = zeros(length(i),num_cladding_modes);
        %intersecs = zeros(num_cladding_modes, size(i,2)*2);
        % Prepare steps for parallel computing
        c = uint64((i-(lambda_i))./step)+1;
        %t = 1;
        parfor ii = c
            % Recalculate wavelength steps
            lambda = (double(ii-1)*step + lambda_i)*power(10,-3);
            n_core = coremode_n_eff(lambda,r_1, sell_core, sell_clad);
            n_clad = Sellmeier(lambda, sell_clad);
            n_eff = linspace(1.01,n_clad-0.001,1000); % [Weakly Guiding Fibres]
                % suggests a few parts in a thousand is feasible.
            [zeta_0, zeta_0_prime] = cladding_mode(lambda,r_1,r_2, n_eff, sell_core, sell_clad);
            % FINDING CLADDING MODE INTERSECTIONS
            [intersections, xi, yi] = find_intersections(n_eff, real(zeta_0), real(zeta_0_prime), num_cladding_modes);
            temp(ii,:) = intersections(:,1)';
            percent_complete = (double(ii)/size(c,2))*100;
            % Percent Complete is not accurate for multi-threaded operations,
            % however, it does provide a somewhat useful indication as to progress
            fprintf("Complete: %2.2f \n", percent_complete);
        end
        %clf();
        hold on
        for j = 1:num_cladding_modes
            ERI = (~temp(:,j)==0);
            plot(i(ERI),temp(ERI,j));
        end
        title('Cladding Mode ERI $n_{eff}$ vs $\lambda$',"Interpreter","latex");
        hold off
        load train
        sound(y,Fs);
        ylabel('ERI Cladding ($n_{eff}$)','Interpreter',"latex"); xlabel('Wavelength ($\lambda$) [$nm$]','Interpreter',"latex");
end

%%
% hold on
% for j = 1:num_cladding_modes
%     ERI = (~temp(:,j)==0);
%     plot(i,temp(ERI,j));
% end
% title('Cladding Mode ERI $n_{eff}$ vs $\lambda$',"Interpreter","latex");
% %legend('0.0% Ge','3.1% Ge'); %,'3.5% Ge','4.1% Ge','5.8% Ge','7.0% Ge','7.9% Ge','13.5% Ge');
% hold off
% %load train
% %sound(y,Fs);
% ylabel('ERI Cladding ($n_{eff}$)','Interpreter',"latex"); xlabel('Wavelength ($\lambda$) [$nm$]','Interpreter',"latex");
