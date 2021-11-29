function objval = obj(x,par)
% obj.m
% Written on 2021.07.03 by Rance Lee and his group members
    objval = -t(x,par) * sum(x);
end