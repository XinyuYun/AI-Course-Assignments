function eng = computeEng(im4,F,W,maskW)
% Function computeEng computes and returns energy for seam carving that is the sum of gradient, color, and mask energies.
% Inputs  im4(m*n*4): 4-channel image im4 combined RGB color image with mask M
%         filter F(m_F*n_F) to use for gradient energy
%         a weight vector W(1*3) to use for color energy
%         the weight of the mask maskW
%           
% Outputs eng(m*n):  seam carving

% ====================== My IMPLEMENTATION HERE ======================
eng = computeEngGrad(im4(:,:,1:3), F) + computeEngColor(im4(:,:,1:3), W) + maskW * im4(:,:,4);

% ====================================================================
end
