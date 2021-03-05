function r = R(alpha, z_1, z_2)
    % z_1 = u_2*r;
    % z_2 = u_2*r_1;
    r = J_der(alpha, z_1)*K(alpha, z_2) - J(alpha, z_2)*K_der(alpha, z_1);
end

