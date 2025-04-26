function [c, ceq] = nonlincon_network(x)
    global cd_mdl
    
    %%% Network constraints
    
    % distance constraint setup
    distCon = 35; % distance threshold <-- parameter to tune
    index = 2; % starting from the second constraint.
    num_stations = length(x) / 2;
    % for loop to generate pairwise distance constraints between each station
    for i = 1:num_stations
        for j = i+1:num_stations  % To avoid duplicate constraints (e.g., (1,2) and (2,1))
            c(index) = distCon - norm([x(2*i-1), x(2*i)] - [x(2*j-1), x(2*j)]);
            index = index + 1;
        end
    end
    
    %minimum conv score constraint
    ceq = [];
end
