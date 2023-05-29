function [f0,jac]=jacobian(x)
h=1.0e-4;
n=length(x);
f0=funcobj(x);
jac=zeros(n,n);

for ii=1:n
    temp=x(ii);
    x(ii)=temp+h;
    f1=funcobj(x);
    x(ii)=temp;
    jac(:,ii)=(f1-f0)/h;
end