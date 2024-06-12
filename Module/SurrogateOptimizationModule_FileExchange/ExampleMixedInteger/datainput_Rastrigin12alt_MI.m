function Data= datainput_Rastrigin12alt_MI

%unconstrained
%--------------------------------------------------------------------------
%Copyright (c) 2012 by Juliane Mueller
%
% This file is part of the surrogate model module toolbox.
%
%    along with Foobar.  If not, see <http://www.gnu.org/licenses/>.
%--------------------------------------------------------------------------
%Author information
%Juliane Mueller
%Tampere University of Technology, Finland
%juliane.mueller2901@gmail.com
%--------------------------------------------------------------------------
%
Data.xlow=-10*ones(1,12); %variable lower bounds
Data.xup=30*ones(1,12); %variable upper bounds
Data.objfunction=@(x)sum((x.^2) - cos(2*pi*x),2); %objective function handle
Data.integer=(1:5); %indices of integer variables
Data.continuous=(6:12); %indices of continuous variables
Data.dim=12; %problem dimension
end