function x = K_der(alpha, z)
%K_DER Calcualtes the derivative of the Modified 2nd kind Bessel Function
    syms c(x)
    c(x) = K(alpha,x);
    d = diff(c,x);
    x = double(d(z));
end

