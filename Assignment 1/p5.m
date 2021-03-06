function w = p5(X_train, Y_train, iterNum)
% Function p5 performs two labels liner classification
% Inputs    X_train - an input training samples(size n × d) 
%           Y_train - their true class (size n × 1)
%           iterNum - the number of iterations
% Outputs   w - best weights w (size(d + 1) × 1) you find
% ====================== My IMPLEMENTATION HERE ===========================
%get size of X_train (row size n and column size d) 
d = size(X_train, 2);
%generate random weights matrix with size(d+1)*iterNum, each column is a
%candidate weights set
weights = randn(d+1, iterNum);
%learn from training data using p4 function with each weights set
%in predictions, each column is one classifier result
predictions = p4(weights, X_train);
%initial a train err array to save training error by each weights set
train_err = zeros(1, iterNum);
%check the traning error for each prediction result using p2 function, then
%save the error to train_err array
for index = 1:size(predictions, 2)
    [err] = p2(predictions(:, index), Y_train);
    train_err(index) = err;
end
%get minimum training error value and accordant index
[M, Index] = min(train_err);
% set that colum of weights with minimum training error to w
w = weights(:,Index);
fprintf("the min training err is %f\n", M);

% =========================================================================
end