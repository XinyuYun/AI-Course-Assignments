function outIm = applyFilter(im,F)
% Function applyFilter takes as an input gray scale image im, a filter F and outputs the result of correlating image im with filter F,
% Inputs  gray scale image im(m * n), 
%         a filter F(m_F * n_F), 
% Outputs outIm - correlating image im with filter F

% ====================== My IMPLEMENTATION HERE ======================
%initial outIm
outIm = zeros(size(im));
%get the k value of filter F, assuming F is always having odd number(m_F * n_F) of rows and columns
[m_f, n_f] = size(F);
%get the size of im
[m, n] = size(im);
%clip the im by surrounding im with zeros(m, (n_f-1)/2) at left and right of im(if n_f != 1),
%and zeros((m_f-1)/2, n+n_f-1) at top and bottom of im(if m_f != 1)
if(n_f > 1)
    clip_im = [zeros(m, (n_f-1)/2) im zeros(m, (n_f-1)/2)];
else
    clip_im = im;
end
if(m_f > 1)
    clip_im = [zeros((m_f-1)/2, size(clip_im, 2)); clip_im; zeros((m_f-1)/2, size(clip_im, 2))];
end
     
% got through the cliped im matrix to get sub matrix(2k+1, 2K+1)
for row_index = 1 : size(im, 1)
    for col_index = 1 : size(im, 2)
        %from current element node, get sub matrix as same size as F
        sub_im = clip_im(row_index: (row_index + size(F, 1) - 1), col_index: (col_index + size(F, 2) -1));
        %sum all elements then save to outIm's accordant position
        outIm(row_index, col_index) = sum(sum(sub_im .* F));
    end
end
% ====================================================================
end
