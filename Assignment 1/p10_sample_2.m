clear;
load('studentCollect.mat');
load('A1_full.mat');
H = [150, 50];
regularizerWeight = 0.7;
[net, valErr] = p10a(X_train_full, Y_train_full, H, regularizerWeight);
fprintf("validation error is %f \n", valErr);

[C, col] = p10b(X, Y, net);
[err, CONF] = p2(C, Y)
fromMatrixtoCSV(C, 'p12.csv');