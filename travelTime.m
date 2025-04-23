function [net_travel_time] = travelTime(x,V)
    %fix units to be m/s rather than km/hr
    index = 0;
    dists = [];
    for i = 1:2:length(x)-1
        for j = 1:2:length(x)-1
          
            if x(i) == x(j)   
               continue
            else 
                index = index + 1;
                dists(index) = norm([x(i),x(i+1)]-[x(j),x(j+1)]);
            end
        end 
    end
    % line for 4 stations : dists_norm_vec = [1.2974, sum(dists/V), 26.6605] %maximum and minimum travel time algorithm can generate -> normalization bounds
    dists_norm_vec = [1.2974, sum(dists/V), 50]; % normalization bounds adjusted for 6 stations
    norm_travel_times = normalize(dists_norm_vec, "range",[0,1]);
    net_travel_time = norm_travel_times(2);
end 