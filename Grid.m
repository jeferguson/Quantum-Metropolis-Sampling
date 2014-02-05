classdef Grid
    %UNTITLED3 Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        V;
        E;
    end
    
    methods
        % method to generate a grid graph with m rows and n columns 
        function obj = Grid(m, n)
            obj.V = (1:(m*n));
            z = (m-1)*n + m*(n-1);
            obj.E = zeros(z, 2);
            k = 1;
            
            for i = 1:( (m * n) - 1)
                if (mod(i,n) ~= 0)
                    obj.E(k,1) = i;
                    obj.E(k, 2) = i+1;
                    k = k+1;
                end
                if ( (i + n) <= (m*n) )
                    obj.E(k,1) = i;
                    obj.E(k,2) = i+n;
                    k = k+1;
                end
            end
        end
    end
    
end

