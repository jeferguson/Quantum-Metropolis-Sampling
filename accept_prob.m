function [ A ] = accept_prob( E, b )
%UNTITLED2 Summary of this function goes here
%function [ A ] = accept_prob( E, b )
%   E: diagonal matrix of eigenvalues
%   b: beta, the inverse tempurature of the system

%   output: matrix A of which whose horizontal values are probabilities of
%   transitioning from a state to another

    l = length(E);
    A = zeros(l, l);

    for i = 1:l
       ei = E(i, i);
       for j = 1: l
           ej = E(j, j);
           A(i,j) = min(1, exp(-b*(ej - ei)) );
       end   
    end
    
    

end

