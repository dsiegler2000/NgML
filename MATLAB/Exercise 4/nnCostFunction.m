function [J grad] = nnCostFunction(nn_params, input_layer_size, hidden_layer_size, num_labels, X, y, lambda)
%NNCOSTFUNCTION Implements the neural network cost function for a two layer
%neural network which performs classification
%   [J grad] = NNCOSTFUNCTON(nn_params, hidden_layer_size, num_labels, ...
%   X, y, lambda) computes the cost and gradient of the neural network. The
%   parameters for the neural network are "unrolled" into the vector
%   nn_params and need to be converted back into the weight matrices. 
% 
%   The returned parameter grad should be a "unrolled" vector of the
%   partial derivatives of the neural network.
%

% Reshape nn_params back into the parameters Theta1 and Theta2, the weight matrices
% for our 2 layer neural network
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), num_labels, (hidden_layer_size + 1));

% Setup some useful variables
m = size(X, 1);
         
% You need to return the following variables correctly

allAOnes = [ones(m, 1) X];
allATwos = [ones(m, 1) sigmoid(allAOnes * Theta1')];
allAThrees = sigmoid(allATwos * Theta2');

oneHotY = repmat(1:num_labels, m, 1) == repmat(y, 1, num_labels);
cost = -oneHotY .* log(allAThrees) - (1 - oneHotY) .* log(1 - allAThrees);

J = (1 / m) * sum(sum(cost)) + (lambda / (2 * m)) * (sum(sum(Theta1(:, 2:end) .^ 2)) + sum(sum(Theta2(:, 2:end) .^ 2)));

bigDeltaOne = zeros(size(Theta1));
bigDeltaTwo = zeros(size(Theta2));

for t = 1:m
    aOne = allAOnes(t, :)';
    aTwo = allATwos(t, :)';
    zTwo = [1; Theta1 * aOne];
    aThree = allAThrees(t, :)';
    
    smallDeltaThree = aThree - oneHotY(t, :)';
    smallDeltaTwo = Theta2' * smallDeltaThree .* sigmoidGradient(zTwo);
    
    bigDeltaOne = bigDeltaOne + smallDeltaTwo(2:end) * aOne';
    bigDeltaTwo = bigDeltaTwo + smallDeltaThree * aTwo';
    
end

Theta1_grad = (1 / m) * bigDeltaOne + (lambda / m) * [zeros(size(Theta1, 1), 1) Theta1(:, 2:end)];
Theta2_grad = (1 / m) * bigDeltaTwo + (lambda / m) * [zeros(size(Theta2, 1), 1) Theta2(:, 2:end)];

grad = [Theta1_grad(:); Theta2_grad(:)];


end
