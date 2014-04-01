function [ d, v ] = get_delta( q, t, G, beta )
%   function [ d , diff] = get_delta( q, t, G, beta )
%   get_delta is a function which outputs a delta value which
%   specifies the distance from the highest energy eigenvalue to the
%   second highest eigenvalue of the quantum system
%   INPUT:
%       q - 4x4 matrix specifying a 2bit quantum system
%       t - transform 2x2 matrix
%       G - the input graph for the quantum system
%
%   OUTPUT:
%       d - the detelta value (see above)
%       v - the corresponding eigenvalues to calculate d (the delta
%               value)


        [K, V, D, T, H] = stochastic_matrix(q, t, G);
     
        A = accept_prob(D, beta);
    
        Z = K.*A;

        Zs = make_stoc(Z);
    
        v = sort(eig(Zs), 1, 'descend');

        d = v(1) - v(2);
        


end
