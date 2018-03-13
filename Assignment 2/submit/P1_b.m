%filter
F = [-1 -3 1 ; 0 0 0; 1 3 1];
%read image file and covert it to double
im = double(imread('swan.png'));

out_im = applyFilter(im, F);
%compute the absolute values of output image
s = sum(abs(out_im(:)))
%write output image with applying stretch function and type covered to
%uint8
imwrite(uint8(stretch(out_im)), 'swanFiltered.png');
