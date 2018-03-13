%filter matrix F
F = [ 1 2 0 -2 -1];
%read color image and cover to double type
im = double(imread('face.jpg'));
%call computeEngGrad to get the energy image
eng = computeEngGrad(im,F);
%sum of all values in eng image(not absolute values)
result = sum(eng(:))

imwrite(uint8(stretch(eng)), 'faceEngG.jpg');