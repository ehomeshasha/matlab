clear;
cd /home/hadoop-user/Downloads/DATA/ex2Data
x = load('ex2x.dat');
y = load('ex2y.dat');
tic
m = length(y);
x=[ones(m,1),x];
theta = inv(x'*x)*x'*y;
theta
toc