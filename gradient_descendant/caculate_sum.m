function [s] = caculate_sum(theta,x,y)
% caculate theta of J
m = length(y);
n = size(x,2)+1;
tmp = ones(m,n);
for i=1:m
    for j=2:n
        tmp(i,j) = x(i,j-1);
    end
end

s = 0;
for i = 1:m
    h = 0;
    for j = 1:n
        h = h+theta(j)*tmp(i,j);
    end
    s = s+(h-y(i))^2;
end