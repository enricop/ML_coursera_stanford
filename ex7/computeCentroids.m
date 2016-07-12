function centroids = computeCentroids(X, idx, K)
%COMPUTECENTROIDS returs the new centroids by computing the means of the 
%data points assigned to each centroid.
%   centroids = COMPUTECENTROIDS(X, idx, K) returns the new centroids by 
%   computing the means of the data points assigned to each centroid. It is
%   given a dataset X where each row is a single data point, a vector
%   idx of centroid assignments (i.e. each entry in range [1..K]) for each
%   example, and K, the number of centroids. You should return a matrix
%   centroids, where each row of centroids is the mean of the data points
%   assigned to it.
%

% Useful variables
[m n] = size(X);

% You need to return the following variables correctly.
centroids = zeros(K, n);


% ====================== YOUR CODE HERE ======================
% Instructions: Go over every centroid and compute mean of all points that
%               belong to it. Concretely, the row vector centroids(i, :)
%               should contain the mean of the data points assigned to
%               centroid i.
%
% Note: You can use a for-loop over the centroids to compute this.
%

for i=1:K
  % from the idx vector it extracts the elements with the current index
  % it generates a vector of 0 and 1 with the correspoding index as 1
  % a new matrix is build only with rows corresponding to ones of the generated elements
  % each row is a centroid to be used for calculating the mean
	xValuesOfCentroid = X(find(idx==i), :);
  
  %number of centroids
	n = size(xValuesOfCentroid, 1);
  
  % compute the mean of the closest centroids
	centroids(i, :) = sum(xValuesOfCentroid) ./ n;
end