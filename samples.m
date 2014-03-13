

q = [-1 0 0 0; 0 0 -1 0; 0 -1 0 0; 0 0 0 -1];

% for higher temperaturs - 5 beta values (1/temperatures)
b1 = [.025 .01 0.001 0.0001];
% for low temperature values 
b2 = [50 100 250 500];


% transform matrix
t = [0 1; 1 0];

G1 = Grid(2,3);
G2 = Ring(4);



[K1, V1, D1, T1, H1] = stochastic_matrix(q, t, G1);
 
[K2, V2, D2, T2, H2]= stochastic_matrix(q, t, G2);


