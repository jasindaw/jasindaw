%Kelompok 23 Fiskom II nomer 3 betul

clc;clear all;close all;
x=1; y=2; %bidang persoalan

%inisiasi parameter
dx=1e-2; dy=2e-2; %delta x dan delta y (jarak antar titik pada sumbu x dan sumbu y)
Nx=1+x/dx; Ny=1+y/dy; %banyaknya titik di x dan y
xa=0:dx:(Nx-1)*dx; %panjangnya x pada kotak
ya=0:dy:(Ny-1)*dy; %panjangnya y pada kotak

%permisalan persamaan
a=1/dx^2; b=1/dy^2; c=-2*(a+b); 
d=1/dx; e=1/dy; 

A=eye(Nx*Ny); %matriks identitas
B=zeros(Nx*Ny); %matriks zeros

%untuk batas bawah
for ii=1:Nx
    jj=1; %batas bawah
    k=(jj-1)*Nx+ii;
    B(k,1)=1;
end

%untuk batas kiri
for jj=1:Ny
    ii=1; %batas kiri
    k=(jj-1)*Nx+ii;
    B(k,1)=1; 
end

%untuk batas atas done
for ii=2:Nx-1
    jj=Ny; %batas atas
    k=(jj-1)*Nx+ii;
    A(k,k)=d; %A(k,k-1)=d;
    B(k,1)=A(k,k-1);
end

%untuk batas kanan
for jj=2:Ny
    ii=Nx; %batas kanan
    k=(jj-1)*Nx+ii;
    A(k,k)=e;%A(k,k-3)=e;
    B(k,1)=A(k,k-Nx);
end

%untuk titik-titik di tengah bidang
for ii=2:Nx-1
    for jj=2:Ny-1
        k=(jj-1)*Nx+ii;
        A(k,k)=c;
        A(k,k-1)=a; A(k,k+1)=a;
        A(k,k-Nx)=b; A(k,k+Nx)=b;
        B(k,1)=0;
    end
end

%mendapatkan nilai persamaan 
solx=inv(A)*B; 
for ii=1:Nx
    for jj=1:Ny
        k=(jj-1)*Nx+ii;
        sol(jj,ii)=solx(k);
    end
end

%plot visualisasi colormap pada matriks
[X,Y]=meshgrid(xa,ya);
surface (X,Y,sol);colormap("turbo");colorbar; 
title('Solusi Permasalahan PDE', 'fontweight','bold')
shading flat; axis ('equal')
xlim([0 max(xa)]); ylim([0 max(ya)])
xlabel('X', 'FontWeight','bold'); ylabel('Y', 'FontWeight','bold')
