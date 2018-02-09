load('studentCollect.mat');
C = p12(X);
[err, CONF] = p2(C, Y)
fromMatrixtoCSV(C, 'p12.csv');