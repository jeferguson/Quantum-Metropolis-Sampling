
%this is the hiesenbug matrix which will be referenced in the simulation

Q = [-1 0 0 0; 0 0 -1 0; 0 -1 0 0; 0 0 0 -1];

%properties of the graph 
V = [1, 2, 3, 4, 5];
E = [1, 2; 2, 3; 3, 4; 4, 5; 5, 1];
% a circular graph
% G = Graph(V, E);

G = Ring(5);

t = [0 1; 1 0];

% we will want to pass in B now as well
B = get_binary_numbers(length(G.V));



H = generate_hamiltonian(Q, G);

% transform expansion by tensoring with the identity matrix
T = tensor_with_identity(t, B, 1, 0);


% get the eigenvalues in a diagonal matrix D and the eigenvectors in a
% Matrix V
[V, D] = eig(H);









% Question for later, which index do we use to compute the tensor product
% of a 2 by 2 matrix, the first one seems about right

%    for testing purposes
%    T = [0 1; 1 0];
%    B = get_binary_numbers(4);
%    transorm = tensor_with_identity(T, B, 1, 0)

