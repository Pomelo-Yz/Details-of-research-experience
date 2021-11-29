function g = punish_function_gradient(x,par,sigma0)
% punish_function_gradient.m
% Written on 2021.07.03 by Rance Lee and his group members
    g1 = obj_gradient(x,par);
    %fprintf('g1 = %.10f,%.10f,%.10f,%.10f \n',g1(1),g1(2),g1(3),g1(4));
%    g2 = 2 * Cgradient(x) * C(x);
%    fprintf('g2 = %.10f,%.10f,%.10f,%.10f,%.10f \n',g2(1),g2(2),g2(3),g2(4),g2(5));
    g3 = 0;
    for i = 1:size(par.Cmat,1)
        g3 = g3 + 2 * max(par.Cmat(i,:) * x',0) * par.Cmat(i,:);
    end
    %fprintf('g3 = %.10f,%.10f,%.10f,%.10f \n',g3(1),g3(2),g3(3),g3(4));
    g = g1 + sigma0 * g3;
end