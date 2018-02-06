function W = p8(X_train, Y_train, iterNum, wInit, alpha)
% Function p8 performs training the better weight with multiclass(m) Perceptron single sample rule
% Inputs    X_train - an input training samples size n*d
%           Y_train - their true class size n*1
%           iterNum - the number of iterations
%           wInit - initial weight for liner classifier (m*(d+1))
%           alpah - fixed learning rate
% Outputs   w - best weights w (size(d + 1) × 1) you find
% ====================== My IMPLEMENTATION HERE ===========================
%add bias column to X to make size is n * (d+1)
X_train = [ones(size(X_train, 1), 1) X_train];
%set the initial weight to W
W = wInit;
for iteration = 1 : iterNum
    %inside of the iteration, for each X_train sample, perform the
    %perceptron loss function to update w
    for i = 1: size(X_train, 1)
        %init L(w) as same size as W
        weight_loss = zeros(size(W));
        %get ith sample and Y_train(i) should be the correct class label
        x_i = X_train(i, :);
        %get the predict class after Xi*W'
        [v, index] = max(x_i * W', [], 2);
        %if the predict is incorrect, generate the weight loss matrix with
        %row having largest Xi*W' to be -X(i) and the row having correct
        %class(Y_train(i)) to be X(i)
        if(Y_train(i) ~= index)
            weight_loss(index, :) = -1 * x_i;
            weight_loss(Y_train(i), :) = x_i;
            %udpate W with gradient of loss
            W = W + alpha * weight_loss;
        end
    end

end
% =========================================================================
end