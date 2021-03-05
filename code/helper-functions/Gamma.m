function complex_fac = Gamma(z)
%GAMMA Factorial function for complex numbers

    global sumprod_upper
    product = 1;
    for n = 1:sumprod_upper
        product = product*(((1+(1/n))^z)/(1+(z/n)));
    end
    complex_fac = (1/z)*product;
end
