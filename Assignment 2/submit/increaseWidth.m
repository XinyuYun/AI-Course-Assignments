function [seam,im4Out,c] = increaseWidth(im4,E)
% Function increaseWidth
% Inputs    im4(m*n*4) - 4-channel image im4
%           E(m*n) - corresponding energy image E
%           
% Outputs   seam(m*1) increased
%           im4Out(m*(n+1)*4)the input 4-channel image reduced in size by one column, 
%           c - the cost of the increased seam.

% ====================== My IMPLEMENTATION HERE ======================
%get the best seam that should be increated
[M,P] = seamV_DP(E);
[seam, c] = bestSeamV(M, P);
im4Out = addSeamV(im4, seam);
% ====================================================================
end

