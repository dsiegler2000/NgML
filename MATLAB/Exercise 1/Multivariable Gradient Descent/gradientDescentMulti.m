
function [theta, J_history] = gradientDescentMulti(X, y, theta, alpha, num_iters)
%GRADIENTDESCENTMULTI Performs gradient descent to learn theta
%   theta = GRADIENTDESCENT(X, y, theta, alpha, num_iters) updates theta by 
%   taking num_iters gradient steps with learning rate alpha

% Initialize some useful values
m = length(y); % number of training examples
J_history = zeros(num_iters, 1);
nThetas = length(theta);
tempThetas = theta; % used so update is simultanious

for iter = 1:num_iters
    
    hypothesisMinusY = hypothesis(theta, X) - y;
    
    for i= 1: nThetas
        tempThetas(i, 1) = sum(hypothesisMinusY .* X(:,i));
    end
    
    theta = theta - (alpha / m) * tempThetas;

    % Save the cost J in every iteration  
    J_history(iter) = computeCostMulti(X, y, theta);

end

end
