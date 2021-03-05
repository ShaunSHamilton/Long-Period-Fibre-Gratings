function K_v = k_func(alpha,r_2,w_3)
    z = w_3*r_2;
    K_v = (Y_der(alpha, z))/(w*Y(alpha, z));
end

