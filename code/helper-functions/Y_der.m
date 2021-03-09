function x = Y_der(alpha, z)
%Y_DER Calculates the derivative of  the 2nd Kind Bessel Function
    syms c(x)
    c(x) = Y(alpha,x);
    d = diff(c,x);
    x = double(d(z));
end

