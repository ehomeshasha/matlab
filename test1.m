x = [2104,3;1600,2;2400,3;1416,2;3000,4];
y = [400;330;369;232;540];

% init theta
theta = zeros(1,ndims(x)+1);
sum = caculate_sum(theta,x,y);
sum
for i = 1:100
    theta = caculate_theta(theta,x,y,5);
    theta(1),theta(2),theta(3)
    sum = caculate_sum(theta,x,y);
    sum
end