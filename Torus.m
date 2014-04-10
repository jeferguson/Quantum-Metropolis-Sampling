classdef Torus
    %UNTITLED3 Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        V;
        E;
    end
    
    methods
        % method to generate a grid graph with m rows and n columns 
        function obj = Torus(m, n)
            obj.V = (1:(m*n));
            z = (m-1)*n + m*(n-1) + m + n;
            obj.E = zeros(z, 2) ;
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
            
            i = (m-1)*n + m*(n-1) + 1;
            j = 1;
            while j <= m*n
                obj.E(i,1) = j;
                obj.E(i,2) = j+m-1;
                j = j+m;
                i = i + 1;
            end
            
            j = 1;
            while j <= m
                obj.E(i,1) = j;
                obj.E(i,2) = j + (m * ( n - 1) );
                j = j+1;
                i = i + 1;
            end 
            
        end
    end
    
end

