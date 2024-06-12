function f = rbfkernel(rij,kernel)
  A=0.0095;
  B=0.0095;
  C=1;
  D=1;
  switch kernel
    case "linear_spline"
      f = rij; % linear spline
    case "cubic_spline"
      f = rij.^3; % cubic spline
    case "thin_plate_spline"
      f = (rij.^2).*log(rij); % thin plate spline
    case "Gaussian"
      f = exp((A).*rij); % Gaussian
    case "Multiquadraic"
      f = sqrt(1.0+((B).*rij).^2); % Multiquadraic
    case "inverse_Quadric"
      f = 1/(1+((C).*rij).^2); % inverse Quadric
    case "inverse_Multiquadraic"
      f = 1/(sqrt(1+((D).*rij).^2)); % inverse Multiquadraic
  end
end


% function f = rbfkernel(rij, kernel, sigma)
%     switch kernel
%         case "linear_spline"
%             f = rij; % linear spline
%         case "cubic_spline"
%             f = rij .^ 3; % cubic spline
%         case "thin_plate_spline"
%             f = (rij .^ 2) .* log(rij); % thin plate spline
%         case "Gaussian"
%             f = exp(-(rij / sigma) .^ 2); % Gaussian
%         case "Multiquadraic"
%             f = sqrt(1.0 + ((sigma * rij) .^ 2)); % Multiquadraic
%         case "inverse_Quadric"
%             f = 1 ./ (1 + ((sigma * rij) .^ 2)); % inverse Quadric
%         case "inverse_Multiquadraic"
%             f = 1 ./ sqrt(1 + ((sigma * rij) .^ 2)); % inverse Multiquadraic
%     end
% end
