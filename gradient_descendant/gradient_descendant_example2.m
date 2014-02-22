clc
clear all
warning off
prompt = {'Coeficients if X1=','Coefficients of X2=','Coefficeint of X1X2=','Initial Point='};
def = {'[2 1 0]','[1 -1 0]','2','[0 0]'};
a=inputdlg(prompt,'Data',1,def);
a=char(a);
[m,n]=size(a);
x1 = eval(a(1,1:n));x2=eval(a(2,1:n));x1x2=eval(a(3,1:n));X1=eval(a(4,1:n));
delf1(1) = polyval(polyder(x1),X1(1));
delf1(1) = (delf1(1))+(x1x2*X1(2));
delf1(2) = polyval(polyder(x2),X1(1));
delf1(2) = (delf1(2))+(x1x2*X1(1));
s=-delf1;
%%%%%%%%%%
%report
srep(1,1:2)=s;
%%%%%%%%%%
x1new(1)=s(1)^2;x1new(2)=2*X1(1)*s(1);x1new(3) = X1(1)^2;
x1new=x1new*x1(1);
x1new_(2)=x1(2)*s(1);x1new_(3)=x1(2)*X1(1);
x1new = x1new+x1new_;
x2new(1)=s(2)^2;x2new(2)=2*X1(2)*s(2);x2new(3) = X1(2)^2;
x2new=x2new*x2(1);
x2new_(2)=x2(2)*s(2);x2new_(3)=x2(2)*X1(2);
x2new = x2new+x2new_;
x1x2new(1)=s(1)*s(2);x1x2new(2)=X1(1)*s(2)+X1(2)*s(1);x1x2new(3)=X1(1)*X1(2);
x1x2new=x1x2*x1x2new;
df = polyder(x1new+x2new+x1x2new);
lambda(1) = roots(df);
X1=X1+lambda(1)*s;
Xrep(1,1:2)=X1;
delf1(1) = polyval(polyder(x1),X1(1));
delf1(1) = (delf1(1))+(x1x2*X1(2));
delf1(2) = polyval(polyder(x2),X1(2));
delf1(2) = (delf1(2))+(x1x2*X1(1));
if all(X1)== 0
fprintf('%d %d is the optimum point',X1(1),X1(2));
end
itrep(1)=1;
it=2;
while all(delf1)==1
s=-delf1;
x1new(1)=s(1)^2;x1new(2)=2*X1(1)*s(1);x1new(3) = X1(1)^2;
x1new=x1new*x1(1);
x1new_(2)=x1(2)*s(1);x1new_(3)=x1(2)*X1(1);
x1new = x1new+x1new_;
x2new(1)=s(2)^2;x2new(2)=2*X1(2)*s(2);x2new(3) = X1(2)^2;
x2new=x2new*x2(1);
x2new_(2)=x2(2)*s(2);x2new_(3)=x2(2)*X1(2);
x2new = x2new+x2new_;
x1x2new(1)=s(1)*s(2);x1x2new(2)=X1(1)*s(2)+X1(2)*s(1);x1x2new(3)=X1(1)*X1(2);
x1x2new=x1x2*x1x2new;
df = polyder(x1new+x2new+x1x2new);
lambda(it) = roots(df);
X1=X1+lambda(it)*s;
delf1(1) = polyval(polyder(x1),X1(1));
delf1(1) = (delf1(1))+(x1x2*X1(2));
delf1(2) = polyval(polyder(x2),X1(2));
delf1(2) = (delf1(2))+(x1x2*X1(1));
itrep(it)=it;
srep(it,1:2)=s;
Xrep(it,1:2)=X1;
it=it+1;
end
[m,n]=size(itrep);
matrix=[itrep' srep(1:n,1) srep(1:n,2) Xrep(1:n,1) Xrep(1:n,2)];
answer = char(num2str(X1));
answer = ['The optimal point is [' answer ']'];
msgbox(answer,'Solution');
disp(' Press Any key to View Detailed Report............');
pause
echo off
report steep;
clc