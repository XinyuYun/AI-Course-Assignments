function [seam,im4Out,c] = reduceHeight(im4,E)
% Function reduceHeight 
% Inputs   im4(m*n*4) - 4-channel image im4
%           E(m*n) - corresponding energy image E
%           
% Outputs   removed seam(m*1), 
%           im4Out(m*(n-1)*4)the input 4-channel image reduced in size by one column, 
%           c - the cost of the removed seam c.
% ====================== My IMPLEMENTATION HERE ======================
%get the best seam vector based on E' that should be removed
[M,P] = seamV_DP(E');
[seam, c] = bestSeamV(M, P);
im4_tran = [];
im4Out = [];
for index = 1 : size(im4, 3);
    im4_tran(:, :, index) = im4(:, :, index)';
end
im4Out_tran = removeSeamV(im4_tran, seam);
for index = 1 : size(im4Out_tran, 3);
    im4Out(:, :, index) = im4Out_tran(:, :, index)';
end
% ====================================================================
end

