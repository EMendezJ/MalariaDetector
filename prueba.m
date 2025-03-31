clear all
close all
clc

% Definir parámetros físicos
m = 0.152;  % Masa (kg)
g = 9.81;   % Gravedad (m/s^2)
dBo = 0.095;  % Diámetro del objeto (m)
Abo = pi*(dBo/2)^2;  % Área del objeto (m^2)
d = 1204;  % Densidad del aire (kg/m^3)
c = 0.1;  % Coeficiente de arrastre (ajustar según contexto)
ti = 0;  % Tiempo inicial (segundos)
tf = 1.2;  % Tiempo final (segundos)
N = 100;  % Número de intervalos
dt = (tf - ti) / N;  % Intervalo de tiempo
Farr = 0;  % Fuerza de arrastre inicial

% Parámetros temporales
v(1) = 0;  % Velocidad inicial (m/s)
t(1) = ti;  % Tiempo inicial (segundos)
y(1) = 7.14;  % Posición inicial (metros)

% Loop de simulación
for n = 1:N
    t(n + 1) = t(n) + dt;  % Actualizar el tiempo
    Farr = -0.5 * c * d * Abo * abs(v(n)) * v(n);  % Fuerza de arrastre (N)
    
    % Cálculo de aceleración
    a = (Farr - m * g) / m;  % Aceleración (m/s^2)
    
    % Actualización de la velocidad y posición
    v(n + 1) = v(n) + a * dt;  % Nueva velocidad
    y(n + 1) = y(n) + v(n) * dt;  % Nueva posición
end

% Graficar resultados
plot(t, y);
xlabel("Tiempo (segundos)");
ylabel("Posición en y (m)");
title("Tiempo contra posición en y");
