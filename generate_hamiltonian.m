
function [Hamiltonian] = generate_hamiltonian(Q,G, r)
%function [Hamiltonian] = generate_hamiltonian(Q,G,r)
% 	get the matrix representing all binary numbers based on the number or vertices 
%   in the Graph
% INPUT: 	Q- a 4 by 4 matrix telling the interaction between 2 electrons,
%			G- graph with n vertices representing each electron and edges representing
%               each connection for every single edge in the graph 
%           r- subspace paramater, such that r specifies the number of ones
%               a binary string (the result would be a hamiltonian for a
%               subspace of the system.) If r == 0, then we calculate the
%               entire hamiltonian.
%   Idea:
%       calculate H for each edge using the tensor product
%       then sum up all the values so that we can get the hamiltonian and return it




dim = size(G.E);

edge_count = dim(1);
qubit_count = length(G.V);


% insert this portion to allow for the Hamiltonian of a subspace to be
% calculated
if(r > 0)
    B = binary_subspace(qubit_count, r);
    b_dim = size(B);

    Hamiltonian = zeros(b_dim(1), b_dim(1));

    for i =1 : edge_count
          Hij = tensor_with_identity(Q, B, G.E(i, 1), G.E(i, 2));
          Hamiltonian = Hamiltonian + Hij;
    end
else 
    B = get_binary_numbers(qubit_count);
    b_dim = size(B);

    Hamiltonian = zeros(b_dim(1), b_dim(1));

    for i =1 : edge_count
          Hij = tensor_with_identity(Q, B, G.E(i, 1), G.E(i, 2));
          Hamiltonian = Hamiltonian + Hij;
    end
end

%{
b_dim = size(B);

Hamiltonian = zeros(b_dim(1), b_dim(1));

for i =1 : edge_count
	  Hij = tensor_with_identity(Q, B, G.E(i, 1), G.E(i, 2));
      Hamiltonian = Hamiltonian + Hij;
end
%}


% want to ensure that this is correct and possibly use the kron(A,B), which
% is the tensor product of two matricies instead

%{
id = eye(2^(qubit_count - 2));
H = zeros(2^qubit_count, 2^qubit_count);

for i = 1: edge_count
    Hij = kron(id, Q);
    H = H + Hij;
end
%}

