function [pl,ql,pr,qr] = TuringImmunoChemBCfun (xl,ul,xr,ur,t,P)
%% Specification of the boundary conditions
%The problem specifies no flux BC at both sides of the domain:
 pl = [0;0;0];
 ql = [1;1;1];
 pr = [0;0;0];
 qr = [1;1;1];
