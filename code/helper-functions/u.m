function u = u(lambda, n, n_eff)
    u = (2*pi/lambda)*sqrt(n.^2 - n_eff.^2);
end