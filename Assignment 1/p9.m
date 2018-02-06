function W = p9(X_train, Y_train, iterNum, wInit, alpha)
% Function p8 performs the training to get better weight with softmax single sample rule for multiclass(m) classification problem 
% Inputs    X_train - an input training samples size n*d
%           Y_train - their true class size n*1
%           iterNum - the number of iterations
%           wInit - initial weight for liner classifier (m*(d+1))
%           alpah - fixed learning rate
% Outputs   w - best weights w (size(d + 1) × 1) you find
% ====================== My IMPLEMENTATION HERE ===========================
%set the initial weight to W
W = wInit;
%add bias column to X to make size is n * (d+1)
X_train = [ones(size(X_train, 1), 1) X_train];
%create a new Y_train matrix with size m*n
new_Y_train = zeros(max(unique(Y_train)), size(Y_train, 1));
%set new_Y_train(i,j) to be 1 if i is the true label value, and j is the jth column 
for index = 1 : size(Y_train, 1)
    new_Y_train(Y_train(index), index) = 1;
end
    %define nested softmax function, support matrix input, will compute by
    %column
    function softmax_A = softmax(A)
        softmax_A = exp(A) ./ sum(exp(A));
    end
%start iteration
for iteration = 1 : iterNum
    %in each iteration, using a nested loop to compute each sample with softmax
    %rule
    for i = 1: size(X_train, 1)
        W = W + alpha*((new_Y_train(:, i)-softmax(W*X_train(i,:)'))*X_train(i,:));
    end
end
end
