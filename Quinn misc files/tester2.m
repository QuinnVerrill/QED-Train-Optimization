x = [1,1,2,2,95,100,4,4];
weights = read_pop();
costs = 0; % initial total cost

for i = 1:2:length(x)
    costs = costs + weights(x(i),x(i+1));
end

station_cost = exp(costs); % <-- paramter to tune