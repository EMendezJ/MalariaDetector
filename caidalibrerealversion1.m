clear all
close all
clc

%Definir parametros fisicos
m=0.152;
g=9.81;
dBo = 0.095;
Abo = pi*(dBo/2)^2;
d = 1204;
c=0; %Ajustar segun contexto\
ti=0;
tf = 1.2;
N = 100;
dt = (tf-ti)/N;
Farr=0;

%parametros temporales
v(1)=0;
t(1)=ti;
y(1)=7.14;

%Tardo 1.2 segundos
for n=1:N
    t(n+1)=t(n)+dt;
    Farr=-(1/2)*c*d*Abo*(abs(v(n))*v(n));
    v(n+1)=(dt*(Farr-m*g)/m)+v(n);
    y(n+1)=(v(n)*dt)+y(n);
end

plot(t,y);
xlabel("Tiempo(segundos)")
ylabel("Posicion en y(m)")
title("Tiempo contra posicion en y")