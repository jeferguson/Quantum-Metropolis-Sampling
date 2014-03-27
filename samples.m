

q1 = [-1 0 0 0; 0 0 -1 0; 0 -1 0 0; 0 0 0 -1];

% for higher temperaturs - 5 beta values (1/temperatures)
b1 = [.025 0.2 .01 0.001];
% for low temperature values 
b2 = [50 100 150 200];


% transform matrix
t = [0 1; 1 0];

deltas = zeros(15,1);


% b1(1) delta values
for i =  5: 20
     deltas(index) = get_delta(q,t, Ring(i), b1(1));
end

deltas = zeros(15,1);
% b1(2) delta values
for i =  5: 20
     deltas(index) = get_delta(q,t, Ring(i), b1(2));
end

deltas = zeros(15,1);
% b1(3) delta values
for i =  5: 20
     deltas(index) = get_delta(q,t, Ring(i), b1(3));
end

deltas = zeros(15,1);
% b1(4) delta values
for i =  5: 20
     deltas(index) = get_delta(q,t, Ring(i), b1(4));
end

deltas = zeros(15,1);
% b2(1) delta values
for i =  5: 20
     deltas(index) = get_delta(q,t, Ring(i), b2(1));
end

deltas = zeros(15,1);
% b2(2) delta values
for i =  5: 20
     deltas(index) = get_delta(q,t, Ring(i), b2(2));
end


deltas = zeros(15,1);
% b2(3) delta values
for i =  5: 20
     deltas(index) = get_delta(q,t, Ring(i), b2(3));
end

deltas = zeros(15,1);
% b2(4) delta values
for i =  5: 20
     deltas(index) = get_delta(q,t, Ring(i), b2(4));
end


%[K1, V1, D1, T1, H1] = stochastic_matrix(q, t, G1);
 
%[K2, V2, D2, T2, H2]= stochastic_matrix(q, t, G2);


