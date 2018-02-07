function [net, valErr] = p10a(X_train, Y_train, H, regularizerWeight)
% Function p10a trains a neural network using matlab function patternnet 
% Inputs    X_train - an input training samples size n*d
%           Y_train - their true class size n*1
%           H - The number of columns in H is equal to the number of hidden layers, 
%               and the entries in H give the number of hidden units in the corresponding hidden layer.
%           regularizerWeight - the weight of regularizer
% Outputs   net - trained network
%           valErr - validation error
% ====================== My IMPLEMENTATION HERE ===========================
%intialize NN with patternnet
net = patternnet(H);
%set the training, validation and test folds ratio
net.divideParam.testRatio = 0;
net.divideParam.valRatio = 0.3;
net.divideParam.trainRatio = 0.7;
%set regularization strength
net.performParam.regularization = regularizerWeight;
%set X to be trained with samples stored as columns
X_train_new = [ones(size(X_train, 1), 1) X_train]';
%create new Y matrix repsenting the Y_train correct label
Y_train_new = zeros(max(unique(Y_train)), size(Y_train, 1));
%set new_Y_train(i,j) to be 1 if i is the true label value, and j is the jth column 
for index = 1 : size(Y_train, 1)
    Y_train_new(Y_train(index), index) = 1;
end
%call train function for netwrok training
[net, tr] = train(net, X_train_new, Y_train_new);

%get the validation samples from X_train_new 
%and correct class from Y_train_new
X_val = X_train_new(:, tr.valInd);
Y_val = Y_train_new(:, tr.valInd);

predict_val = net(X_val) == max(net(X_val));

valErr = sum(find(predict_val ==1) ~= find(Y_val == 1))/size(Y_val , 2);
% =========================================================================
end