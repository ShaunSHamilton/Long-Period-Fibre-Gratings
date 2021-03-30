function [zeta_0, zeta_0_prime] = cladding_mode(lambda, r_1, r_2, n_eff, sell_core, sell_clad)
%CLADDING_MODE Calculates the cladding mode dispersion relation

    Z_0 = 377; % Electromagnetic Impedance in Vacuum
    n_1 = Sellmeier(lambda, sell_core);
    n_2 = Sellmeier(lambda, sell_clad);
    n_3 = 1;
    I = 250;
    alpha = 1;
    lambda = lambda*power(10,-6);
    u_1 = u(lambda, n_1, n_eff);
    u_2 = u(lambda, n_2, n_eff);
    z_1 = u_2*r_2;
    z_2 = u_2*r_1;
    w_3 = w(lambda, n_3, n_eff);

    u_21 = (1./(u_2.^2)) - (1./(u_1.^2));
    u_32 = (1./(w_3.^2)) + (1./(u_2.^2));

    sigma_1 = I*alpha.*n_eff./Z_0;
    sigma_2 = I*alpha.*n_eff.*Z_0;

    % REPEATED CALCULATIONS ------------
    J_v = j_func(alpha,u_1,r_1);
    K_v = k_func(alpha,w_3,r_2);

    P_l = p(alpha, z_1, z_2);
    Q_l = q(alpha, z_1, z_2);
    R_l = R(alpha,z_1,z_2);
    S_l = s(alpha, z_1, z_2);

    J_K = J_v.*K_v;
    sigma_u = sigma_1.*sigma_2.*u_21.*u_32;
    r_12 = r_1*r_2;
    K_Q = K_v.*Q_l;
    J_R = J_v.*R_l;
    n2_s = n_2^2;
    n1_s = n_1^2;
    % ---------------------------------

%     zeta_0 = (1./sigma_2)*((u_2.*(J_K + (sigma_u)./(n2_2 * r_12))...
%     .*P_l - K_Q + J_R - (1./u_2).*S_l)...
%     /(-u_2.*(J_v.*(u_32./(n2_2 * r_2)) - K_v.*(u_21./(n1_2 * r_1))).*P_l...
%      + Q_l.*(u_32./(n1_2 * r_2)) + R_l.*(u_21./(n1_2 * r_1))));
% 
%     % REPEATED CALCULATIONS ------------
%     u32_r2 = u_32./r_2;
%     n3_2 = n_3^2;
%     % ----------------------------------
% 
%     zeta_0_prime = (sigma_1).*((u_2.*(J_v.*u32_r2 - K_v.*((n3_2 .* u_21)./(n2_2 * r_1)))...
%     .*P_l + Q_l.*(u32_r2) + R_l.*(u_21./r_1))...
%     ./(u_2.*(J_K.*(n3_2/n2_2) + sigma_u./(n1_2*r_12))...
%     .*P_l - K_Q.*(n3_2/n1_2) + J_R - S_l.*(n2_2./(n1_2.*u_2))));
    zeta_0_num = ((u_2.*P_l.*(J_K + (sigma_u)./(n2_s * r_12))...
        - K_Q + J_R - (1./u_2).*S_l));
    zeta_0_den = (-u_2.*P_l.*(J_v.*(u_32./(n2_s * r_2)) - K_v.*(u_21./(n1_s * r_1)))...
        + Q_l.*(u_32./(n1_s * r_2)) + R_l.*(u_21./(n1_s * r_1)));
    zeta_0 = (1./sigma_2).*(zeta_0_num./zeta_0_den);
    
    % REPEATED CALCULATIONS ------------
    u32_r2 = u_32./r_2;
    u21_r1 = u_21./r_1;
    n3_s = n_3^2;
    n3s_n2s = n3_s/n2_s;
    % ----------------------------------

%     zeta_0_prime = (sigma_1).*((u_2.*(J_v.*u32_r2 - K_v.*((n3_2 .* u_21)./(n2_2 * r_1)))...
%     .*P_l + Q_l.*(u32_r2) + R_l.*(u_21./r_1))...
%     ./(u_2.*(J_K.*(n3_2/n2_2) + sigma_u./(n1_2*r_12))...
%     .*P_l - K_Q.*(n3_2/n1_2) + J_R - S_l.*(n2_2./(n1_2.*u_2))));

    zeta_0_prime_num = ((u_2.*P_l.*(J_v.*u32_r2 - K_v.*(n3s_n2s.*u21_r1))...
        + Q_l.*(u32_r2) + R_l.*u21_r1));
    zeta_0_prime_den = (u_2.*P_l.*(J_K.*n3s_n2s + sigma_u./(n1_s*r_12))...
        - K_Q.*(n3_s/n1_s) + J_R - S_l.*(n2_s./(n1_s.*u_2)));
    zeta_0_prime = (sigma_1).*(zeta_0_prime_num./zeta_0_prime_den);

end