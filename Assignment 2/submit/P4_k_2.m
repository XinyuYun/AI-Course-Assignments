%set W
W = [1, -2, 1];
%read color image and cover to double type
im = double(imread('face.jpg'));
%read mask image
mask = double(imread('faceMask.png'));
h = -20;
v = -20;
%call intelligentResize to get the energy image
[totalCost, imOut] = intelligentResize(im,-20,-20,W,mask,-100);
fprintf("total cost of all seams with h=%d and v=%d is %d\n", h, v, totalCost);

imwrite(uint8(stretch(imOut)), 'faceResized.png');