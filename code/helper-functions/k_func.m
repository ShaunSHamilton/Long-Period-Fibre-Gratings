function K_v = k_func(alpha,w_3,r_2)
    z = w_3.*r_2;
    K_v = (Y_der(alpha, z))./(w_3.*Y(alpha, z));
end

