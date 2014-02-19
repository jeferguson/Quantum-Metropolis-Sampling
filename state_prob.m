function [ W ] = state_prob( E, B )
%Computes the probability of transitioning to each state from each state
%   given the Eigenvalues and tempurature of a quantum system

%   Input:  E - n by n Diagonal Matrix
%           B - inverse of the temperature of the system
%   Output: W - an n by n diagonal matrix of the probabilities to move to another quantum state


W = zeros(length(E), length(E));
sum = 0;
    for i = 1: length(E)
        k = exp((-B)*E(i,i));
        W(i, i) = k;
        sum = sum + k;
    end
    
    W = W/sum;

end

