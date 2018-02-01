function C = p3(X_train, Y_train, X_test, k)
% Function p3 performs kN N classification
% Inputs    X_train - the training samples, 
%           Y_train - the true class of training samples, and 
%           X_test - the test samples
%           k - parameter for kNN classifier
% Outputs   vector C stores the classes assigned to the test samples
% ====================== My IMPLEMENTATION HERE ===========================
%initialize vector C
C = zeros(size(X_test, 1));
%compute distances(without sqrt) from each element in X_test to all elements in X_train
distance_matrix = X_test.^2 * (X_train.^2)'

%




% =========================================================================
end