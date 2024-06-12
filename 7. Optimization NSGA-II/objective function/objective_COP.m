% ใช้โมเดลที่เตรียมไว้ในการทำนายค่า EPower และ Load จากตัวแปรต้น x ที่รับเข้ามา 
% จากนั้นหาค่า COP โดย Load / EPower
% แต่ถ้า Load หรือ EPower เป็นค่าติดลบหรือ 0 
% จะคืนค่า infinity เพื่อให้ไม่ติดลบในการหาค่าต่ำสุดของ objective function
% f = objective(x, model_EP, model_Load)
% Input :
%       x   ตัวแปร x ของ objective function
%       model_EP struct ของโมเดล Electric Power
%       model_Load struct ของโมเดล Cooling Load

% สร้าง objective function สำหรับค้นหาค่า x ที่เหมาะสมสำหรับ COP = Load/EPower โดยที่ Load และ EPower ไม่ติดลบ
% x คือตัวแปรต้น ในที่นี้คือ [Lv1CompSucTempC, Lv1CompDisTempC, Lv1CompSUMSlideValve, Lv2CompSucTempC, Lv2CompDisTempC, Lv2CompSUMSlideValve, Lv3CompSucTempC, Lv3CompDisTempC, Lv3CompSUMSlideValve, SwingCompSucTempC, SwingCompDisTempC, SwingCompSlideValve]
% โมเดล model_EP และ model_Load คือโมเดลของ EPower และ Load ตามลำดับ

% % แบบที่ 1 Objective Function แบบมีเงื่อนไขเพื่อป้องกัน
% % การติด - ลบ ของโมเดล Electric Power และ Cooling Load
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
%     % หาค่า COP โดยไม่ให้ Load และ EPower เป็น 0 หรือติดลบ
%     if Load <= 0 || EPower <= 0
%         f = inf;
%     else
%         f = -(Load/EPower);
%     end
% end

% % แบบที่ 2 Objective Function สำหรับหา COP สูงสุด
function [f, g] = objective_COP(x, model_EP, model_Load)
    % ใช้โมเดลในการทำนาย EPower และ Load\
    g=0;
    EPower = PredictFunctionValues(model_EP.Data, model_EP.Surrogate, x, ...
        model_EP.lambda, model_EP.gamma, model_EP.dmodel, model_EP.beta, ...
        model_EP.mmodel, model_EP.w_m);
    Load = PredictFunctionValues(model_Load.Data, model_Load.Surrogate, x, ...
        model_Load.lambda, model_Load.gamma, model_Load.dmodel, model_Load.beta, ...
        model_Load.mmodel, model_Load.w_m);
    
        f = -(Load/EPower);
   
end

% % แบบที่ 3 Objective Function แบบหลายวัตถุประสงค์ 
% function [f, g] = objective_COP(x, model_EP, model_Load)
%     % ใช้โมเดลในการทำนาย EPower และ Load
%     g=0;
%     f(1,1) = PredictFunctionValues(model_EP.Data, model_EP.Surrogate, x, ...
%         model_EP.lambda, model_EP.gamma, model_EP.dmodel, model_EP.beta, ...
%         model_EP.mmodel, model_EP.w_m);
%     f(2,1) = -PredictFunctionValues(model_Load.Data, model_Load.Surrogate, x, ...
%         model_Load.lambda, model_Load.gamma, model_Load.dmodel, model_Load.beta, ...
%         model_Load.mmodel, model_Load.w_m);
% 
% end
