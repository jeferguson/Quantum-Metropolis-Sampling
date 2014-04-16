function [ Sb ] = binary_subspace( B, r )
%function [ Sb ] = binary_subspace( B, r )
%   binary_subspace returns a matrix denoting a subpsace of binary numbers
%   such that each binary numbery has r ones
%   INPUT:  B - a matrix of binary strings (from get_binary_numbers)
%           r - the number of ones specified in each string
%   OUTPUT: Sb - a matrix denoting the specified subspace of B

    dims = size(B);
    count = 0;
    
    z = zeros(dims(1), 1);
    
    for i = 1 : dims(1)
       if( sum(B(i,:)) == r)
           count = count + 1;
           z(count) = i;
       end
    end
    
    Sb = zeros(count, dims(2));
    for i = 1 : count
        Sb(i,:) = B(z(i,1),:);
    end

end

