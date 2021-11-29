function val = fitness(y)
    if(sum(y) > 6)
        val = 0;
        return
    end
    D = 200000;
    hb = 2.6;
    % N = 6;
    A = [40, 19, 25, 39, 27, 33, 30, 23, 20, 34];
    A = A .* y;
    A(A==0) = [];
    S = [43, 39, 42, 30, 38, 42, 40, 39, 38, 32];
    S = S .* y;
    S(S==0) = [];
    c = [9.0, 9.1, 8.7, 10.5, 9.5, 8.9, 8.7, 10.4, 9.0, 10.5];
    c = c .* y;
    c(c==0) = [];
    h = [2.29, 1.96, 2.74, 0.54, 1.50, 1.25, 2.00, 2.09, 1.90, 1.71];
    h = h .* y;
    h(h==0) = [];
    z = [4.04, 6.48, 7.17, 5.87, 6.30, 4.85, 5.08, 7.00, 6.00, 5.25];
    z = z .* y;
    z(z==0) = [];
    P = [42000, 34000, 36500, 63000, 45500, 64000, 41500, 36000, 66500, 61000];
    P = P .* y;
    P(P==0) = [];
    y(y==0) = [];
    Cmat = eye(length(y)) - repmat(P',1,length(y))/D;
    Cmat = [Cmat; -eye(length(y))];
    par = parameters(A,S,c,P,D,hb,h,z,Cmat);
    
    x0 = P / D;
    if(sum(x0) < 0.9)
        val = 0;
        return
    end
    % xbest = [4.68228422, 7.13490929, 4.62654274, 5.85285528, 0.00319958];
    sigma0 = 0.01;
    eta = 1e-9;
    rho = 2;
    gra_step_length = 100;
    pu_iter_MIN = 25;
    pu_iter_MAX = 1000;
    gra_iter_MAX = 10000;
    xfinal = min_punish_function(x0, par, sigma0, eta, rho, gra_step_length,pu_iter_MIN, pu_iter_MAX, gra_iter_MAX);
    val = obj(xfinal,par);
end
