
%	this file will generate a N by M matrix
%	N denoting the numbers from 0 to N-1
% 	and M denoting the number of columns, or values wanted in the matrix


%this number will return a matrix representing binary numbers
% and will be passed in m, to represent 0 to k-1 numbers to convert to binary, 
% and will also represent the number of rows in our matrix
function Binary_numbers = get_binary_numbers(n)


m = 2^n;

columns = log(m)/log(2);

columns = ceil(columns);


Binary_numbers = zeros(m, columns);

for i = 1: m
	k = i - 1;
	count = 1;
	while k > 0
		bit = mod(k,2);
		k = floor(k./2);
		Binary_numbers(i, count) = bit;
		count = count + 1;
	end
end


%then i return the binary number matrix

