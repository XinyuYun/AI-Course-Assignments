function C = p7(W, X)
% Function p7 performs multiclass linear classifier
% Inputs    W - a matrix of weights W (size m × (d + 1)) 
%           X - matrix of samples X (size n × d) to classify,
% Outputs   C - The output column vector C (size n × 1) is the classes (from 1 to m) assigned to samples in X
% ====================== My IMPLEMENTATION HERE ===========================
%add bias column to X to make size is n * (d+1)
X = [ones(size(X, 1), 1) X];
%calculate linear function g(X) for each weight and assign sample x to class i if g(x) has max value with weight i 
[M, C] = max(X*W', [], 2);
% =========================================================================
end