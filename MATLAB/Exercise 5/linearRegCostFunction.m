function [J, grad] = linearRegCostFunction(X, y, theta, lambda)
%LINEARREGCOSTFUNCTION Compute cost and gradient for regularized linear 
%regression with multiple variables
%   [J, grad] = LINEARREGCOSTFUNCTION(X, y, theta, lambda) computes the 
%   cost of using theta as the parameter for linear regression to fit the 
%   data points in X and y. Returns the cost in J and the gradient in grad

% Initialize some useful values
m = length(y); % number of training examples

J = (1 / (2 * m)) * sum((hypothesis(theta, X) - y) .^ 2) + (lambda / (2 * m)) * (sum(theta .^ 2) - theta(1) ^ 2);

% grad = sum((hypothesis(theta, X) - y) .* X) + (lambda / m) .* theta;
% grad(1) = grad(1) - (lambda / m) * theta(1);

grad = zeros(size(theta, 1), 1);

for j=1:size(theta, 1)
    s = 0;
    for i=1:m
        if j == 1
            s = s + X(i, :) * theta - y(i);
        else
            s = s + (X(i, :) * theta - y(i)) * X(i, j);
        end
    end
    grad(j) = (1 / m) * s + (lambda / m) * theta(j);
end

grad(1) = grad(1) - (lambda / m) * theta(1);

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost and gradient of regularized linear 
%               regression for a particular choice of theta.
%
%               You should set J to the cost and grad to the gradient.
%












% =========================================================================

grad = grad(:);

end