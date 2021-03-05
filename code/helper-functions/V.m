function normalised_freq = V(lambda, n_1, n_2, r_1)
%V Calculates the normalised frequency of a given wavelength
    normalised_freq = (2*pi/lambda)*r_1*(n_1^2 - n_2^2)^(1/2);
end