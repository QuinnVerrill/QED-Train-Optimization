function [convScore] = networkScore(x)
    % takes in three input vectors and a weights matrix, outputs overall
    % convenience score 
    
    % if the coordinates of st1 are zero, it's contribution to the overall
    % convenience score is zero
    weights = read_pop();
%%% zero condition for st 1
    if x(1) == 0 && x(2) == 0
        scores(1) = 0;
    else 
        % get the score for this station and store it in scores vector
        scores(1) = stationScore([x(1),x(2)],weights); 
    end
%%% zero condition for st 2
    if x(3) == 0 && x(4) == 0
        scores(2) = 0;
    else 
        % get the score for this station and store it in scores vector
        scores(2) = stationScore([x(3),x(4)],weights); 
    end
%%% zero condition for st 3
    if x(5) == 0 && x(6) == 0
        scores(3) = 0;
    else 
        % get the score for this station and store it in scores vector
        scores(3) = stationScore([x(5),x(6)],weights); 
    end
%%% zero condition for st 4
    if x(7) == 0 && x(8) == 0
        scores(4) = 0;
    else 
        % get the score for this station and store it in scores vector
        scores(4) = stationScore([x(7),x(8)],weights); 
    end
%%% zero condition for st 5
    if x(9) == 0 && x(10) == 0
        scores(5) = 0;
    else 
        % get the score for this station and store it in scores vector
        scores(5) = stationScore([x(9),x(10)],weights); 
    end
%%% zero condition for st 6
    if x(11) == 0 && x(12) == 0
        scores(6) = 0;
    else 
        % get the score for this station and store it in scores vector
        scores(6) = stationScore([x(11),x(12)],weights); 
    end
   
    V = 100; %km/h <-- input from other system
    net_travel_time = travelTime(x,V);
    % mean of all stations
    A = 11/12; % <-- paramters to tune
    B = 1/12; % <-- paramters to tune
    convScore = -1 * (A * mean(scores)) + (B * net_travel_time); 
    
end 