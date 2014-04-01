

q = [-1 0 0 0; 0 0 -1 0; 0 -1 0 0; 0 0 0 -1];

% for higher temperaturs - 5 beta values (1/temperatures)
b = [.5 .01 25 50 100];
% for low temperature values 
b2 = [25 50 100 ];


% transform matrix
t = [0 1; 1 0];

nl = 3;
nh = 12;


%function [ delta] = get_delta2(q, t, nl, nh, beta )

d1 = get_delta2(q, t, nl, nh, b1(1) );

d2 = get_delta2(q, t, nl, nh, b1(2) );


d3 = get_delta2(q, t, nl, nh, b2(1) );


d4 = get_delta2(q, t, nl, nh, b2(2) );

d5 = get_delta2(q, t, nl, nh, b2(3) );



