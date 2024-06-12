function A = rbf01(X,kernel)
[n,M] = size(X);
for i=1:M
    ri=X(:,i);
    A(i,i)=0;
    for j=(i+1):M
        rj=X(:,j);
        rij=sqrt(sum((ri-rj).*(ri-rj)));
        A(i,j)=rbfkernel(rij,kernel);
        A(j,i)=A(i,j);
   end
end
end


% function A = rbf01(X, kernel, sigma)
%     [n, M] = size(X);
%     A = zeros(M, M);
%     for i = 1:M
%         ri = X(:, i);
%         A(i, i) = 0;
%         for j = (i+1):M
%             rj = X(:, j);
%             rij = sqrt(sum((ri - rj) .^ 2));
%             A(i, j) = rbfkernel(rij, kernel, sigma);
%             A(j, i) = A(i, j);
%         end
%     end
% end
