function x = J(alpha, z)
%J Calculates the 1st Kind Bessel Function
%     global sumprod_upper
%     summation = 0;
%     for k = 0:sumprod_upper
%         summation = summation + ((((-z^2)/4)^k)/(factorial(k) * Gamma(alpha + k + 1)));
%     end
%     x = ((z/2)^alpha)*summation;
    x = besselj(alpha, z);
end