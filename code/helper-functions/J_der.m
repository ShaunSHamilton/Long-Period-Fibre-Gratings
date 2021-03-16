function x = J_der(alpha, z)
%Y_DER Calculates the derivative of the 1st kind Bessel Function
    syms c(x)
    c(x) = J(alpha,x);
    d = diff(c, x);
    x = double(d(z));
%     x = 0.5*(J(alpha-1,z)-J(alpha+1,z));
end
