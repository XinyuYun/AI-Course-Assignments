function eng = computeEngGrad(im,F)
% Function computeEngGrad transfers color image to gray scale image
% Inputs  im(m*n*3): a color image im 
%         F(m_F*n_F): Compute the horizontal gradient component based on filter F and the vertical gradient component based on the transpose of F
% Outputs eng(m*n): a gray scale image eng

% ====================== My IMPLEMENTATION HERE ======================
%cover im to grayscale by averaging the 3rd dim 
imG = mean(im, 3);
%applyFilter function to 
eng = sqrt(applyFilter(imG, F).^2 + applyFilter(imG, F').^2);
% ====================================================================
end
