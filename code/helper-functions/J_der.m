function x = J_der(alpha, z)
%Y_DER Calculates the derivative of the 1st kind Bessel Function
    syms a b
    c = J(a,b);
    d = diff(c);
    x = d(alpha, z);
end
