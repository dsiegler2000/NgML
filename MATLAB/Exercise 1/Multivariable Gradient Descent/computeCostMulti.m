function J = computeCostMulti(X, y, theta)
% Initialize some useful values
m = length(y); % number of training examples

J = (1 / (2 * m)) * sum((hypothesis(theta, X) - y) .^ 2);

end