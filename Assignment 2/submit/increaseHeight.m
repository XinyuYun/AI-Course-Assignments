function [seam,im4Out,c] = increaseHeight(im4,E)
% Function increaseWidth
% Inputs    im4(m*n*4) - 4-channel image im4
%           E(m*n) - corresponding energy image E
%           
% Outputs   seam(m*1) increased
%           im4Out(m*(n+1)*4)the input 4-channel image reduced in size by one column, 
%           c - the cost of the increased seam.

% ====================== My IMPLEMENTATION HERE ======================
%get the best seam that should be increated based on tansposed E
[M,P] = seamV_DP(E');
[seam, c] = bestSeamV(M, P);
im4_tran = [];
im4Out = [];
for index = 1 : size(im4, 3);
    im4_tran(:, :, index) = im4(:, :, index)';
end
im4Out_tran = addSeamV(im4_tran, seam);
for index = 1 : size(im4Out_tran, 3);
    im4Out(:, :, index) = im4Out_tran(:, :, index)';
end
% ====================================================================
end
