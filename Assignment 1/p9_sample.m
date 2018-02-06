load A1;
%random m * (d+1)
wInit = randn(max(unique(Y_train)), size(X_train, 2)+1);
W_train = p9(X_train, Y_train, 100, wInit, 0.01);
[train_err, train_FONF] = p2(p7(W_train, X_train), Y_train)
[test_err, test_CONF] = p2(p7(W_train, X_test), Y_test)
