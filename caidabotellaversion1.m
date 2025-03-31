% Limpiar entorno
clear; close all; clc;

% Parámetros físicos y temporales
m = 70;           % Masa en kg (ajustar según el contexto)
g = 9.81;         % Gravedad en m/s^2
Cd = 0.5;         % Coeficiente de arrastre (ajustar según el contexto)
rho = 1.2;        % Densidad del aire en kg/m^3
A = 0.18;         % Área frontal en m^2 (ajustar según el contexto)
dt = 0.01;        % Paso de tiempo en segundos
t_final = 10;     % Tiempo total en segundos

% Condiciones iniciales
v = 0;            % Velocidad inicial en m/s
x = 1000;         % Altura inicial en m

% Inicializar vectores
t = 0:dt:t_final;
n_steps = length(t);
altura = zeros(1, n_steps);
velocidad = zeros(1, n_steps);

altura(1) = x;
velocidad(1) = v;

% Bucle de integración
for n = 1:n_steps-1
    % Calculo de fuerzas
    F_drag = 0.5 * Cd * rho * A * velocidad(n)^2;
    F_net = -F_drag - m * g;
    
    % Ecuaciones de movimiento
    dv = F_net / m * dt;
    velocidad(n+1) = velocidad(n) + dv;
    
    dx = velocidad(n) * dt;
    altura(n+1) = altura(n) + dx;
end

% Gráfica de la altura
plot(t, altura);
xlabel('Tiempo (s)');
ylabel('Altura (m)');
title('Evolución de la altura en el tiempo');
