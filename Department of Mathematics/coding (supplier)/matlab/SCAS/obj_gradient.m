function g = obj_gradient(x,par)
% obj_gradient.m
% Written on 2021.07.03 by Rance Lee and his group members
    g = -t_gradient(x,par) * sum(x) - t(x,par) * ones(1,length(x));
end