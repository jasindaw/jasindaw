clc; close all; clear all;
%initial
X(1,:)=[1 1 1 1]';
niter=30;tol=1e-6;

for ii=1:niter-1
    [f,dp]=jacobian(X(ii,:));
    dX=inv(dp)*f;
    X(ii+1,:)=X(ii,:)'-dX;
    fprintf('Iterasion=%i  solusi=%.4f  \n',ii,X(ii+1))
    if abs(X(ii+1,:)-X(ii,:))<tol
        r=X(ii+1,:);
        disp('Solusi Konvergence')
        break
    end
end

x=r(1); y=r(2); lambda_1=r(3); lambda_2=r(4);% theta_1=r(5); theta_2=r(6);
f=2*x+3*y-x^3-2*y^2;
disp('Case 4')
disp(['x=' num2str(x)  ',y=' num2str(y), ',f=' num2str(f)])
disp(['theta_1=' num2str(lambda_1), ',theta_2=' num2str(lambda_2)])
%disp(['thetha_1=' num2str(theta_1), ',theta_2=' num2str(theta_2)])