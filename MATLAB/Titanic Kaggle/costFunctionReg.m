function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
s = -(1 / m) * sum(y .* log(hypothesis(theta, X)) + (1 - y) .* (log(1 - hypothesis(theta, X))));
costRegTerm = (lambda / (2 * m)) * (sum(theta .^ 2) - theta(1) ^ 2);
J = s + costRegTerm;

gradRegTerm = (lambda / m) .* theta; 
gradS = (1 / m) * sum((hypothesis(theta, X) - y) .* X);
grad = gradS' + gradRegTerm;
grad(1) = gradS(1);

end
