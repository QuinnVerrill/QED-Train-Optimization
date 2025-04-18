function V = TrainVelocity(Cd)
    rho = 1.293; % Density of Air (kg m^-3)
    % The following is modeled off the N-700 Series Shinkansen
    A = 9.773; % Cross Sectional Area of Train (m^2)
    P = 305000*5; % Power(W) (Power of Traction Motor * Number of Motors)
    %P = 3.5*305000*num_cars; % Power(W) 
    %M = 44687.5 * num_cars; % Weight of train(kg)
    
    V = ((2 * P)/(rho * Cd * A))^(1/3);
    kph = V * 3.6;
    %fprintf('Maximum Speed %g kph',kph);
end