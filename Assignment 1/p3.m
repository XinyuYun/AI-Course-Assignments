function C = p3(X_train, Y_train, X_test, k)
% Function p3 performs kN N classification
% Inputs    X_train - the training samples, 
%           Y_train - the true class of training samples, and 
%           X_test - the test samples
%           k - parameter for kNN classifier
% Outputs   vector C stores the classes assigned to the test samples
% ====================== My IMPLEMENTATION HERE ===========================
%initialize vector C
C = zeros(size(X_test, 1), 1);
%compute distances(without sqrt) from each element in X_test to all elements in X_train
for row = 1:size(X_test, 1)
    %repeat current X_test row to match row size of X_train
    curr_test_matrix = repmat(X_test(row, :), size(X_train, 1), 1); 
    %calculate the distance(without sqrt)
    distance = sum(abs(curr_test_matrix - X_train).^2, 2);
    %sort the distance result    
    [Y, I] = sort(distance);
    %get top k labels from Y_train, and use mode function to get most
    %frequent label then save it to C(row)
    C(row) = mode(Y_train(I(1:k)));
end


%




% =========================================================================
end