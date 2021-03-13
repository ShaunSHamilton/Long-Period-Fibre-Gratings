function q = q(alpha, z_1, z_2)
    % z_1 = u_2*r;
    % z_2 = u_2*r_1;
    q = J(alpha, z_1).*K_der(alpha, z_2) - J_der(alpha, z_2).*K(alpha, z_1);
end

