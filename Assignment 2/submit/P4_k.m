%set W
W = [1, -2, 1];
%read color image and cover to double type
im = double(imread('poster.png'));
%set zero mask
mask = zeros(size(im,1), size(im, 2));
v = -50;
h = 100;
%call intelligentResize to get the energy image
[totalCost, imOut] = intelligentResize(im,v,h,W,mask,-100);
fprintf("total cost of all seams with h=%d and v=%d is %d\n", h, v, totalCost);

imwrite(uint8(stretch(imOut)), 'posterResized1.png');