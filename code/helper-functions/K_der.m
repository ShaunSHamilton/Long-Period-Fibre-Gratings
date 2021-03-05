function x = K_der(alpha, z)
%K_DER Calcualtes the derivative of the Modified 2nd kind Bessel Function
    syms a b
    c = K(a,b);
    d = diff(c);
    x = d(alpha, z);
end

