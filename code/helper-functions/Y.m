function x = Y(alpha, z)
%Y Calcualtes the 2nd Kind Bessel Function
%     x = (J(alpha, z)*cos(alpha*pi)-J(-alpha, z))/sin(alpha*pi);
    x = bessely(alpha, z);
end