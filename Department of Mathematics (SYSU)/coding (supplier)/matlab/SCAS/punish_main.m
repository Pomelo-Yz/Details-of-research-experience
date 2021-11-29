clc
clear all
D = 200000;
hb = 2.6;
% N = 6;
% A = [40, 19, 25, 39, 27, 33, 30, 23, 20, 34];
A = [40, 33, 30, 20];
% S = [43, 39, 42, 30, 38, 42, 40, 39, 38, 32];
S = [43, 42, 40, 38];
% c = [9.0, 9.1, 8.7, 10.5, 9.5, 8.9, 8.7, 10.4, 9.0, 10.5];
c = [9.0, 8.9, 8.7, 9.0];
% h = [2.29, 1.96, 2.74, 0.54, 1.50, 1.25, 2.00, 2.09, 1.90, 1.71];
h = [2.29, 1.25, 2.00, 1.90];
% z = [4.04, 6.48, 7.17, 5.87, 6.30, 4.85, 5.08, 7.00, 6.00, 5.25];
z = [4.04, 4.85, 5.08, 6.00];
% P = [42000, 34000, 36500, 63000, 45500, 64000, 41500, 36000, 66500, 61000];
P = [42000, 64000, 41500, 66500];
Cmat = eye(4) - repmat(P',1,4)/D;
Cmat = [Cmat; -eye(4)];
par = parameters(A,S,c,P,D,hb,h,z,Cmat);

%
x0 = P / D;
xbest = [4.68228422, 7.13490929, 4.62654274, 5.85285528, 0.00319958];
sigma0 = 0.01;
eta = 1e-9;
rho = 2;
gra_step_length = 100;
pu_iter_MIN = 25;
pu_iter_MAX = 1000;
gra_iter_MAX = 10000;
xfinal = min_punish_function(x0, par, sigma0, eta, rho, gra_step_length, pu_iter_MIN, pu_iter_MAX, gra_iter_MAX);


%%
fprintf('------------------------final result--------------------------\n');
x_text_len = length(xfinal);
x_text = ',%.10f';
x_text = repmat(x_text,1,x_text_len);
fprintf(['xfinal = ', x_text(2:end),'\n'], xfinal);
fprintf('obj = %.10f\n', obj(xfinal,par));
con_text_len = size(par.Cmat,1);
con_text = ',%.10f';
con_text = repmat(con_text,1,con_text_len);
fprintf(['constraint = ', con_text(2:end), '\n'], max(par.Cmat * xfinal',0));
















