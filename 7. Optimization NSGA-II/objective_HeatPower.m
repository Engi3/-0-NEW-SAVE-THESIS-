
function [f, g] = objective_HeatPower(x, X_train, results)
    g = 0;
% minimization
    f(1,1) = (rbfpredictor(x,results.linear_spline.ElectricalPower_coeff,X_train,results.linear_spline.kernel));
% maximization
    f(2,1) = -(rbfpredictor(x,results.linear_spline.HeatRejection_coeff,X_train,results.linear_spline.kernel));
end
% model.ElectricalPower_Predicted = rbfpredictor(X_test,model.ElectricalPower_coeff,X_train,model.kernel);
% model.HeatRejection_Predicted = rbfpredictor(X_test,model.HeatRejection_coeff,X_train,model.kernel);
% output
% ppareto = best X
% fpareto = Y


% function [f, g] = objective_COP(x, model_EP, model_Load)
%     % ใช้โมเดลในการทำนาย EPower และ Load\
%     g=0;
%     EPower = PredictFunctionValues(model_EP.Data, model_EP.Surrogate, x, ...
%         model_EP.lambda, model_EP.gamma, model_EP.dmodel, model_EP.beta, ...
%         model_EP.mmodel, model_EP.w_m);
%     Load = PredictFunctionValues(model_Load.Data, model_Load.Surrogate, x, ...
%         model_Load.lambda, model_Load.gamma, model_Load.dmodel, model_Load.beta, ...
%         model_Load.mmodel, model_Load.w_m);
%     
%         f = -(Load/EPower);
%    
% end

% ppareto = best X
% fpareto = Y
