function [X_out, Y_out] = p1(X, Y, l1, l2)
% Function p1 extracts data for 2-class problem from multiclass data
% Inputs  samples in matrix X, true labels in column vector Y, 
%           and two distinct integers specifying labels l1, l2.
% Outputs extract from X only the samples whose true label is l1 or l2 and store them in output matrix X_out. 
%           It should also store the (renamed) corresponding labels in Y_out.

% ====================== My IMPLEMENTATION HERE ======================
%set the new class output values for Y_out
if(l1 > l2)
    y_value_l1 = 2;
    y_value_l2 = 1;
else
    y_value_l1 = 1;
    y_value_l2 = 2;
end
%find the rows from X whose label(Y) is l1 and l2
X_l1 = X(find(Y == l1), :);
X_l2 = X(find(Y == l2), :);

%create new Y vectors for l1/l2 with the same size X_l1/Xl2 with the new classified value
Y_l1 = ones(size(X_l1, 1), 1) * y_value_l1;
Y_l2 = ones(size(X_l2, 1), 1) * y_value_l2;

%combine together as X_out and Y_out
X_out = [X_l1; X_l2];
Y_out = [Y_l1; Y_l2];
% =========================================================================
end