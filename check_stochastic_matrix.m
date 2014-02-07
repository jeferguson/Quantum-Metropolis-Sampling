function [ S, b ] = check_stochastic_matrix( M, r )
% is_stochasitc_matrix takes in a Matrix M, and a boolean value r denoting 
% whether we wish to check that M is a right_stochastic matrix, or a left
% stochastic matrix.
%
%   INPUT: matrix M, and boolean value r denoting whether checking
%   left/right valued matrix (r == 1) check right, (r == ) check left

%   OUTPUT: a vector S of the summed values of the stochasitc matrix
%           and a boolean value b, such that if b == 1 then M is
%           stochastic and if b != 1 then M is not Stochastic

    dims = size(M);
    
    rows = dims(1);
    cols = dims(2);
    % if we wish to check that M is right stochastic, then sum up each row
    if r == 1
        S = zeros(rows, 1);
        sum = 0;
        for i = 1: rows
            for j = 1: cols
                sum = sum + M(i,j);
            end
            S(i, 1) = sum;
            sum = 0;
        end
    % if we wish to check that M is left stochastic, then sum up each
    % column
    elseif r == 0
        S = zeros(cols, 1);
        sum = 0;
        for i = 1: cols
            for j = 1:rows
                sum = sum + M(j, i);
            end
            S(i, 1) = sum;
            sum = 0;
        end;
    end
    
    
    b = 1;
    i = 1;
    while( (i <= length(S) ) && ( b == 1)  )
        if(S(i, 1) ~= 1)
            b = 0;
        end
        i = i + 1;
    end
end

