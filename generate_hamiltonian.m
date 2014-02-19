

% this function will generate the end result hamiltonian
% INPUT: 	a 4 by 4 matrix telling the interaction between 2 electrons, n - 
%			and a graph G with vertices representing each electron and edges representing each connection

function Hamiltonian = generate_hamiltonian(Q,G)

% 	get the matrix representing all binary numbers based on the number or vertices in the Graph

%for every single edge in the graph (bidirection, we do NOT want to traverse everything twice)
%	calculate H for each edge using the tensor product
%	then sum up all the values so that we can get the hamiltonian and return it




dim = size(G.E);

edge_count = dim(1);
qubit_count = length(G.V);


B = get_binary_numbers(qubit_count);

Hamiltonian = zeros(2^qubit_count, 2^qubit_count);

for i =1 : edge_count
	  Hij = tensor_with_identity(Q, B, G.E(i, 1), G.E(i, 2));
      Hamiltonian = Hamiltonian + Hij;
end

