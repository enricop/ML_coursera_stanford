function [C, sigma] = dataset3Params(X, y, Xval, yval)
%EX6PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = EX6PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%

% trying values in multiplicative steps
values = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30];

% variable to store the min error of all the predictions tested
min_pred_error = Inf;

for i=1:length(values)
	current_C = values(i);
	for j=1:length(values)
		current_sigma = values(j);
    
    % run the SVM training (with C = 1)
		model = svmTrain(X, y, current_C, @(x1, x2) gaussianKernel(x1, x2, current_sigma)); 

    % generate the predictions for the cross validation set
		predictions = svmPredict(model, Xval);
    % compute the prediction error
		prediction_error = mean(double(predictions ~= yval));
		
		if prediction_error < min_pred_error
			min_pred_error = prediction_error;
			C = current_C;
			sigma = current_sigma;
		end
	end
end	