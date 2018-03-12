function outIm = applyFilter(im,F)
% Function applyFilter takes as an input gray scale image im, a filter F and outputs the result of correlating image im with filter F,
% Inputs  gray scale image im, a filter F, 
% Outputs outIm - correlating image im with filter F

% ====================== My IMPLEMENTATION HERE ======================
%initial outIm
outIm = zeros()
%get the k value of filter F, assuming F is always having odd number(2*k+1) of rows and columns
k_F = (size(F, 1) - 1)/2;
%get the size of im
[m, n] = size(im);
%clip the im by surrounding im with zeros(m, k) at left and right of im,
%and zeros(k, n+2k) at top and bottom of im
clip_im = [zeros(m, k_F) im zeros(m, k_F)];
clip_im = [zeros(k_F, n + 2 * k_F); clip_im; zeros(k_F, n + 2 * k_F)];

% got through the cliped im matrix to get sub matrix(2k+1, 2K+1)
for row_index = 1 : size(im, 1)
    for col_index = 1 : size(im, 2)
        %from current element node, get sub matrix as same size as F
        sub_im = clip_im(row_index: (row_index + size(F, 1) - 1), col_index: (col_index + size(F, 2) -1))
        %sum all elements then save to outIm's accordant position
        outIm(row_index, col_index) = sum(sum(sub_im .* F));
    end
end
% ====================================================================
end
