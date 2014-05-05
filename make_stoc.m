function [ S, avg ] = make_stoc( M )
%function [ S, avg ] = make_stoc( M )
%   Makes an input Matrix M column stochastic
%   INPUT  : M - input matrix
%
%   OUTPUT : S - output column stochastic matrix
%            avg - output avg valued added to each diagonal


    S = M;
    cSum = sum(M);
    
    avg = 0;
    
    for i = 1: length(cSum)
        p = 1 - cSum(i);
        avg = avg + p;
        S(i,i) = M(i,i) + p;
    end
    
    avg = avg/length(cSum);

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

