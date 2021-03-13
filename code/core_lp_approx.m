function [left, right] = core_lp_approx(lambda_0,r_1,n_1,n_2,n_eff_1)
%CORE_LP_APPROX Claculates the approximate core linearly polarised mode
    b = (n_eff_1^2 - n_2^2)/(n_1^2 - n_2^2);
    v = V(lambda_0, n_1, n_2, r_1);
    
    sqr_temp1 = sqrt(1-b);
    sqr_temp2 = sqrt(b);
    c = v * sqr_temp1;
    d = J(1, c);
    e = J(0, c);
    left = c * d / e;
    f = v * sqr_temp2;
    g = Y(1,f);
    h = Y(0,f);
    right = f * g / h;
end