function [ S ] = make_stoc( M )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
%function [ S ] = make_stoc( M )


    S = M;
    cSum = sum(M);
    
    for i = 1: length(cSum)
        p = 1 - cSum(i);
        S(i,i) = M(i,i) + p;
    end
    


    %{
    dims = size(M);
    for  i=1: dims(2)
        sum = 0;
        for j = 1:dims(1)
            sum = sum + M(i,j);
        end
        M(i, i) = M(i,i) + (1.0-sum);
    end

    %}
    

end

