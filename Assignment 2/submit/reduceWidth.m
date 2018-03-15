function [seam,im4Out,c] = reduceWidth(im4,E)
% Function reduceWidth 
% Inputs   im4(m*n*4) - 4-channel image im4
%           E(m*n) - corresponding energy image E
%           
% Outputs   removed seam(m*1), 
%           im4Out(m*(n-1)*4)the input 4-channel image reduced in size by one column, 
%           c - the cost of the removed seam c.

% ====================== My IMPLEMENTATION HERE ======================
%get the best seam that should be removed
[M,P] = seamV_DP(E);
[seam, c] = bestSeamV(M, P);
im4Out = removeSeamV(im4, seam);
% ====================================================================
end

