function [weights] = read_pop();
    [A,R] = readgeoraster('jpn_pd_2020_1km.tif');
    
    A = A(1041:1173, 1746:2052);
    %data cleanup 
    A(97, 72:76) = linspace(458,1575,5);
    A(98, 72:75) = linspace(181,562,4);
    A(14, 235:238) = linspace(5,1,4);
    A(15,240) = 3.2;
    
    weights = normalize(A,"range",[0,1]);
end 

