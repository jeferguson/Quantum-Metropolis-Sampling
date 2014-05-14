function [ deltas, variance, stdev, S, B ] = delta_avgs(q, t, nl, nh, beta, r, reps )
%function [ deltas, variance, stdev, S, B ] = delta_avgs(q, t, nl, nh, beta, r, reps )


    S = zeros(nh - nl + 1,reps);
    % testing
    B = zeros(nh - nl + 1,reps);
    
    index = 1;
    
    %dims = size(S)
    
    for i = 1: reps
       
       d = getn_deltas(q, t, nl, nh, beta, r);
       
       %index
       % = index + nh - nl
       %size(d)'
       %size(S(index : index + (nh-nl)))
       %size(S)
       
       S(index : index + (nh-nl) ) = d(1:nh-nl+1)';
       
       %testing
       B(index : index + (nh-nl) ) = ones(1,nh-nl+1);

       
       
       index = index + nh - nl + 1;
       
        
        
    end
    
    deltas = sum(S,2)*(1/reps);
    
    variance = var(S,0,2);
    
    stdev = std(S,0,2);
    

end

