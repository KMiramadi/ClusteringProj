    function [D] = create_deg(W)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

[n,~]=size(W);
D=zeros(n,n);
for i=1:n
    deg_i=0;
    for j=1:n
        if(W(i,j)>0)
            deg_i=deg_i+W(i,j);
        end
        D(i,i)=deg_i;
    end

end

