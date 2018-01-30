function [err,CONF] = p2(C,T)

% Function p2 takes as an input a column vector C of classification results, and a column vector T of true labels.
% Inputs  Assume labels are from 1 to m, and compute m is the maximum integer contained in C and T.
% Outputs err is the fraction of misclassified examples, which is defined as the number of incorrectly classified examples divided by the total number of examples. 
%         CONF is an m by m matrix where CONF(i,j) is the number of examples of class i that are classified as class j.

% ====================== My IMPLEMENTATION HERE ===========================
err = sum(C ~= T)/size(C , 1);
%get the m value to set the CONF size
m = size(unique(T), 1);
%initial CONF matrix as m*m zeros
CONF = zeros(m, m);
% get the liner indexing values of CONF by C and T
indexs = sub2ind(size(CONF), T, C);
%calculate the counts of each index
[index_count, unique_indexs] = hist(indexs, unique(indexs));
%update CONF elements with count values by indexs
CONF(unique_indexs) = index_count;

% =========================================================================
end