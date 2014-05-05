function [plots] = plotdelta( deltas )
%   Very basic function used to plot the 1/delta values

    
    plots = ones(length(deltas), 1) ./ deltas;
    
    plot(plots);

end

