function [c,f,s]= TuringImmunoPDEfun (x, t, u, DuDx, P)
%% Extraction of parameters and PDE encoding for pdepe solver
%In this function we must translate the PDEs into something understandable by the solver (form c, f, s)

%We extract the parameters of our model:
alpha = P(1);
beta = P(2);
xi = P(3);
dI = P(4);
dV = P(5);
dX = P(6);

%Now we encode the PDEs in the mentioned vectorial form:
c = [1; 1; 1]; 
%Because here nothing multiplies the time derivatives: du1/dt, du2/dt and du3/dt
% f = [ - (dX*(u(1)*DuDx(2)))+ DuDx(1);dI*DuDx(2);dV*DuDx(3)]; It is an
% alternative way of encoding the equation, same result.
f = [1; dI; dV].* DuDx - [dX*u(1);0;0].*DuDx(2);
%Here we include the second spatial derivatives and chemotaxis
s = [xi-(((xi-1)*u(1)*u(3)))-u(1);alpha*((u(3)*u(1))-u(2)); beta*(u(2)-u(3))]; 
%We include the terms involving the variables without their spatial derivatives
end
