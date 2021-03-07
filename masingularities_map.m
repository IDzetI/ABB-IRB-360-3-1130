n = 101;

map = zeros(n,n,n,4);
for i = 1:n
    for j = 1:n 
        for k = 1:n
             map(i,j,k,:)=FK([i/n*pi-pi/2 j/n*pi-pi/2 k/n*pi-pi/2 0]);
        end
    end    
end

x = zeros(n*n*n,1);
y = zeros(n*n*n,1);
z = zeros(n*n*n,1);

for i = 1:n
    for j = 1:n 
        for k = 1:n
             x((i-1)*n*n+(j-1)*n+k)=map(i,j,k,1);
             y((i-1)*n*n+(j-1)*n+k)=map(i,j,k,2);
             z((i-1)*n*n+(j-1)*n+k)=map(i,j,k,3);
        end
    end    
end

scatter3(x,y,z,'.')
title('Work space of ABB IRB 360-3/1130')
xlabel('X,mm')
ylabel('Y,mm')
zlabel('Z,mm')
saveas(gcf,'Work space of ABB IRB 360-3/1130.png')


singularity_map_q1 = zeros(n-1,n-1,n-1);
singularity_map_q2 = zeros(n-1,n-1,n-1);
singularity_map_q3 = zeros(n-1,n-1,n-1);
for i = 1:n-1
    for j = 1:n-1 
        for k = 1:n-1
             singularity_map_q1(i,j,k)=norm([
                 [map(i+1,j,k,1)-map(i,j,k,1)]
                 [map(i+1,j,k,2)-map(i,j,k,2)]
                 [map(i+1,j,k,3)-map(i,j,k,3)]
                 [map(i+1,j,k,4)-map(i,j,k,4)]
                 ]);
              singularity_map_q2(i,j,k)=norm([
                 [map(i,j+1,k,1)-map(i,j,k,1)]
                 [map(i,j+1,k,2)-map(i,j,k,2)]
                 [map(i,j+1,k,3)-map(i,j,k,3)]
                 [map(i,j+1,k,4)-map(i,j,k,4)]
                 ]);
              singularity_map_q3(i,j,k)=norm([
                 [map(i,j,k+1,1)-map(i,j,k,1)]
                 [map(i,j,k+1,2)-map(i,j,k,2)]
                 [map(i,j,k+1,3)-map(i,j,k,3)]
                 [map(i,j,k+1,4)-map(i,j,k,4)]
                 ]);
        end
    end    
end

pointsize = 150;

[X,Y,Z] = ndgrid(1:size(singularity_map_q1,1), 1:size(singularity_map_q1,2), 1:size(singularity_map_q1,3));
scatter3(X(:)/n*pi-pi/2, Y(:)/n*pi-pi/2, Z(:)/n*pi-pi/2,pointsize, singularity_map_q1(:),'.');
% colorbar
title('Singularity map q_1 of ABB IRB 360-3/1130')
xlabel('q_1,rad')
ylabel('q_2,rad')
zlabel('q_3,rad')
saveas(gcf,'Singularity map q1 of ABB IRB 360-3-1130.png')

[X,Y,Z] = ndgrid(1:size(singularity_map_q2,1), 1:size(singularity_map_q2,2), 1:size(singularity_map_q2,3));
scatter3(X(:)/n*pi-pi/2, Y(:)/n*pi-pi/2, Z(:)/n*pi-pi/2,pointsize, singularity_map_q2(:),'.');
% colorbar
title('Singularity map q_2 of ABB IRB 360-3/1130')
xlabel('q_1,rad')
ylabel('q_2,rad')
zlabel('q_3,rad')
saveas(gcf,'Singularity map q2 of ABB IRB 360-3-1130.png')

[X,Y,Z] = ndgrid(1:size(singularity_map_q3,1), 1:size(singularity_map_q3,2), 1:size(singularity_map_q3,3));
scatter3(X(:)/n*pi-pi/2, Y(:)/n*pi-pi/2, Z(:)/n*pi-pi/2,pointsize, singularity_map_q3(:),'.');
% colorbar
title('Singularity map q_3 of ABB IRB 360-3/1130')
xlabel('q_1,rad')
ylabel('q_2,rad')
zlabel('q_3,rad')
saveas(gcf,'Singularity map q3 of ABB IRB 360-3-1130.png')


singularity_map = singularity_map_q1+singularity_map_q2+singularity_map_q3;
[X,Y,Z] = ndgrid(1:size(singularity_map,1), 1:size(singularity_map,2), 1:size(singularity_map,3));
scatter3(X(:)/n*pi-pi/2, Y(:)/n*pi-pi/2, Z(:)/n*pi-pi/2,pointsize, singularity_map(:),'.');
% colorbar
title('Singularity map of ABB IRB 360-3/1130')
xlabel('q_1,rad')
ylabel('q_2,rad')
zlabel('q_3,rad')
saveas(gcf,'Singularity map of ABB IRB 360-3-1130.png')














