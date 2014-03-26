
%this is the hiesenbug matrix which will be referenced in the simulation
q = [-1 0 0 0; 0 0 -1 0; 0 -1 0 0; 0 0 0 -1];
%G = Ring(4);
% the transform which we use to calculate the stochastic matrix
t = [0 1; 1 0];
%[K, V, D, T, H] = stochastic_matrix(q, t, G);



deltas = beta_n(q, t, 4, 8, 1);