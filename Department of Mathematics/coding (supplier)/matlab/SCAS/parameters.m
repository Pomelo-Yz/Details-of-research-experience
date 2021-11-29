classdef parameters 
% parameters.m using to construct the class of parameters
% Written on 2021.07.03 by Rance Lee and his group members
    properties   
        A 
        S 
        c 
        P 
        D 
        hb 
        h 
        z 
        Cmat
    end
    methods
        function obj = parameters(A,S,c,P,D,hb,h,z,Cmat)
            obj.A = A;
            obj.S = S;
            obj.c = c;
            obj.P = P;
            obj.D = D;
            obj.hb = hb;
            obj.h = h;
            obj.z = z;
            obj.Cmat = Cmat;
        end
    end
end