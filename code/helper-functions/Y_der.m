function x = Y_der(alpha, z)
%Y_DER Calculates the derivative of  the 2nd Kind Bessel Function
    syms a b
    c = Y(a,b);
    d = diff(c);
    x = d(alpha, z);
end

