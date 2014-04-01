function [ deltas] = get_delta2(q, t, nl, nh, beta )
%function [ delta] = get_delta2(q, t, nl, nh, beta )
%   returns the delta value and vector of eigenvalues (sorted)
%   INPUT
%   K - stochastic matrix
%   A - acceptance probability
%   OUTPUT
%   delta - the the delta difference value between the highest and second
%           highest eigenvalue
%   vi    - sorted eigenvalues 
 

    deltas = zeros(nh - nl, 1);
    
    n = nl;
    index = 1;
    
    while  n <= nh
                
        deltas(index) = get_delta(q,t, Ring(n), beta);
        
        
        n = n + 1;
        
        %G = zeros(n, 2);
        
        index = index + 1;
      
    end

end

