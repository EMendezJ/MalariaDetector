clear all;
clc;
%% Parámetros Unidades en Kg, metros, segundos
M2 = 0.1962;   % Peso del contrapeso en kg
M1 = 0.01471;  % Peso del brazo del contrapeso en kg
d2 = 0.075;    % Longitud del brazo del contrapeso en metros
d1 = 0.075;    % Longitud del brazo lanzador en metros
R1 = 0.003;    % Radio brazo lanzador (si aplica)
R2 = 0.0075;   % Radio brazo contrapeso (si aplica)
H = 0.055 + 0.005; % Altura del 5.5 cm, altura de la base 0.5 cm 
dt = 0.001;
m1 = 0.02452;  % Peso del proyectil en kg
m2 = 0.01471;  % Peso del brazo lanzador en kg
g = 9.8;
b = 0.0001;
angSal = 35;   % Ángulo en grados
thetafinal = -(90-angSal)*pi/180;  % ángulo final en contrapeso

%% Catapulta grande
% M2 = 12.0;  
% M1 = 0.05;
% d2 = 0.4;  
% d1 = 1.0;
% R1 = 0.025;
% R2 = 0.10;
% H = 0.80; % Altura del 5.5 cm, altura de la base 0.5 cm 
% dt = 0.01;
% m1 = 0.200;
% m2 = 0.050;
% g = 9.8;
% b = 0.0001;
% angSal = 34;   %Ángulo en grados
% thetafinal = -(90-angSal)*pi/180;  %ángulo final en contrapeso
%% Movimiento circular
thetaMax = asin(H/d1);
omega0 = 0.0;
theta0 = thetaMax; %Inicia rotación con ángulo máximo, debe ser menor a 90°
vto = 0;
I = m1*d1^2/3 + m2*d2^2/3 + 0.4*M1*R1^2 + M1*d1^2 + 0.4*M2*R2^2 + M2*d2^2;
C = (-M2*d2 + M1*d1 -m2*d2/2 + m1*d1/2)*g/I;
%% Método de Euler para el Cálculo de la rapidez angular y ángulo como función del tiempo
t = 0;
T(1) = 0; Vx(1) = 0; Vy(1)=0; X(1) = -d1*cos(theta0); Y(1) = H-d1*sin(theta0);
omegaV(1) = omega0;
thetaV(1) = theta0;
for k=2:100000     
    omega1 = omega0 + C*cos(theta0)*dt;
    theta1 = theta0 + omega0*dt;
    omega0 = omega1; theta0 = theta1;
      if theta1 < thetafinal
      break;
      end
    omegaV(k) = omega1;
    thetaV(k) = theta1;
    vx = -d1*abs(omega1)*cos(pi/2-theta1);
    vy = d1*abs(omega1)*sin(pi/2-theta1);
    yo = H - d1*sin(theta1);
    xo = -d1*cos(theta1);
    T(k) = k*dt;
    Vx(k) = vx;
    Vy(k) = vy;
    X(k) = xo;
    Y(k) = yo;
end
% figure(7);
% plot(T,abs(omegaV),'k','LineWidth',2);
% xlabel('t(seg)');
% ylabel('|w(rad/seg)|');
%% Tiro parabólico
theta1 = abs(theta1);
vo = d1*abs(omega1);
AngSal = pi/2 - abs(theta1); %Ángulo de salida
vox = vo*cos(AngSal);
voy = vo*sin(AngSal);
tv = (voy + sqrt(voy^2+2*g*yo))/g; %Estimado sin fricción
Dymax = voy^2/(2*g);               %Estimado sin fricción
ymax = yo + Dymax;                 %Estimado sin fricción
R = xo + vox*tv;                   %Estimado sin fricción
%fprintf("Sin fricción: tv = %f, angSal(Deg) = %f, R(cm) = %f %f\n",tv,angSal,R*100, AngSal*180/pi)

%% Grafica trayectoria tira parabólico sin fricción con el aire

tv = 0:dt:tv;
k = length(T);
To = T(end);
for i = 1:length(tv)   
   v1x = vox - b*vox*dt/M1; 
   v1y = voy + (-g-b*voy/M1)*dt;
   x1 = xo + vox*dt;
   y1 = yo + voy*dt;
   vox = v1x; voy = v1y; 
   xo = x1; yo = y1;    
   if y1 < 0.0
       break;
   end
       k = k + 1;
    T(k) = To + i*dt; 
    Vx(k)=vox; Vy(k) = voy; 
     X(k)=xo;   Y(k) = yo;
end
fprintf("Tiempo de vuelo = %f\nÁngulo de Salida(Deg) = %f\nAlcance R(cm) = %f\n",T(end),angSal*180/pi,X(end)*100);
%% Render
 figure(1);
 hold on;
 axis equal;
 xlim([-d1*1.1,1.1*max(X)]);
 ylim([0,1.1*ymax]);
 xlabel('x(m)');
 ylabel('y(m)');
 plot([0,0],[0,H],'- k','LineWidth',2);
 plot(0,H,'o r','MarkerSize',10);
for i=1:k
if(Y(i) < 0) break; end
 plot(X(i),Y(i),'o k','MarkerSize',6); %hold on;
 if(i <= length(thetaV)) 
 plot(d2*cos(thetaV(i)),H+d2*sin(thetaV(i)),'o k','MarkerSize',10);
 plot([-d1*cos(thetaV(i)),d2*cos(thetaV(i))],[H-d1*sin(thetaV(i)),H+d2*sin(thetaV(i))],'- k','LineWidth',2);
 end
pause(0.00000001);
plot(X(i),Y(i),'o w','MarkerSize',6); hold on;
plot(X(1:i),Y(1:i),'. b','MarkerSize',2); 
if(i < length(thetaV)) 
 plot(d2*cos(thetaV(i)),H+d2*sin(thetaV(i)),'o w','MarkerSize',10);
 plot([-d1*cos(thetaV(i)),d2*cos(thetaV(i))],[H-d1*sin(thetaV(i)),H+d2*sin(thetaV(i))],'- w','LineWidth',2);
end
if(i == length(thetaV))
 plot(d2*cos(thetaV(i)),H+d2*sin(thetaV(i)),'o k','MarkerSize',10);
 plot([-d1*cos(thetaV(i)),d2*cos(thetaV(i))],[H-d1*sin(thetaV(i)),H+d2*sin(thetaV(i))],'- k','LineWidth',2);
end
end 
 plot(X(i),Y(i),'o k','MarkerSize',6); 
 
%% Figuras finales
figure(2);
subplot(3,1,3); 
plot(T, Vx, '- b', T, Vy, '- k', 'LineWidth', 1);
xlabel('T(s)');
ylabel('vx,vy(m/s)');
legend('Vx', 'Vy');  % Leyendas en el mismo orden que las líneas
drawnow;  % Fuerza el dibujo

subplot(3,1,2); 
plot(T, X, '- b', T, Y, '- k', 'LineWidth', 1);
xlabel('T(s)');
ylabel('x,y(m)');
legend('x', 'y');  % Leyendas en el mismo orden que las líneas
drawnow;  % Fuerza el dibujo

subplot(3,1,1); 
plot(X, Y, '-- b', 'LineWidth', 1);
xlabel('x(m)');
ylabel('y(m)');
drawnow;  % Fuerza el dibujo
waitfor(gcf);
