
%this is the hiesenbug matrix which will be referenced in the simulation
q = [-1 0 0 0; 0 0 -1 0; 0 -1 0 0; 0 0 0 -1];

% creates a ring graph of size 5
G = Ring(3);

b = 1/5;

% the transform which we use to calculate the stochastic matrix
t = [0 1; 1 0];

[P, V, D, T, H] = stochastic_matrix(q, t, G);


%not needed right now
%A = accept_prob(D, b);
%W = state_prob(D, b);

