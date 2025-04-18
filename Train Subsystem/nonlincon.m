function [c,ceq]=nonlincon(x)

global cd_mdl

cd=predict(cd_mdl,x);
v=TrainVelocity(cd);
c(1)=v-83;
ceq=[];
end
