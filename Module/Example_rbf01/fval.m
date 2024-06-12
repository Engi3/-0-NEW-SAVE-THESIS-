function fval = rbfobj(x,X_train,Y_train,X_test,Y_test,kernel)
% Compute objective value for RBF model with given hyperparameters

% Compute predictions for test set
y_pred = rbfpredictor(X_test,x',X_train,kernel);

% Compute root mean squared error
fval = sqrt(mean((y_pred-Y_test).^2));
end
