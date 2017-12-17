function TuringImmuno
clear all;
close all;

%% Parameter input, non-dimensionalization and insertion into a vector

%Parameter values:

tmax = 0.25; %Scaled time
X = 130 %mm^3/cell*day (effective chemotaxis term).
N = 480; %virions/cell*day
delta = 0.5; %/day
c = 3; %/day
h = 0.1; %mm. We solve the PDE in a thin rectangular sheet of thickness h
%k1= k*h^(3-d) and s1= s*h^(3-d), being d = #spatial dimensions (d=1)
k = 3.43*10^(-2); %mm3/virion*day
s = 10; %cells/mm^3*day
k1 = k/(h^2);
s1 = s*(h^2);
mu = 0.03; %/day
DT = 0.09504; %mm^2/day
DI = 0.09504; %mm^2/day
DV= 0.00076032; %mm^2/day
Tc = 1/mu; %days. It gives 33.3 days
L = DT/mu; %mm. It gives 1.78 mm

%Non-dimensionalization of parameters for model simplification:

xi = (s1*k1*N)/(c*delta*mu)
dI = DI/DT;
dV = DV/DT;
dX = ((s1*X)/(delta*DT))*(1-(1/xi))
alpha = delta/mu;
beta = c/mu;

%Creation of a parameter vector:

P(1) = alpha;
P(2) = beta;
P(3) = xi;
P(4) = dI;
P(5) = dV;
P(6) = dX;

%% Test for Turing conditions given the parameters

%Meeting Turing conditions (if not we will make the program break):

if (s1*k1*N >= c*delta*mu && xi > 1)
    disp('Turing Conditions are met: infected steady state exists')
else
    return
end

%% Curvature of the problem, tspan and xmesh

m = 0; %Defines the curvature of the problem for the PDE solver
t = linspace(0,tmax,100); %timeseries
x = linspace(0,L,100); %xmesh

%% Call to the PDE solver and solutions for the three species

sol = pdepe (m, @TuringImmunoPDEfun, @TuringImmunoICfun, @TuringImmunoBCfun, x, t,[],P);

%The solution includes 3 colums: xmesh, time and varibles:

u1 = sol (:,:,1);
u2 = sol (:,:,2);
u3 = sol (:,:,3);

%% Plots of the surfaces for the 3 species and their time series

%Plots of a surface evaluating the time response of the 3 species:
 
% figure(1) 
% subplot(3,2,1) %Surface for u1 in 3D 
% surf(x,t,u1,'edgecolor','none');
% xlabel('Distance x','fontsize',14,'fontweight','normal','fontname','arial')
% ylabel('Time t','fontsize',14,'fontweight','normal','fontname','arial')
% zlabel('Species u1','fontsize',14,'fontweight','normal','fontname','arial')
% axis([0 L 0 tmax 0 max(max(u1))])%We set the axis for x, t and u1, respectively
% set(gcf(), 'Renderer', 'painters')
% set(gca,'FontSize',13,'fontweight','b','fontname','arial')
% 
% subplot(3,2,2) %Surface for u1 in a 2D view
% surf(x,t,u1,'edgecolor','none');
% xlabel('Distance x','fontsize',14,'fontweight','normal','fontname','arial')
% ylabel('Time t','fontsize',14,'fontweight','normal','fontname','arial')
% zlabel('Species u1','fontsize',14,'fontweight','normal','fontname','arial')
% axis([0 L 0 tmax 0 max(max(u1))])%We set the axis for x, t and u1, respectively
% set(gcf(), 'Renderer', 'painters')
% set(gca,'FontSize',13,'fontweight','b','fontname','arial')
% view(2); 
% 
% subplot(3,2,3)
% surf(x,t,u2,'edgecolor','none');
% xlabel('Distance x','fontsize',14,'fontweight','normal','fontname','arial')
% ylabel('Time t','fontsize',14,'fontweight','normal','fontname','arial')
% zlabel('Species u2','fontsize',14,'fontweight','normal','fontname','arial')
% axis([0 L 0 tmax 0 max(max(u2))])
% set(gcf(), 'Renderer', 'painters')
% set(gca,'FontSize',13,'fontweight','b','fontname','arial')
% 
% subplot(3,2,4)
% surf(x,t,u2,'edgecolor','none');
% xlabel('Distance x','fontsize',14,'fontweight','normal','fontname','arial')
% ylabel('Time t','fontsize',14,'fontweight','normal','fontname','arial')
% zlabel('Species u2','fontsize',14,'fontweight','normal','fontname','arial')
% axis([0 L 0 tmax 0 max(max(u2))])
% set(gcf(), 'Renderer', 'painters')
% set(gca,'FontSize',13,'fontweight','b','fontname','arial')
% view(2);
% 
% subplot(3,2,5)
% surf(x,t,u3,'edgecolor','none');
% xlabel('Distance x','fontsize',14,'fontweight','normal','fontname','arial')
% ylabel('Time t','fontsize',14,'fontweight','normal','fontname','arial')
% zlabel('Species u1','fontsize',14,'fontweight','normal','fontname','arial')
% axis([0 L 0 tmax 0 max(max(u3))])
% set(gcf(), 'Renderer', 'painters')
% set(gca,'FontSize',13,'fontweight','b','fontname','arial')
% 
% subplot(3,2,6)
% surf(x,t,u3,'edgecolor','none');
% xlabel('Distance x','fontsize',14,'fontweight','normal','fontname','arial')
% ylabel('Time t','fontsize',14,'fontweight','normal','fontname','arial')
% zlabel('Species u1','fontsize',14,'fontweight','normal','fontname','arial')
% axis([0 L 0 tmax 0 max(max(u3))])
% set(gcf(), 'Renderer', 'painters')
% set(gca,'FontSize',13,'fontweight','b','fontname','arial')
% view(2);

%Plots of the time series for u1, u2 and u3 (detecting oscillations):
plot((x/L),u1,'r');
hold on
plot((x/L),u2,'b');
xlabel ('X (normalized distance)');
ylabel ('u1,u2 (normalized concentrations)')


end
