function [ deltas ] = beta_n(q, t, nl, nh, y)
%   function [ deltas ] = beta_n(q, t, nl, nh, y)
%   beta_n is a function which outputs a vector of delta values, specifying
%   the distance between the first and second largest eigenvalue in the
%   corresponding stocastic eigenvector matrix to a hamiltonian system
%   INPUT
%   q   -  a 2 element quantum system (4x4 matrix)
%   t   -  2 by 2 transform matrix   
%   nl  -  the lower bound of n size for an element ring
%   nh  -  the upper bound of n size for an element ring
%   y   -  the delta value for which to change n va
%   OUTPUT: returns a vector of deltas for each n value 
%   
 

    % specifies the size of our delta vector output
    deltas = zeros( floor( (nh - nl)/y ), 1);
    
    n = nl;
    index = 1;
    
    while  n <= nh
                
        deltas(index) = get_delta(q,t, Ring(n), sqrt(n));
        
        
        n = n + y;
        
        %G = zeros(n, 2);
        
        index = index + 1;
      
    end


end

