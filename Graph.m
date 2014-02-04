
classdef Graph

% a graph with verticies and edges


	% the "properties" or fields of the class, Verticies V, and Edges E
	properties
		% Verticies represented by a list of n elements
		V;
		% Edges represented by a m by 2 matrix of edges inputted into the program
		E;
    end
    % basic constructor method
	methods
		function obj = Graph(V, E)
			obj.V = V;
			obj.E = E;
        end
    end
    % method to generate a ring graph
    methods
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
   % method to generate a grid graph with m rows and n columns
   methods 
        function obj = Grid(m, n)
            obj.V = (1:(m*n));
            k = (m-1)*n + m*(n-1);
            obj.E = zeros(k, 2);
            %create the horozontal edges
            %create the verticle edges
        end
    end
    


	% a ring graph - simple method to make one
	% a grid graph - simple method to make one

end