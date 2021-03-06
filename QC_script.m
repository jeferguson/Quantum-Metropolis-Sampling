
%this is the hiesenbug matrix which will be referenced in the simulation
q1 = [-1 0 0 0; 0 0 -1 0; 0 -1 0 0; 0 0 0 -1];


% going to try different values for beta
% beta = 1 is very reasonable
%beta = 1/3;

% try for smaller values of g
% if g becomes to big then the delta values become 0
g = 0.5;

% hxx matrix
q2 = [0 0 0 0; 0 g/2 1 0; 0 1 g/2 0; 0 0 0 g];

% bit flip transform matrix
t = [0 1; 1 0];

betas = [1/256 1/128 1/64 1/32 1/16 1/8 1/4 1/2 1 2 4 8 16 32 64 128 256];


% 5/19/2014
% this will get the delta values for a quantum ring of sizes 25 to 35, with
% beta = 0.5, and a binary subspace of 3-bits.  
d = getn_deltas(q2, t, 25, 35, 0.5, 3)

% 5/19/2014
% this will plot the inverse of the delta values (1/delta) 
plotdelta(d)










% ***************************************
% ALL OLD SCRIPTS I USED FOR TESTING BELOW
% ***************************************

% the transform which we use to calculate the stochastic matrix
%{
G = Ring(7);

[K, V, D, T, H] = stochastic_matrix(q, t, G);
     
beta = 1/5;
        
A = accept_prob(D, beta);
    
Z = K.*A;

Zs = make_stoc(Z);
    
dif = sort(eig(Zs), 1, 'descend');

%}

%deltas = beta_n(q, t, 3, 3, 1);

%save('qcfile.mat','deltas');



