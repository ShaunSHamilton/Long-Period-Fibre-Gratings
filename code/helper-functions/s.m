function s = s(alpha, z_1, z_2)
    % z_1 = u_2*r;
    % z_2 = u_2*r_1;
    s = J_der(alpha, z_1)*K_der(alpha, z_2) - J_der(alpha, z_2)*K_der(alpha, z_1);
end

