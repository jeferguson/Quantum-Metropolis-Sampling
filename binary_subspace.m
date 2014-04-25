function [ B ] = binary_subspace( n, r )
%function [ Sb ] = binary_subspace( B, r )
%   binary_subspace returns a matrix denoting a subpsace of binary numbers
%   such that each binary numbery has r ones
%   INPUT:  n - an integer specifying the number of qubits in the quantum
%               system
%           r - the number of ones specified in each string
%   OUTPUT: Sb - a matrix denoting the specified subspace of B

    
    %{

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
   
    %}




% (n k) = n!/((n-k)!k!)
% here need to create a matrix with this many entries

    %entries =  factorial(n)/( factorial(n-r) * factorial(r));
    entries = nchoosek(n,r);
    B = zeros(entries, n);
    
    index = 1;
    
    if (r == 3)
        for i = 1:n
            for j = (i+1):n
                for k = (j+1):n
                    B(index, i) = 1;
                    B(index, j) = 1;
                    B(index, k) = 1;
                    index = index + 1;
                end
            end
        end   
    elseif (r == 4)  
        for i = 1:n
            for j = i+1:n
                for k = j+1:n
                    for l = k + 1:n
                        B(index, i) = 1;
                        B(index, j) = 1;
                        B(index, k) = 1;
                        B(index, l) = 1;
                        index = index + 1;

                    end
                end
            end
        end
    elseif (r == 5)  
        for i = 1:n
            for j = i+1:n
                for k = j+1:n
                    for l = k + 1:n
                        for m = l+1:n
                            B(index, i) = 1;
                            B(index, j) = 1;
                            B(index, k) = 1;
                            B(index, l) = 1;
                            B(index, m) = 1;
                            index = index + 1;
                        end
                    end
                end
            end
        end
    elseif (r == 6)
        for i = 1:n
            for j = i+1:n
                for k = j+1:n
                    for l = k + 1:n
                        for m = l+1:n
                            for o = m+1:n
                                B(index, i) = 1;
                                B(index, j) = 1;
                                B(index, k) = 1;
                                B(index, l) = 1;
                                B(index, m) = 1;
                                B(index, o) = 1;
                                index = index + 1;
                            end
                        end
                    end
                end
            end
        end
    elseif (r == 7)
        for i = 1:n
            for j = i+1:n
                for k = j+1:n
                    for l = k + 1:n
                        for m = l+1:n
                            for o = m+1:n
                                for p = o+1
                                    B(index, i) = 1;
                                    B(index, j) = 1;
                                    B(index, k) = 1;
                                    B(index, l) = 1;
                                    B(index, m) = 1;
                                    B(index, o) = 1;
                                    B(index,p) = 1;
                                    index = index + 1;
                                end
                            end
                        end
                    end
                end
            end
        end
    else 
        err = MException('ResultChk:OutOfRange', 'the input r value is not defined for this function');
        throw(err);
       
    end
    % add an last else and error message here)
        
end
    
    
    
    
    
    
    
    
    
    
    