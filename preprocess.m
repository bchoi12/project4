function [xTr,xTe,u,m]=preprocess(xTr,xTe);
% function [xTr,xTe,u,m]=preprocess(xTr,xTe);
%
% Preproces the data to make the training features have zero-mean and
% standard-deviation 1
%
% output:
% xTr - pre-processed training data 
% xTe - pre-processed testing data
% 
% u,m - any other data should be pre-processed by x-> u*(x-m)
%

X = [xTr xTe];

m = mean(X, 2);
M = repmat(m, 1, size(X, 2));
u = 1 ./ std(X, 0, 2);
U = diag(u);

X = U * (X - M);

% C = X*X';
% [V, ~, explained] = pcacov(X);
% 
% cs = cumsum(explained);
% 
% num = length(explained);
% explained
% for i=1:length(explained)
%    if cs(i) > 95
%        num = i;
%        break;
%    end
% end
% 
% X = V(:, 1:num)'*X;

xTr = X(:, 1:size(xTr, 2));
xTe = X(:, size(xTr, 2)+1:end);