function n_eff_1 = coremode_n_eff(lambda_0,r_1, SELLMEIER_COEFFICIENTS_CORE)
%COREMODE_N_EFF Calculates the core effective refractive index for a given
%wavelength

    global SELLMEIER_COEFFICIENTS_CLAD step_size;
    n_1 = Sellmeier(lambda_0, SELLMEIER_COEFFICIENTS_CORE);
    n_2 = Sellmeier(lambda_0, SELLMEIER_COEFFICIENTS_CLAD);
    n_eff_1_prev = n_2 + step_size;
    n_eff_1_post = n_1 - step_size;
    while n_eff_1_post - n_eff_1_prev > 1E-9
        n_eff_1 = (n_eff_1_prev + n_eff_1_post)/2;
        [left, right] = core_lp_approx(lambda_0,r_1,n_1,n_2,n_eff_1);

        if (left - right < 0)
            n_eff_1_post = n_eff_1;
        elseif (left - right > 0)
            n_eff_1_prev = n_eff_1;
        end
    end
    n_eff_1 = (n_eff_1_prev + n_eff_1_post)/2;
end