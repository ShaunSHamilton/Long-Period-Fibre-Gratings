function n_eff_1 = coremode_n_eff(lambda_0,r_1, sell_core, sell_clad)
%COREMODE_N_EFF Calculates the core effective refractive index for a given
%wavelength

    isPlot = true;
    x = [];
    y = [];
    c = 1;

    step_size = 1E-16;
    n_1 = Sellmeier(lambda_0, sell_core);
    n_2 = Sellmeier(lambda_0, sell_clad);
    n_eff_1_prev = n_2 + step_size;
    n_eff_1_post = n_1 - step_size;
    lambda = lambda_0*power(10,-6);
    while n_eff_1_post - n_eff_1_prev > 1E-15
        n_eff_1 = (n_eff_1_prev + n_eff_1_post)/2;
        [left, right] = core_lp_approx(lambda,r_1,n_1,n_2,n_eff_1);

        if (left - right < 0)
            n_eff_1_post = n_eff_1;
            fprintf("Less than: %f \n",n_eff_1);
        elseif (left - right > 0)
            n_eff_1_prev = n_eff_1;
            fprintf("Greater than: %f \n",n_eff_1);
        end
        if isPlot
            x(c) = n_eff_1;
            y(c,1) = left;
            y(c,2) = right;
            c = c+1;
        end
    end
    if isPlot
        scatter(x,y(:,1),x,y(:,2));
    end
    n_eff_1 = (n_eff_1_prev + n_eff_1_post)/2;
end