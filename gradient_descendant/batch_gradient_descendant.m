clear;
%clc;

%x = [2104,3;1600,2;2400,3;1416,2;3000,4];
%y = [400;330;369;232;540];
%cd /home/hadoop-user/Downloads/DATA/ex2Data
x = load('ex2x.dat');
y = load('ex2y.dat');

% init theta
tic
theta = zeros(1,size(x,2)+1);
caculate_sum(theta,x,y);
alpha = 0.007;
for i = 1:10000
    theta = caculate_theta(theta,x,y,alpha);
    %sum = caculate_sum(theta,x,y);
end
theta
toc


%{
theta_vec = theta';
m = length(y);
x = [ones(m,1),x];

figure;
plot(x(:,2),y,'bs-');
hold on
plot(x(:,2),x*theta_vec,'rp-');
legend('measured', 'predicted');
grid on;
xlabel('x');
ylabel('y');
title('Measured and predicted ');



j_theta = zeros(250, 250);   % initialize j_theta
theta0_vals = linspace(-5000, 5000, 250);
theta1_vals = linspace(-200, 200, 250);
for i = 1:length(theta0_vals)
   for j = 1:length(theta1_vals)
  theta_val_vec = [theta0_vals(i) theta1_vals(j)]';
  h_theta = (x*theta_val_vec);
  j_theta(i,j) = 1/(2*m)*sum((h_theta - y).^2);
    end
end
figure;
surf(theta0_vals, theta1_vals,10*log10(j_theta.'));
xlabel('theta_0'); ylabel('theta_1');zlabel('10*log10(Jtheta)');
title('Cost function J(theta)');
figure;
contour(theta0_vals,theta1_vals,10*log10(j_theta.'))
xlabel('theta_0'); ylabel('theta_1')
title('Cost function J(theta)');
%}