function g = t_gradient(x,par)
% t_gradient.m
% Written on 2021.07.03 by Rance Lee and his group members
    tB = sum((par.z + par.c) .* x);
    tA = sum(par.A + par.S);
    tC = 1/2 * sum((par.hb / par.D + par.h ./ par.P) .* (x .^ 2)) - 1;
    tBg = par.z + par.c;
    tCg = (par.hb / par.D + par.h ./ par.P) .* x;
    g = (-tBg + 1/2 * (2 * tB * tBg - 4 * tA * tCg) / sqrt(tB ^ 2 - 4 * tA * tC)) / (2 * tA);
end