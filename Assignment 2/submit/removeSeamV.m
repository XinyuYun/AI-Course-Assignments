function imOut = removeSeamV(im4,seam)
% Function removeSeamV returns the input 4-channel image with the seam vector removed
% Inputs  im4(m*n*4): 4-channel image im4 combined RGB color image with mask M
%         seam is a vector of the same size as image height
%           
% Outputs imOut(m*(n-1)*4):  4-channel image with the seam vector removed

% ====================== My IMPLEMENTATION HERE ======================
for index = 1 : size(im4, 3)
    curr_im = im4(:,:,index);
    new_im = [];
    for row = 1: size(curr_im, 1)
        curr_row = curr_im(row, :);
        curr_row(seam(row)) = [];
        new_im = [new_im; curr_row];
    end
    imOut(:,:,index) = new_im;
end
% ====================================================================
end
