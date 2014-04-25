function [ deltas ] = plotn_deltas( q, t, nl, nh, beta, r )
%function [ deltas ] = plot_deltas( q, t, nl, nh, beta, r )
%   Detailed explanation goes here


    deltas = getn_deltas(q,t,nl,nh,beta,r);
    
    d = zeros(nh - 1, 1);
    
    d(nl:nh) = ones(nh - nl + 1, 1)./deltas;
    
    plot(d);
    
    
    
    

end

