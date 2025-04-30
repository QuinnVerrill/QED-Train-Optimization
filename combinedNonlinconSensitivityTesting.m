function [c, ceq] = combinedNonlinconSensitivityTesting(x,input)
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
    
    %minimum conv score constrain6
    
    %%% Train Optimization constraints   
    cd = predict(cd_mdl,x(13:16));
    v = TrainVelocity(cd);
    minVel = 70; %paramter to tune!!!!!! (in m/s)
    minCars = 6; %paramater to tune!!!! assuming 80 passengers per car - 480 capacity 
    %setting maximum velocity & minimum velocity
    c(index+1) = v - x(21); %x(21) is max velocity set by saftey subsystem 
    c(index+2) = minVel - v;
    c(index+3) = minCars - x(16);
    
   
    %%% Train Saftey Constraints
    % maximum number of accidents per year
    maxAccidents = 3; % paramater to tune!!!!!!!
    c(index+4) = accident_count_function(x(16:21)) - maxAccidents;
   
    ceq = [];
end
