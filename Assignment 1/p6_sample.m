load A1
[X_train, Y_train] = p1(X_train, Y_train, 4, 9);
[X_test, Y_test] = p1(X_test, Y_test, 4, 9);

iterNum = 30;
wInit = ones(size(X_train, 2)+1, 1);
alpha = 0.1;

w = p6(X_train,Y_train,iterNum,wInit,alpha);
[train_err, train_CONF] = p2(p4(w, X_train), Y_train)
[err, CONF] = p2(p4(w, X_test), Y_test)


