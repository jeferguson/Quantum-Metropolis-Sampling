%method call to generate the hamiltonian matrix
%input is a 2 by 2 matrix h and an i,j 

%then compare each boolean strings - if everything else but i and j
%matches, then we consult the 2 by 2 matrix H


%	to compute the boolean strings
%	we will create two arrays of 1024 of boolean vectors
%	using the function: de2bi(d,n), where d is the number and n is number of columns (10 more now) 
%		actually this will not work because we do not have a liscense for this number

% this function will return a matrix  Hij matrix, and be passed in a matrix B 
% of all binary numbers represented, and and k (i), l (j), of which to construct the corresponding Hij matrix

% can use kron(X, Y) to take the tensor product of X and Y

function [Hij] = tensor_with_identidy(H, B, k, l)

sz = size(B);

%the number of rows of the matrix
matrix_size = sz(1);

bit_count = sz(2);


Hij = zeros(matrix_size, matrix_size);


% for tensoring with a 4 by 4 matrix
% if the value of the second index to be compared > 0, then H is a 4 by 4
% matrix and we use the l value to compute the tensor product to get a 
% 2^n by 2^n matrix

% if l > 0, then H is a 4 by 4 matrix defining the interacton of 2 qubits,
% and we compare two bits in each binary string
if l > 0	
	for a = 1:matrix_size
		for b = 1:matrix_size
			isMatch = 1;
			for c = 1: bit_count
				if (c ~= k && c ~= l)
					if (B(a,c) ~= B(b,c))
						isMatch = 0;
					end
				end
			end
			if (isMatch == 1)
				x = (B(a, k) * 2) + B(a, l) + 1;
				y = (B(b, k) * 2) + B(b, l) + 1;
				Hij(a,b) = H(x, y);
			end
		end
    end

% for tensoring with a 2 by 2 matrix
% if the value passed in for the second index is a 0 or negative value,
% then we know the matrix H passed in is a 2 by 2 matrix, and we are only
% comparing one bit each of the tensor product

% implement a RANDOM bit flip
r = randi(1, bit_count);

elseif (l <= 0)
	for a = 1:matrix_size
		for b = 1:matrix_size
			isMatch = 1;
			for c = 1: bit_count
				if (c ~= r)
					if (B(a,c) ~= B(b,c))
						isMatch = 0;
					end
				end
			end
			if (isMatch == 1)
				x = B(a, r) + 1;
				y = B(b, r) + 1;
				Hij(a,b) = H(x, y);
			end
		end
    end
end


