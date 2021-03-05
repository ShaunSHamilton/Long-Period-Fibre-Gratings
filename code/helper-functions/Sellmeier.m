function n = Sellmeier(lambda, coefficients)
%SELLMEIER Returns the relative effective refractive index based on Ge
%doped fibres
    coeff_cell = num2cell(coefficients);
    [B_1, B_2, B_3, C_1, C_2, C_3] = coeff_cell{:};
    n = (1 + ((B_1*lambda^2)/(lambda^2 - C_1)) + ((B_2*lambda^2)/(lambda^2 - C_2)) + ((B_3*lambda^2)/(lambda^2 - C_3)))^(1/2);
end