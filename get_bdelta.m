function [ deltas, avgs, avdiag ] = get_bdelta(  q, t, G, betas )
%   function [ deltas, avgs, avdiag ] = get_bdelta(  q, t, G, betas )
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
        
        avgs = zeros(length(betas), 1);
        
        avdiag = zeros(length(betas), 1);


        [K, V, D, T, H] = stochastic_matrix(q, t, G, 0);
        
        for i = 1 : length(betas)
     
            A = accept_prob(D, betas(i));
    
            Z = K.*A;

            [Zs, avg] = make_stoc(Z);
            
            
            dsum = 0;
            for j = 1: length(Zs)
                dsum = dsum + Zs(j, j);
            end
            
            avdiag(i) = dsum/(length(Zs));
            
            Zs = (0.5)* Zs + (0.5)*eye(size(Zs));
    
            v = sort(abs(eig(Zs)), 1, 'descend');

            d = v(1) - v(2);
            
            deltas(i) = d;
            
            avgs(i) = avg/2 + 0.5;
        
        end


end

