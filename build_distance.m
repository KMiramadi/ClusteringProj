function S = build_distance(items,weights)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
[~,n]=size(items);
S=zeros(n);
for i=1:n
    for j=1:n
        S(i,j)=norm(weights.*(items(:,i)-items(:,j)));
    end
end
end

