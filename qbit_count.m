function [ qn ] = qbit_count( G )
%   function [ qn ] = qbit_count( G )
%   returns the number of qubits in the quantum system, given an input Graph G

    qn = 1;
    dims = size(G);
    S = reshape(sort(G), 2 * dims(1), 1);
    i = 2;
    
    while i < ( dims(1) * dims(2) )
        while S(i) == S(i-1)  
            i = i+1;
        end
        
        qn = qn + 1;
        i = i+1;
        
    end


end

