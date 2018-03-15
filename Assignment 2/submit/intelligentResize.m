function [totalCost,imOut] = intelligentResize(imInput,v,h,W,mask,maskWeight)
% Function increaseWidth
% Inputs    iminput(m*n*3) - 3-channel colored image
%           v - the number of vertical seams to process v, 
%           h - the number of horizontal seams to process h
%           W - the weight vector W for the color energy
%           mask - the mask image with its weight maskWeight.
%           
% Outputs   totalCost - the sum of all seams carved 
%           imOut ((m+h) * (n+v) * 3) - the output carved color image.
% ====================== My IMPLEMENTATION HERE ======================
%concatinate im color channels with mask to get im4
im4 = cat(3, imInput(:,:,1), imInput(:,:,2), imInput(:,:,3), mask);
%filter F [-1, 0, 1]
F = [-1, 0, 1];

totalCost = 0;

if v > 0
    for times = 1 : v
        %vertical insert seams
        E = computeEng(im4, F, W, maskWeight);
        [seam,im4_temp,c] = increaseWidth(im4,E);
        im4 = im4_temp;
        totalCost = totalCost + c;
    end
elseif v < 0
    for times = 1 : abs(v)
        %vertical remove
        E = computeEng(im4, F, W, maskWeight);
        [seam,im4_temp,c] = reduceWidth(im4,E);
        im4 = im4_temp;
        totalCost = totalCost + c;
    end
end
if h > 0
    for times = 1: h
        E = computeEng(im4, F, W, maskWeight);
        [seam,im4_temp,c] = increaseHeight(im4,E);
        im4 = im4_temp;
        totalCost = totalCost + c;
    end
elseif h < 0
    for times = 1: abs(h)
        E = computeEng(im4, F, W, maskWeight);
        [seam,im4_temp,c] = reduceHeight(im4,E);
        im4 = im4_temp;
        totalCost = totalCost + c;
    end
end
imOut = im4;
imOut(:,:,4) = [];
% ====================================================================
end

