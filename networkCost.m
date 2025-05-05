function [network_cost] = networkCost(x)
    weights = read_pop();
    costs = 0; % initial total cost
    % Station Cost
    % finding weights value for each station, summing them to a total value
    % to scale to get total stations cost
    for i = 1:2:length(x(1:12))
        row = round(x(i));
        col = round(x(i)) + 1;
        costs = costs + weights(row,col);
    end
    
    station_cost = 5000000 + exp(12 * costs); % <-- paramter(s) to tune
    
    %Rail Cost
    index2 = 0;
    dists = [];
    % getting distance from each station to each other station to find the
    %total amount of rail line needed for the whole station (in km)
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

end 