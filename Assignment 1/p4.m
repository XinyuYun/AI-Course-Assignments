function C = p4(w, X)
% Function p4 performs two labels liner classification
% Inputs    X - the n*d samples, 
%           w - vector of weights (d+1)*1
% Outputs   vector C (size n × 1) stores the class assigned to the samples in X
% ====================== My IMPLEMENTATION HERE ===========================
%combine a vector with X to match the weight vector
X = [ones(size(X, 1), 1) X];
%calculate with X*w
C = X*w;
%set positive results to label 1,and negative to label 2
C(C >= 0) = 1;
C(C < 0) = 2;
% =========================================================================
end