clc;
clear
% load data
%heart_scale = load('heart_scale');
%X = heart_scale.heart_scale_inst;
%Y = heart_scale.heart_scale_label;

X = [2104,3;1600,2;2400,3;1416,2;3000,4];
Y = [400;330;369;232;540];


epsilon = 0.0003;
gamma= 0.0001;
 
w_old=zeros(size(X,2),1);
k=1;
figure(1);
while 1
minJ_w(k) = 1/2 * (norm(X*w_old - Y))^2;
w_new = w_old - gamma*(X'*X*w_old - X'*Y);
fprintf('The %dth iteration, minJ_w = %f, \n',k,minJ_w(k));
 
if norm(w_new-w_old) < epsilon
W_best = w_new;
break;
end
w_old = w_new;
k=k+1;
end
 
plot(minJ_w);