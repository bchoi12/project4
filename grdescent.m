function [w]=grdescent(func,w0,stepsize,maxiter,tolerance)
% function [w]=grdescent(func,w0,stepsize,maxiter,tolerance)
%
% INPUT:
% func function to minimize
% w0 = initial weight vector 
% stepsize = initial gradient descent stepsize 
% tolerance = if norm(gradient)<tolerance, it quits
%
% OUTPUTS:
% 
% w = final weight vector
%

if nargin<5,tolerance=1e-02;end;

if nargin < 2
    w0 = zeros(size(xTr, 1), 1);
end

[loss, gradient] = func(w0);

w = w0;
lastw = w;

for i=1:maxiter
    w = lastw - stepsize*gradient;
    
    [l, g] = func(w);
    
    if (l > loss)
        w = lastw;
        stepsize = stepsize * 0.5;
    else
        lastw = w;
        stepsize = stepsize * 1.01;
        gradient = g;
    end
    
    if norm(gradient) < tolerance
        break
    end
end