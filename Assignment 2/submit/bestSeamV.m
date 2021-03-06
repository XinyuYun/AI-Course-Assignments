function [seam,c] = bestSeamV(M,P)
% Function bestSeamV takes as an input arrays M,P constructed in part (c) above, and computes and returns
%                   the best seam and its cost c
% Inputs  M and P(m*n): arrays M and P that are constructed from furnction
% seamV_DP.m
%           
% Outputs seam(m*1): vector having the best path(minimum cost)
%               c: cost with best seam

% ====================== My IMPLEMENTATION HERE ======================
%get the index with min value from M's last row 
[c, i] = min(M(end, :));
seam(size(M, 1),:) = i;
for row  = size(M,1):-1:2
    seam(row-1,:) = P(row, seam(row,:));
end
%
% ====================================================================
end

