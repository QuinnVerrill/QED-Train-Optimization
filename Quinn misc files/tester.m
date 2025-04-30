clear;
weights = read_pop();
%for 6 stations
x = [randi([1,133]),randi([1,307]),randi([1,133]),randi([1,307]),randi([1,133]),randi([1,307]),randi([1,133]),randi([1,307]),randi([1,133]),randi([1,307]),randi([1,133]),randi([1,307])];


weights = read_pop();
costs = 0; % initial total cost

%Station Cost
index1 = 0;
for i = 1:2:length(x)
    index1 = index1 + 1;
    costs = costs + weights(x(i),x(+1));
end

station_cost = 55000000 + exp(21 * costs); % <-- paramter to tune %make along the order of 500mil

%Rail Cost
index2 = 0;
dists = [];
for k = 1:2:length(x)-1
    for l = 1:2:length(x)-1
     
        if x(k) == x(l)   
           continue
        else 
            index2 = index2 + 1;
            dists(index2) = norm([x(k),x(k+1)]-[x(l),x(l+1)]);
        end
    end 
end
total_distance = sum(dists);
track_cost = total_distance * 160000; %$160,000 per kilometer of track

network_cost = station_cost + track_cost;