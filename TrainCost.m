function C = TrainCost(num_cars)
    num_trains = 10; %parameter to tune!!!
    C = 1750000*num_cars * num_trains;
end