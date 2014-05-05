function [ K, V, D, T, H] = stochastic_matrix( q, t, G, r )
%UNTITLED Summary of this function goes here
% function [ K, V, D, T, H] = stochastic_matrix( q, t, G,r )
%   Pass in 3 paramaters:
%   h - 4 by 4 matrix defening the interaction of 2 qubits
%   t - 2 by 2 matrix defining the transformation to be applied to the
%       Hamiltonian of H
%   G - a graph defining the input of qbit system
%   r - a paramater defining the subspace requirements

%   Output:
%   K - a stochasitc matrix 
%   V - the matrix with the eigenvectors of the hamiltonian for the system
%   D - a diagonal matrix with the eigenvalues for the generated
%   hamiltonain
%   T - the product of the transform matrix tensored with the identity
%   H - the Hamiltonian for the system

    %geneartates the hamiltonian for a defined qubit system
    H = generate_hamiltonian(q, G, r);


    %generates a matrix of binary numbers
    if( r > 0 )
        
        
        
        % possibly change this back later!
        % this is no longer doing a random bit flip, but only the first bit
        %B = binary_subspace(length(G.V), r);
        %T = tensor_with_identity(t, B, 1, 0)
        
        nk2 = ceil(nchoosek(length(G.V), r)/2);
        T = kron(eye(nk2), t);
        
        % to correct for error of size in T
        % this will remove the last row and last column in T, so that it
        % should now have the 
        h_dims = size(H);
        t_dims = size(T);
        while(t_dims(1) > h_dims(1))
            T(t_dims(1),:) = [];
            T(:, t_dims(1)) = [];
            if(size(T) ~= size(H))
                err = MException('ResultChk:OutOfRange', 'Dimmensions of T and H do not match');
                throw(err);
            end
            
            t_dims = size(T);
            
        end
        
        %obtain the eigenvalue and eigenvectors of the hamiltonian
        [V, D] = eig(H);
        P = V'*(T*V);
        % now calculate the stochasitic matrix
        K = P.*conj(P);
  
        
        
    else
        B = get_binary_numbers(length(G.V));
        
        
        T = tensor_with_identity(t, B, 1, 0);
        %obtain the eigenvalue and eigenvectors of the hamiltonian
        % then calculate the stochasitic matrix

        [V, D] = eig(H);
        P = V'*(T*V);
        K = P.*conj(P);
  
    end
    % still need to check the index value to compare
    
    
    
    % T = tensor_with_identity(t, B, 1, 0)
    % NOTE: we can also compare the product of this with the 
    % Kronecker tensor product, which has the matlab function of kron(A,B)
    % which give the same result
    
    
    %obtain the eigenvalue and eigenvectors of the hamiltonian
    % [V, D] = eig(H);
    
    
    % P = V'*(T*V);
    % now calculate the stochasitic matrix
    % K = P.*conj(P);
      
 
end

