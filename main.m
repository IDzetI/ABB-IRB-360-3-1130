clear all;

x = [0 0 -1000 0]';
q = IK(x)
visualization(q)

% saveas(gcf,strcat(mat2str(x),'.png'))