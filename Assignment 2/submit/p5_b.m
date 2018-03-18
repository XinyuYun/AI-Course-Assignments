load q5.mat;
%read color image and cover to double type
im_face = double(imread('faceSmall.jpg'));
im_lift = double(imread('liftSmall.jpg'));

[label_face, eng] = segmentGC(im_face, scribblesFaceSmall, 50, 0, 1000);
fprintf('final energy for face image is %d \n', eng);
imwrite(uint8(stretch(label_face)), 'faceL.png');

[label_lift, eng] = segmentGC(im_lift, scribblesLiftSmall, 50, 0, 1000);
fprintf('final energy for lift image is %d \n', eng);
imwrite(uint8(stretch(label_lift)), 'liftL.png');