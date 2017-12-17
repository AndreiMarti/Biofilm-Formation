function u0 = TuringImmunoChemICfun (x,P)
%% Specification of the initial conditions for the 3 species
u0 = [1;1.025;1]; 
%The initial concentrations of our 3 species must be around the endemic steady state (1,1,1), as only in its surrounding 
%Turing Patterns might emerge
end