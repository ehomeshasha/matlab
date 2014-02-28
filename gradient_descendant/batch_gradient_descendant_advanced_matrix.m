clear;
%cd /home/hadoop-user/Downloads/DATA/ex2Data
%x = load('ex2x.dat');
%y = load('ex2y.dat');
x = [2104,3;1600,2;2400,3;1416,2;3000,4];
y = [400;330;369;232;540];
tic
m = length(y);
x=[ones(m,1),x];
theta = inv(x'*x)*x'*y;
theta
toc