function [ P, H, V, D ] = stochastic_matrix( h, t, G )
%UNTITLED Summary of this function goes here
%   Pass in 3 paramaters:
%   h - 4 by 4 matrix defening the interaction of 2 qubits
%   t - 2 by 2 matrix defining the transformation to be applied to the
%       Hamiltonian of H
%   G - a graph defining the input of qbit system
%   b - beta: the temperature of the system (** TO BE ADDED LATER)

%   Output:
%   Dw - 
%   Vn - 


    B = get_binary_numbers(length(G.V));
    H = generate_hamiltonian(h, G);
    % still need to check the index value to compare
    T = tensor_with_identity(t, B, 1, 0);
    
    %obtain the eigenvalue and eigenvectors of the hamiltonian
    [V, D] = eig(H);
    
    P = conj((V.'))*T*V;
    
    
 
end

