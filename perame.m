clear all
close all
clc

datos = readmatrix("mass_B.txt");
tDat = datos(:,1);
yDat = datos(:,2);
plot(tDat, yDat);

%parametros fisicos
g = 9.81;
hBo = 0.18; %altura del agua [m]
dBo = 0.05;
hOr = 0.03;
dOr = 0.003;
hAg = 0.145;

%botella
botellaX = [0,0,dBo,dBo];
botellaY = [hBo,0,0,hBo];
botella = plot(botellaX, botellaY);
set(botella, "color", "black", "linewidth", 3)
axis equal
axis([-0.01,dBo+0.2, -0.01, 1.5*hBo])
hold on

