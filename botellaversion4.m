clear all
close all
clc

%parametros fisicos
g = 9.81;
hBo = 0.18; %altura del agua [m]
dBo = 0.057;
hOr = 0.0135;
dOr = 0.004;
hAg = 0.1681868187156673;

%botella
Abo = pi * (dBo/2)^2;
botellaX = [0,0,dBo,dBo];
botellaY = [hBo,0,0,hBo];
botella = plot(botellaX, botellaY);
set(botella, "color", "black", "linewidth", 3)
axis equal
axis([-0.01,dBo+0.2, -0.01, 1.5*hBo])
hold on

%agua
V = Abo*hAg;
agua = rectangle("Position",[0,0, dBo, hAg]);
set(agua, "facecolor", "#00FFFF", "edgecolor", "none")

%orificio
Aor = pi * (dOr/2)^2;
orificio = rectangle("Position", [dBo, hOr,2*dOr, dOr]);
set(orificio, "edgecolor", "black", "FaceColor",'#00FFFF', "LineWidth", 1 )

%parametros temporales
ti = 0;
tf = 30;
N=1000;
dt = (tf-ti)/N;

%condiciones inicales
t(1)=ti;
h(1)=hAg;

chorro = plot(0,0);

%Letreros
vTorri = sqrt(2*g*(h(1)-hOr-dOr/2));
texts = sprintf("t= %.1f s\nv= %.2f m/s", t(1),vTorri);
letrero_tiempo = text(0.01,h(1)+0.01,texts);


%nucleo del programa
for n=1:N
    delete(chorro)
    delete(agua)
    delete(letrero_tiempo)
    t(n+1)=t(n)+dt;
    vTorri = sqrt(2*g*(h(n)-hOr-dOr/2));
    G = Aor*vTorri*dt; %Gasto: volumen de agua que sale en dt
    V=V-G;
    h(n+1)=V/Abo;
    agua = rectangle("Position",[0,0, dBo, h(n+1)]);
    set(agua, "facecolor", "#00FFFF", "edgecolor", "none")
    chorroX=dBo+vTorri*t;
    chorroY = hOr+dOr/2 -g/2*t.^2;
    chorro = plot(chorroX, chorroY);
    set(chorro, "linewidth", 3, "color", "#00FFFF")
    if h(n+1) < (hOr+dOr)
        break
    end
    texts = sprintf("t= %.1f s\nv= %.2f m/s", t(n+1),vTorri);
    letrero_tiempo = text(0.01,h(n+1)+0.01,texts);
    set(letrero_tiempo, "fontsize", 8)
    pause(0.01)
end


figure(2)
plot(t,h, "LineWidth",3, "Color","#00FFFF")
hold on


datos = readmatrix("mass_B.txt");
tDat = datos(:,1)- 5.041366666666667;
yDat = datos(:,2);
plot(tDat, yDat);
