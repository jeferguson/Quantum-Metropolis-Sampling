
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
	% a ring graph - simple method to make one
	% a grid graph - simple method to make one

end