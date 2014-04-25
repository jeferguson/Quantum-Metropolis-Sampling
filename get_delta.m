function [ d, v ] = get_delta( q, t, G, beta, r )
%   function [ d , v] = get_delta( q, t, G, beta,r )
%   get_delta is a function which outputs a delta value which
%   specifies the distance from the highest energy eigenvalue to the
%   second highest eigenvalue of the quantum system
%   INPUT:
%       q - 4x4 matrix specifying a 2bit quantum system
%       t - transform 2x2 matrix
%       G - the input graph for the quantum system
%       r - an integer defining the binary paramater to take the
%           subspace of a subsiquent hamiltonian
%
%   OUTPUT:
%       d - the detelta value (see above)
%       v - the corresponding eigenvalues to calculate d (the delta
%               value)


        [K, V, D, T, H] = stochastic_matrix(q, t, G, r);
     
        A = accept_prob(D, beta);
    
        Z = K.*A;

        Zs = make_stoc(Z);
    
        v = sort(abs(eig(Zs)), 1, 'descend');

        d = v(1) - v(2);
        


end

