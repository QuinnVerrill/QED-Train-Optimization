station_loc = [100,200];
weights = read_pop();

% grabbing size of weights
[m, n] = size(weights);

% blank matrix
raw_distances = zeros(m, n);

% calculating distances from station loc to each other loc in the weights
% matrix & storing it in a matrix of distances
for r = 1:m
    for c = 1:n
        raw_distances(r, c) = sqrt((r - station_loc(1))^2 + (c - station_loc(2))^2);
    end
end

% normalizing the distances to a scale of 0 to 10 
raw_distances_row = reshape(raw_distances, [1,n*m]);
distance_norm_row = normalize(raw_distances_row,2,"range", [0,10]);
distance_norm = reshape(distance_norm_row,[m,n]);

 % scaling each normalized distance value by weights matrix
distance_weighted = distance_norm .* weights;

% summing and averaging all distances into one rating 0 to 1
station_score = mean(distance_weighted(:));