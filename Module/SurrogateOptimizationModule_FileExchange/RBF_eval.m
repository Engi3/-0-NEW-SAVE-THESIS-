function Yest=RBF_eval(X,S,lambda,gamma,flag)

%--------------------------------------------------------------------------
%Copyright (c) 2012 by Juliane Mueller
%
% This file is part of the surrogate model module toolbox.
%
%--------------------------------------------------------------------------
%Author information
%Juliane Mueller
%Tampere University of Technology, Finland
%juliane.mueller2901@gmail.com
%--------------------------------------------------------------------------
%
%input:
%X are points where function values should be calculated
%S are points where the function values are known
%lambda parameter vector
%gamma contains the parameters of the optional polynomial tail
%flag is a string indicating which RBF to be used
%output: 
%the estimated function values at the points in X
%--------------------------------------------------------------------------

[mX,nX]=size(X); %dimensions of the points where function value should be predicted
[mS,nS]=size(S); %dimesnions of sample sites taken so far 
if nX~=nS %check that both matrices are of the right shape
    X=X';
    [mX,nX]=size(X);
end

R=zeros(mX,mS); %compute pairwise distances of points in X and S
for ii = 1:mX
    for jj = 1:mS
        R(ii,jj)=norm(X(ii,:)-S(jj,:));
    end
end

rho=2;
 
if strcmp(flag,'cubic')
    Phi= R.^3;
elseif strcmp(flag,'TPS')
    R(R==0)=1;
    Phi=R.^2.*log(R);
elseif strcmp(flag,'linear')
    Phi=R;
elseif strcmp(flag,'Gaussian')
    Phi=exp(-R.^2/rho^2);
elseif strcmp(flag,'multiquad')
    Phi=sqrt((R.^2 + rho^2).^3);
elseif strcmp(flag,'invmultiquad')
    Phi=1./sqrt(R.^2 + rho^2);
end
    
Yest1=Phi*lambda; %first part of response surface
Yest2=[X,ones(mX,1)]*gamma; %optional polynomial tail
Yest=Yest1+Yest2; %predicted function value

end %functions