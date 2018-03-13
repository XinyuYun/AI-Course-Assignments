function eng = computeEngColor(im,W)
% Function computeEngGrad transfers color image to gray scale image
% Inputs  im(m*n*3): a color image im
%         vector W of size 3 for color based energy
% Outputs eng(m*n*3):  color-based energy image 

% ====================== My IMPLEMENTATION HERE ======================
eng = W(1) * im(:,:,1) + W(2) * im(:,:,2) + W(3) * im(:,:,3);

% ====================================================================
end
