function [ delta,  vi] = get_delta2( K, A )
%   function [ d,  deltas] = get_delta2( K, A )
%   returns the delta value and vector of eigenvalues (sorted)
%   INPUT
%   K - stochastic matrix
%   A - acceptance probability
%   OUTPUT
%   delta - the the delta difference value between the highest and second
%           highest eigenvalue
%   vi    - sorted eigenvalues 
 

        Z = K.*A;

        Zs = make_stoc(Z);
    
        vi = sort(eig(Zs), 1, 'descend');

        d = vi(1) - vi(2);

end

