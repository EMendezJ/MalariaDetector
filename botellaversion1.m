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
dBo = 0.057;
hOr = 0.0135;
dOr = 0.0051;
hAg = 0.145;

%botella
botellaX = [0,0,dBo,dBo];
botellaY = [hBo,0,0,hBo];
botella = plot(botellaX, botellaY);
set(botella, "color", "black", "linewidth", 3)
axis equal
axis([-0.01,dBo+0.2, -0.01, 1.5*hBo])
hold on

%agua
agua = rectangle("Position",[0,0, dBo, hAg]);
set(agua, "facecolor", "#00FFFF", "edgecolor", "none")

%orificio
orificio = rectangle("Position", [dBo, hOr,2*dOr, dOr]);
set(orificio, "edgecolor", "black", "FaceColor",'#00FFFF', "LineWidth", 1 )

%parametros temporales
ti = 0;
tf = 30;
N=100;
dt = (tf-ti)/N;

%condiciones inicales
t(1)=ti;
h(1)=hAg;

%nucleo del programa
for n=1:N
    t(n+1)=t(n)+dt;
    v
end