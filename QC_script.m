
%this is the hiesenbug matrix which will be referenced in the simulation
q1 = [-1 0 0 0; 0 0 -1 0; 0 -1 0 0; 0 0 0 -1];


% going to try different values for beta
beta = 5;
g = 5;

q2 = [0 0 0 0; 0 g/2 1 0; 0 1 g/2 0; 0 0 0 0];

t = [0 1; 1 0];

deltas = getn_deltas(q2, t, 13,15, beta)


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



