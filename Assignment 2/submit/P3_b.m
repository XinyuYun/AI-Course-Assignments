%set W vector
W = [-3 1 -3];
%Read ‘cat.png’ and convert it to double type
im = double(imread('cat.png'));
%Call computeEngColor to get the color-based energy image matrix
eng = computeEngColor(im, W);
%Compute the sum of the values from energy image
result = sum(eng(:))
%Write energy image to ‘catEngC.png’ after applying stretch and type converted to uint8
imwrite(uint8(stretch(eng)), 'catEngC.png');