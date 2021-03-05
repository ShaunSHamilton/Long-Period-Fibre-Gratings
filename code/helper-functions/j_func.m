function J_v = j_func(alpha, u_1,r_1)
    z = u_1*r_1;
    J_v = (J_der(alpha, z))/(u_1* J(alpha, z));
end

