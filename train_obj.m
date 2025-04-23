function y=train_obj(x)

global cd_mdl

cd=predict(cd_mdl,x);
y=cd;

end
