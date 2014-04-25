function [ deltas] = getn_deltas(q, t, nl, nh, beta, r )
%function [ deltas] = getn_deltas(q, t, nl, nh, beta, r )
%   returns an array of deltas for a constant system temperature, and a
%       increasing quantum Ring of size n, which is computed itertively
%       from a lower bound (nl) to an upper bound (nh)
%   INPUT
%   q - 4x4 matrix defining a quantum system
%   t - 2x2 transform matrix
%   nl - lower bound for Ring of size n
%   nh - lower bound for Ring of size n
%   beta - 1/(system temperature)
%   r - a binary subspace paramater
%
%   OUTPUT
%   deltas - vector of deltas, which is the the the delta difference value 
%   between the highest and second  highest eigenvalue
 

    deltas = zeros(nh - nl, 1);
    
    n = nl;
    
    index = 1;
    
    while  n <= nh
                
        deltas(index) = get_delta(q,t, Ring(n), beta, r);
        
        
        n = n + 1;
        
        %G = zeros(n, 2);
        
        index = index + 1;
              
    end

end

