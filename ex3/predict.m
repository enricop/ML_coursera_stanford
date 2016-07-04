function p = predict(Theta1, Theta2, X)
%PREDICT Predict the label of an input given a trained neural network
%   p = PREDICT(Theta1, Theta2, X) outputs the predicted label of X given the
%   trained weights of a neural network (Theta1, Theta2)

% Useful values
m = size(X, 1);
num_labels = size(Theta2, 1);

% You need to return the following variables correctly 
p = zeros(size(X, 1), 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Complete the following code to make predictions using
%               your learned neural network. You should set p to a 
%               vector containing labels between 1 to num_labels.
%
% Hint: The max function might come in useful. In particular, the max
%       function can also return the index of the max element, for more
%       information see 'help max'. If your examples are in rows, then, you
%       can use max(A, [], 2) to obtain the max for each row.
%

% The matrices Theta1 and Theta2 contain the parameters for each unit in rows.
% Specifically, the first row of Theta1 corresponds to the first hidden unit in the second layer.

% The matrix X contains the examples in rows.
A1 = [ones(m, 1) X]; % I add the column of 1’s to the matrix X before the examples since it is the 0 element
Z2 = A1 * Theta1';
A2 = [ones(m, 1) sigmoid(Z2)];
Z3 = A2 * Theta2';
h = sigmoid(Z3);

[value, max_index] = max(h, [], 2);
p = max_index;