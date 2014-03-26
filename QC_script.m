
%this is the hiesenbug matrix which will be referenced in the simulation
q = [-1 0 0 0; 0 0 -1 0; 0 -1 0 0; 0 0 0 -1];
% the transform which we use to calculate the stochastic matrix
t = [0 1; 1 0];
%{
G = Ring(7);

[K, V, D, T, H] = stochastic_matrix(q, t, G);
     
beta = 1/5;
        
A = accept_prob(D, beta);
    
Z = K.*A;

Zs = make_stoc(Z);
    
dif = sort(eig(Zs), 1, 'descend');

%}

deltas = beta_n(q, t, 4, 12, 1);