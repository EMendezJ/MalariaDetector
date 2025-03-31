clear all % limpia todas las variables
close all % cierra todas las ventanas
clc %limpia pantalla

%parametros fisicos
k=200; %Constante del resorte (N/m)
m = 0.5;
altura = 0.5;
ancho = 1;

%Parametros temporales
ti = 0; %Tiempo inicial
tf = 10; %Tiempo final
N=200; %Numero de pasos temporales
dt = (tf-ti)/N; %Tiempo de paso

%condiciones iniciales
t(1)=ti;
x(1)=0.1;
v(1) = 0;

%nucleo del programa
for n= 1:N
  t(n+1)=t(n)+dt;
  F = -k*x(n);
  v(n+1)=v(n)+F/m*dt;
  x(n+1)=x(n)+v(n+1)*dt;
end