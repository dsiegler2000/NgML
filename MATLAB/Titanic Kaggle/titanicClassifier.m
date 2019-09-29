%% Machine Learning Online Class - Exercise 2: Logistic Regression
%
%  Instructions
%  ------------
%
%  This file contains code that helps you get started on the second part
%  of the exercise which covers regularization with logistic regression.
%
%  You will need to complete the following functions in this exericse:
%
%     sigmoid.m
%     costFunction.m
%     predict.m
%     costFunctionReg.m
%
%  For this exercise, you will not need to change any code in this file,
%  or any other files other than those mentioned above.
%

%% Initialization
clear; 
close all;
clc

%% Load Data
%  The first two columns contains the X values and the third column
%  contains the label (y).

rawData = readtable('train.csv');
data = processData(rawData);
trainTestSplit = round(length(data) / 10);
X = data(1:length(data) - trainTestSplit, 1:7); 
y = data(1:length(data) - trainTestSplit, 8);
xTest = data(length(data) - trainTestSplit + 1:length(data), 1:7);
yTest = data(length(data) - trainTestSplit + 1:length(data), 8);

plottingX = [X(:, 3), X(:, 6)];
% plotData(plottingX, y);

% Put some labels
% hold on;

% Labels and Legend
% xlabel('Age')
% ylabel('Fare')

% Specified in plot order
% legend('y = 1', 'y = 0')
% hold off;

%% ============= Part 2: Regularization and Accuracies =============
%  Optional Exercise:
%  In this part, you will get to try different values of lambda and
%  see how regularization affects the decision coundart
%
%  Try the following values of lambda (0, 1, 10, 100).
%
%  How does the decision boundary change when you vary lambda? How does
%  the training set accuracy vary?
%

% Initialize fitting parameters
initial_theta = zeros(size(X, 2), 1);

% Set regularization parameter lambda to 1 (you should vary this)
lambda = 1;

% Set Options
options = optimset('GradObj', 'on', 'MaxIter', 400);

% Optimize
[theta, J, exit_flag] = fminunc(@(t)(costFunctionReg(t, X, y, lambda)), initial_theta, options);

% Plot Boundary
plotDecisionBoundary(theta, plottingX, y);
% hold on;
% title(sprintf('lambda = %g', lambda))

% Labels and Legend
% xlabel('Age')
% ylabel('Fare')

% legend('y = 1', 'y = 0', 'Decision boundary')
% hold off;

% Compute accuracy on our training set
p = predict(theta, xTest);

fprintf('Train Accuracy: %f\n', mean(double(p == yTest)) * 100);

