function [ t] = convergence( K)
% takes an input: of a stocastic matrix K, 
%                   an integer value a
% which together denote that the initial K is a matrix of K^a
% when trying to compute the convergence rate of this K matrix so that each
% entry is the same (or close to having the same probability) in each entry
%   Returns:
%       t1 - upper bound for convergence


% equal probability value
p = 1/length(K);
% the intial t value
t = 1;
% boolean value to denote whether K^t has converged yet
bool = 0;
% the precicion value to compare which to compare entries of the K matrix
precision = 0.0001;

t = 1;
Ki = K;

while(bool == 0)
    bool = 1;
    i = 1;
    while (bool == 1 && i <= numel(K))
         if (abs(Ki(i) - p) > precision)
             bool = 0;
         elseif (abs(Ki(i) > precision)
             bool = 0;
         else 
             i = i + 1;
         end
    
    end
    
    if(bool == 0)
        t = t+t;
        Ki = Ki^2;
    end
end



end



