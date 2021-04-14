function x_1 = x1(r_1,u_1,n_eff,zeta_0,n_1,r_2)
%X1 Power calculation in core

    Z_0 = 377;
    u1r1 = u_1*r_1;
    neff_n1 = (n_eff^2)/(n_1^2);
    neff_Z0 = n_eff/Z_0;

    a = (n_eff*Z_0*zeta_0^2)/(n_1^2);
    b = neff_Z0 - a;
    c = (1+neff_n1)*Im(zeta_0);
    d = J(1,u1r1);

    z1 = b + c;
    z2 = b - c;
    z3 = J(2,u1r1)^2 - (d*J(3,u_1*r_2));
    z4 = J(0,u1r1) + d;

    x_1 = ((pi*(r_1^2)*(u_1^2))/4)*(z1*z3 + z2*z4);
end

