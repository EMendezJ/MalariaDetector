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

%fotografia inicial
figure(1)
caja = rectangle("position",[x(1)-ancho/2, 0, ancho, altura]);
set(caja, "facecolor","#572364");
hold on
axis([-2,2,0,2])
fuerza = quiver(x(1), altura/2, -k*x(1)/10, 0);
set(fuerza, "color", "red", "linewidth", 2)
texto = sprintf("t = %.1f s", t(1));
letrero = text(0,1,texto);
set(letrero, "fontsize", 20)
title('Luis Alvaro Rosales Salazar')

%nucleo del programa
for n= 1:N
  delete(caja)
  delete(fuerza)
  delete(letrero)
  t(n+1)=t(n)+dt;
  F = -k*x(n);
  v(n+1)=v(n)+F/m*dt;
  x(n+1)=x(n)+v(n+1)*dt;
  caja = rectangle("position",[x(n+1)-ancho/2, 0, ancho, altura]);
  set(caja, "facecolor","#572364");
  fuerza = quiver(x(n+1), altura/2, -k*x(n+1)/10, 0);
  set(fuerza, "color", "red", "linewidth", 2)
  texto = sprintf("t = %.1f s", t(n+1));
  letrero = text(0,1,texto);
  set(letrero, "fontsize", 20)
  pause(0.01)
end