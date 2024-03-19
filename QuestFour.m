zalando=load("hw2_zalando_new.mat");
%zalando_plot(zalando.items(:,500))  %Pants and tops
x=2;
W_weight=ones(28,28); W_weight(12:16,:)=x;
w_weight=W_weight(:);
w_weight=w_weight/norm(w_weight);
zalando_plot(w_weight)
weights=ones(size(zalando.items,1),1);

S=build_distance(zalando.items,w_weight);
%S_2=build_distance(zalando.items,w_weight);

%%  
figure
subplot(2,1,1)
zalando_plot(zalando.items(:,1))
title("First item")
pick_min=S(1,:);
pick_min(pick_min==0)=Inf;
[~,index]=min(pick_min);
subplot(2,1,2)
zalando_plot(zalando.items(:,index))
title("Its closest item")
%%
figure
subplot(2,1,1)
zalando_plot(zalando.items(:,2))
title("Second item")
pick_min=S(2,:);
pick_min(pick_min==0)=Inf;
[~,index]=min(pick_min);
subplot(2,1,2)
zalando_plot(zalando.items(:,index))
title("Its closest item")
hold off
%% Build weight mat
alpha=0.5;
n=size(S,1);
W=zeros(n,n);
  for i=1:n
      sgma=std(S(:,i));
      for j=1:n
          W(i,j)=exp(-alpha*S(i,j)^2/sgma^2);
      end
  end
  W=W-diag(diag(W));
  W=(W+W')/2; % We want an undirected graph
  D=create_deg(W);
  [U,q]=eig(D-W);
%%
v_2=U(:,2);
plot(v_2/norm(v_2),'*');
%ylim([-2e-3, 1.1e-3])
header=title('Plot of $\frac{v_2}{||v_2||}$','interpreter','latex');
set(header,'Fontsize',15)
xlabel("Vector element")
ylabel("Value")
%%
cluster_vector=zeros(size(U,1),1);
tau=median(v_2);

for i=1:length(cluster_vector)
    if(v_2(i)>tau)
        cluster_vector(i)=1;
    else
        cluster_vector(i)=2;
    end
end

%%
correct=zalando.correct;
wrong=[];
counter=0;
for i=1:n
    if (cluster_vector(i)==correct(i))
        counter=counter+1;
    else
        wrong=[wrong i];
    end
end

disp("Correct is: " +counter/1000)

%%
wrong=wrong(1:4);
Clos_neighbor=zeros(4,1);
for k=1:length(wrong)
    minim=S(wrong(k),:);
    minim(minim==0)=Inf;
    t=1;
    while t
        [~,ind]=min(minim);
        if(correct(ind)==correct(wrong(k)))
            minim(ind)=Inf;
        else
            t=0;
            Clos_neighbor(k)=ind;
        end
    end
end

        



%%
figure
subplot(2,4,1)
zalando_plot(zalando.items(:,wrong(1)))
title(wrong(1)+ ": Clas.=" + cluster_vector(wrong(1)) + " Cor. = " + correct(wrong(1)))
subplot(2,4,2)
zalando_plot(zalando.items(:,wrong(2)))
title(wrong(2)+ ": Clas.=" + cluster_vector(wrong(2)) + " Cor. =" + correct(wrong(2)))
subplot(2,4,3)
zalando_plot(zalando.items(:,wrong(3)))
title(wrong(3)+ ": Clas.=" + cluster_vector(wrong(3)) + " Cor. =" + correct(wrong(3)))
subplot(2,4,4)
zalando_plot(zalando.items(:,wrong(4)))
title(wrong(4)+ ": Clas.=" + cluster_vector(wrong(4)) + " Cor. = " + correct(wrong(4)))

subplot(2,4,5)
zalando_plot(zalando.items(:,Clos_neighbor(1)))
header1=title(Clos_neighbor(1) + ": dist from " + wrong(1) + ": " + S(wrong(1),Clos_neighbor(1)) );
set(header1,'FontSize', 10)
subplot(2,4,6)
zalando_plot(zalando.items(:,Clos_neighbor(2)))
header2=title(Clos_neighbor(2) + ": dist from " + wrong(2) + ": " + S(wrong(2),Clos_neighbor(2)) );
set(header2,'FontSize', 10)
subplot(2,4,7)
zalando_plot(zalando.items(:,Clos_neighbor(3)))
header3=title(Clos_neighbor(3) + ": dist from " + wrong(3) + ": " + S(wrong(3),Clos_neighbor(3)) );
set(header3,'FontSize', 10)
subplot(2,4,8)
zalando_plot(zalando.items(:,Clos_neighbor(4)))
header4=title(Clos_neighbor(4) + ": dist from " + wrong(4) + ": " + S(wrong(4),Clos_neighbor(4)) );
set(header4,'FontSize', 10)
%%


