function [err, CONF] = p10b(X_test, Y_test, net)
% Function p10b trains a neural network using matlab function patternnet 
% Inputs    X_test - an input training samples size n*d
%           Y_test - their true class size n*1
%           net - trained network
% Outputs   
%           err - test error
%           CONF - confusion matrix
% ====================== My IMPLEMENTATION HERE ===========================
%add bias column to X_test and set samples to be column-wise
X_test_new = [ones(size(X_test, 1), 1) X_test]';
%get the prediction with net and X_test,then tranfter to a binary matrix
%and set the row value with largest entry in each column to be 1
Y_predict_matrix = net(X_test_new) == max(net(X_test_new));
[row, col] = find(Y_predict_matrix == 1);
[err, CONF] = p2(row, Y_test);
% =========================================================================
end