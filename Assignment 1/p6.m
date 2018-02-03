function w = p6(X_Train, Y_Train, iterNum, wInit, alpha)
% Function p6 performs logistic regression to train 2-label classifer
% Inputs    X_train - an input training samples(size n × d) 
%           Y_train - their true class (size n × 1)
%           iterNum - the number of iterations
%           wInit - initial weight for liner classifier
%           alpah - learning rate
% Outputs   w - best weights w (size(d + 1) × 1) you find
% ====================== My IMPLEMENTATION HERE ===========================
%initial w with argument wInit for first time usage
w = wInit;
%add one column to X_Train with ones() 
Z = [ones(size(X_Train, 1), 1) X_Train];
    %define nested sigmoid function
    function g = sigmoid(z)
    %SIGMOID Compute sigmoid function
    %   g = SIGMOID(z) computes the sigmoid of z.
    g = 1./(ones(size(z))+exp(-z));
    end
for iteration = 1:iterNum
    %conver Y_Train from label 2 to label 0 in order to compute the loss
    %between Y_Train and sigmoid(Z*a)
    Y_Train(Y_Train == 2) = 0;
    %define a loss function -ylog(sigmoid(Z*w))-(1-y)log(1-sigmoid(Z*w))
    %calculate the total loss for current weight
    total_loss = (-1.*Y_Train)'*log(sigmoid(Z*w))-(1.-Y_Train)'*log(1.-sigmoid(Z*w));
    fprintf("In iteration %d, the total loss is %f\n", iteration, total_loss);
    %follow the procedure in lecture to update w
    %w = w + alpha* sum(repmat((Y_Train - sigmoid(Z*w)), 1, size(Z, 2)).*Z, 1)';
    %user matrix multiply to iterate w
    w = w + alpha * ((Y_Train - sigmoid(Z*w))'*Z)';
end

% =========================================================================

end