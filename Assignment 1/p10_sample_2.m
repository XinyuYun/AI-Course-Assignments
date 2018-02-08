load A1;
H = [100];
regularizerWeight = 0.8;
[net, valErr] = p10a(X_train, Y_train, H, regularizerWeight);
fprintf("validation error is %f \n", valErr);

[test_err, CONF] = p10b(X_test, Y_test, net)