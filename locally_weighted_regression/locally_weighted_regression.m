function [theta] = caculate_theta(theta,x,y,alpha,certain_x)
% caculate theta
m = length(y);
n = size(x,2)+1;
x=[ones(m,1),x];


for j=1:n
    s = 0;
    for i=1:m
        h=0;
        for k=1:n
            h = h+theta(k)*x(i,k);
        end
        s = s+(h-y(i))*x(i,j);
    end
    theta(j) = theta(j)-alpha*1/m*s;
end