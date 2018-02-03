load A1;

[X_train, Y_train] = p1(X_train, Y_train, 4, 9);
[X_test, Y_test] = p1(X_test, Y_test, 4, 9);
for iterNum = [100, 1000, 10000]
    fprintf("When iteration is %d\n", iterNum);
    [err, CONF] = p2(p4(p5(X_train, Y_train, iterNum), X_test), Y_test);
    fprintf("test error is %f\n", err);
end

