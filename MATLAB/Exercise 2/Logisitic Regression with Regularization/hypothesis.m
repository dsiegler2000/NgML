function [h] = hypothesis(theta, x)

h = sigmoid(x * theta);

end