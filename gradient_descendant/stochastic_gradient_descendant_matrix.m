clear;
cd /home/hadoop-user/Downloads/DATA/ex2Data
x = load('ex2x.dat');
y = load('ex2y.dat');
tic
m = length(y);
n = size(x,2)+1;
% init theta
theta_vec = zeros(n,1);
alpha = 0.007;
for k = 1:1000
    for i=1:m
        x_vec=[ones(1,1),x(i,:)];
        y_vec=y(i,:);
        h_theta=x_vec*theta_vec;
        theta_vec = theta_vec - alpha*1/1*((h_theta-y_vec)*ones(1,n).*x_vec)';
    end
end
theta_vec'
toc