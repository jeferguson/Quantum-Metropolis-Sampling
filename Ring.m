classdef Ring
    %RING Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        V;
        E;
    end
    
    methods
        %constructor method to create a ring graph
        function obj = Ring(n)
            obj.V = (1:n);
            obj.E = zeros(n, 2);
            for i = 1: n-1
                obj.E(i, 1) = i;
                obj.E(i, 2) = i+1;
            end
            obj.E(n, 1) = n;
            obj.E(n, 2) = 1;
        end
    end
    
end

