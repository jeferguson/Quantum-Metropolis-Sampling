
%this is the hiesenbug matrix which will be referenced in the simulation

q = [-1 0 0 0; 0 0 -1 0; 0 -1 0 0; 0 0 0 -1];

G = Ring(3);

t = [0 1; 1 0];

[P, H, V, D] = stochastic_matrix(q, t, G);







% Question for later, which index do we use to compute the tensor product
% of a 2 by 2 matrix, the first one seems about right

%    for testing purposes
%    T = [0 1; 1 0];
%    B = get_binary_numbers(4);
%    transorm = tensor_with_identity(T, B, 1, 0)

