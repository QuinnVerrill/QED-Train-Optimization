clear;
weights = read_pop();

x = [randi([1,133]),randi([1,307]),randi([1,133]),randi([1,307]),randi([1,133]),randi([1,307]),randi([1,133]),randi([1,307]),randi([1,133]),randi([1,307]),randi([1,133]),randi([1,307])];

index = 0;

V = 100; %km/h
for i = 1:2:length(x)-1
    for j = 1:2:length(x)-1
      
        if x(i) == x(j)   
           continue
        else 
            index = index + 1;
            dists(index) = norm([x(i),x(i+1)]-[x(j),x(j+1)]);
        end
     
        %[i,i+1,j,j+1];
    end 
end
% line for 4 stations : dists_norm_vec = [1.2974, sum(dists/V), 26.6605] %maximum and minimum travel time algorithm can generate -> normalization bounds
dists_norm_vec = [1.2974, sum(dists/V), 50];
norm_travel_times = normalize(dists_norm_vec, "range",[0,1]);
net_travel_time = norm_travel_times(2)
