function yb = rbfpredictor(x_predict,c,x_training,kernel)
A=zeros(size(x_predict,2),size(x_training,2));
for i=1:size(x_predict,2)
    ri=x_predict(:,i);
    for j=1:size(x_training,2)
        rj=x_training(:,j);
        rij=sqrt(sum((ri-rj).*(ri-rj)));
        A(i,j)=rbfkernel(rij,kernel);
  end
end
yb=(A*c)';
end


% function yb = rbfpredictor(x_predict, c, x_training, kernel, sigma)
%     A = zeros(size(x_predict, 2), size(x_training, 2));
%     for i = 1:size(x_predict, 2)
%         ri = x_predict(:, i);
%         for j = 1:size(x_training, 2)
%             rj = x_training(:, j);
%             rij = sqrt(sum((ri - rj) .^ 2));
%             A(i, j) = rbfkernel(rij, kernel, sigma);
%         end
%     end
%     yb = (A * c)';
% end
