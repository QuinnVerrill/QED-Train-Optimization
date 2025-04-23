function [network_cost] = networkCost(x)
    weights = read_pop();
    costs = 0; % initial total cost
    
    % round x(i) and x(i+1) to integers, just in case
    for i = 1:2:length(x)
        row_idx = round(x(i));
        col_idx = round(x(i+1));
        % Check if indices are within bounds
        if row_idx >= 1 && row_idx <= size(weights, 1) && col_idx >= 1 && col_idx <= size(weights, 2)
            costs = costs + weights(row_idx, col_idx);
        else
            % Handle out of bounds cases (optional)
            costs = costs + 0; % or set a penalty, e.g., Inf
        end
    end

    network_cost = exp(3.5 * costs); % <-- paramter to tune
end