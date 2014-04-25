function [ deltas ] = get_bdelta(  q, t, G, betas )
%   function [ deltas ] = get_bdelta(  q, t, G, betas )
%   get_bdelta %%% CHANGE AND UPDATE
%   
%   This function is a faster method of obtaining multiple delta values for
%   different temperatures, given the same graph G
%   INPUT:
%       q - 4x4 matrix specifying a 2bit quantum system
%       t - transform 2x2 matrix
%       G - the input graph for the quantum system
%       betas - a vector of beta values to test out
%
%   OUTPUT:
%       d - the detelta value (see above)
%       v - the corresponding eigenvalues to calculate d (the delta
%               value)

        deltas = zeros(length(betas), 1);


        [K, V, D, T, H] = stochastic_matrix(q, t, G, 0);
        
        for i = 1 : length(betas)
     
            A = accept_prob(D, betas(i));
    
            Z = K.*A;

            Zs = make_stoc(Z);
    
            v = sort(abs(eig(Zs)), 1, 'descend');

            d = v(1) - v(2);
            
            deltas(i) = d;
        
        end


end

