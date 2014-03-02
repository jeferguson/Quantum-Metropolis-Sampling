function [ S ] = make_stoc( M )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    dims = size(M);

    
    for  i=1: dims(2)
        sum = 0;
        for j = 1:dims(1)
            sum = sum + M(i,j);
        end
        M(i, i) = M(i,i) + (1.0-sum);
    end
    
    S = M;
    
end

