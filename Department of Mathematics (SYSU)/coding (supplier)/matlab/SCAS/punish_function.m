function L = punish_function(x,par,sigma0)
% punish_function.m
% Written on 2021.07.03 by Rance Lee and his group members
    L = obj(x,par);
    for i = 1:size(par.Cmat,1)
        L = L + sigma0 * max(par.Cmat(i,:) * x', 0)^2;
    end
end