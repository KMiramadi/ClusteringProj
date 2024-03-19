%% Question 3 HW2
bengali=load('bengali_cleanup.mat');
serieses=bengali.timeseries;

A=imread("bengali_map.png");
imshow(A); 
hold on
plot(bengali.y_coords,bengali.x_coords,'o')
title("Plot of all measurement stations")
legend('Measurement station')

distance_mat=zeros(size(serieses,1));
s = @(x,y) norm(x-y);
for i=1:size(serieses,1)
    for j=1:size(serieses,1)
        distance_mat(i,j)=s(serieses(i,:),serieses(j,:));
    end
end

disp(["Distance between 102 and 280 is: ", num2str(distance_mat(102,280))])
disp(["Distance between 102 and 10 is: ", num2str(distance_mat(102,10))])
disp(["Distance between 280 and 10 is: ", num2str(distance_mat(280,10))])

%%
%Construct K-NN matrix
k=3;
W=zeros(size(distance_mat));
for i=1:size(W,1)
    [~,I]=sortrows(distance_mat(i,:)');
    W(i,I(2:k+1))=1;
    W(I(2:k+1),i)=1;
end

plot(graph(W))
title("Graph using k-NN, k=3")
%%
NN=2;
[idx]=unRatioCut(serieses,7,NN);
for i=1:7
    figure
    imshow(A)
    hold on
    for k=1:length(idx)
        if idx(k)==i
            plot(bengali.y_coords(k),bengali.x_coords(k),'.r','MarkerSize',14); hold on
        end
        title("Cluster number " + i)
    end
    hold off
end
%%
figure
imshow(A)
hold on
for k=1:length(idx)
     if idx(k)==1
         plot(bengali.y_coords(k),bengali.x_coords(k),'.r','MarkerSize',14); hold on
     end
        title("Cluster number " + 1)
end
hold off
figure
imshow(A)
hold on
for k=1:length(idx)
     if idx(k)==2
         plot(bengali.y_coords(k),bengali.x_coords(k),'.r','MarkerSize',14); hold on
     end
        title("Cluster number " + 2)
end
    hold off
    

    figure
imshow(A)
hold on
for k=1:length(idx)
     if idx(k)==3
         plot(bengali.y_coords(k),bengali.x_coords(k),'.r','MarkerSize',14); hold on
     end
        title("Cluster number " + 3)
end
    hold off
    

figure
imshow(A)
hold on
for k=1:length(idx)
     if idx(k)==4
         plot(bengali.y_coords(k),bengali.x_coords(k),'.r','MarkerSize',14); hold on
     end
        title("Cluster number " + 4)
end
    hold off
    

figure
imshow(A)
hold on
for k=1:length(idx)
     if idx(k)==5
         plot(bengali.y_coords(k),bengali.x_coords(k),'.r','MarkerSize',14); hold on
     end
        title("Cluster number " + 5)
end
    hold off
    

figure
imshow(A)
hold on
for k=1:length(idx)
     if idx(k)==6
         plot(bengali.y_coords(k),bengali.x_coords(k),'.r','MarkerSize',14); hold on
     end
        title("Cluster number " + 6)
end
    hold off
figure
imshow(A)
hold on
for k=1:length(idx)
     if idx(k)==7
         plot(bengali.y_coords(k),bengali.x_coords(k),'.r','MarkerSize',14); hold on
     end
        title("Cluster number " + 7)
end
    hold off
    

%%
figure
imshow(A)
hold on
for k=1:length(idx)
     if idx(k)==4
         plot(bengali.y_coords(k),bengali.x_coords(k),'.r','MarkerSize',14); hold on
     end
        title("Cluster number " + 4)
end
    hold off
    






