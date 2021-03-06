function C = p12(X_test)
%ONEVSALL trains multiple logistic regression classifiers and returns all
%   @param X_test the samples to classify stored as rows, and 
%   @return C the vector of class labels
%nested sigmoid function and cost function
    function g = sigmoid(z)
        g = 1.0 ./ (1.0 + exp(-z));
    end
    function [J, grad] = lrCostFunction(weight, X, y, lambda)
        m = length(y); % number of training examples

        % You need to return the following variables correctly 
        J = 0;
        grad = zeros(size(weight));
        temp = weight;
        temp(1) = 0;
        J = sum(((-1*y).*log(sigmoid(X*weight))) - (ones(size(y,1),1) - y).*log(ones(size(y,1),1)-sigmoid(X*weight)))/m + lambda/(2*m)*sum(temp.^2);
        grad = ((sigmoid(X*weight)-y)'*X)'/m;
        grad = grad + (lambda.*temp)/m;
    end
    %load A1_full as training set
%clear ; close all; clc
load ('A1_full.mat', 'X_train_full','Y_train_full', 'X_test_full', 'Y_test_full');

% Some useful variables
m = size(X_train_full, 1);%samples
n = size(X_train_full, 2);%features
num_labels = 10; 
lambda = 0.8;
X_train_full = [ones(m,1) X_train_full];
% using fmincg to get optimal weights
all_weights = zeros(num_labels, n + 1);
initial_weight = randn(n+1,1);
options = optimset('GradObj', 'on', 'MaxIter', 50);
for c = 1: num_labels
    [weight] = fmincg (@(t)(lrCostFunction(t, X_train_full, (Y_train_full == c), lambda)),initial_weight, options);
    all_weights(c,:) = weight;
end
%validate with X_test_full and Y_test_full
[val_err, val_CONF] = p2(p7(all_weights, X_test_full), Y_test_full);
fprintf("validation error in X_test_full is %f\n", val_err);
%predict with trained weights
C = p7(all_weights, X_test);

end