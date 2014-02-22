clear;
cd /home/hadoop-user/Downloads/DATA/ex2Data
x = load('ex2x.dat');
y = load('ex2y.dat');
tic
% init theta
theta = zeros(1,size(x,2)+1);
%caculate_sum(theta,x,y);
alpha = 0.007;
for k = 1:1000
    for i=1:length(y)
        x_vec=x(i,:);
        y_vec=y(i,:);
        theta = caculate_theta(theta,x_vec,y_vec,alpha);
        
    end
end
theta
toc