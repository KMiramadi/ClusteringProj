function [idx] = unRatioCut(X,k,NN)
%X data matrix, k number of clusters

distance_mat=zeros(size(X,1));
s = @(x,y) norm(x-y);
for i=1:size(X,1)
    for j=1:size(X,1)
        distance_mat(i,j)=s(X(i,:),X(j,:));
    end
end
W=zeros(size(distance_mat));
for i=1:size(W,1)
    [~,I]=sortrows(distance_mat(i,:)');
    W(i,I(2:NN+1))=1;
    W(I(2:NN+1),i)=1;
end

%L=laplacian(graph(W));
L=create_deg(W)-W;
%[U, ~]=eigs(L,k,'smallestabs');
[U,~]=eig(L);
idx=kmeans(U(:,1:k),k);

end

