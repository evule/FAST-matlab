% function [predictedcritvals] = funcTvC(params, xs);
% A Threshold vs. Contrast (TvC) function.
% 
% y = {x > p1:  p2 * (x/p1)
%     {x <=p1:  p2
% 
% Or, a more convoluted, but perhaps more intuitive, way of writing this:
% y = {x > p1:  exp(log(p2) + (log(x) - log(p1))),
%     {x <=p1:  exp(log(p2))
% 
% x is the pedastal contrast
% y is the threshold contrast
% p1 is the inflection point (the pedastal contrast after which threshold
% contrast increases)
% p2 is the base threshold contrast (when x < p1)
% 
% When x > p1, log(threshold contrast) increases linearly with log(pedastal
% contrast). Note that the slope of this increase is fixed at 1.  
% For a function where this is a free parameter see funcTvCnl. 
% 
% see original definition in Lesmes et al, 2006.
%
% copyleft Ed Vul and Don MacLeod 2007
%   contact: evul@mit.edu

function [predictedcritvals] = funcTvC(params, xs);

% predictedcritvals = exp( ((xs > params{1}).*(log(xs)-log(params{1}))) + log(params{2}) );

predictedcritvals = params{2} .* ((xs./params{1}).^(xs > params{1}));