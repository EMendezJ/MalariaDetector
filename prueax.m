"A00841469_JuanGastelum_8_10_2024" 

% Método de Euler para simular el movimiento armónico simple
% Parámetros físicos del sistema
k = 10; % Constante elástica (N/m)
m = 0.0006; % Masa (kg)
x0 = 4; % Posición inicial (m)
v0 = 0; % Velocidad inicial (m/s)
t_final = 1; % Tiempo de simulación (s)
dt = 0.001; % Intervalo de tiempo (s)

% Función de aceleración
aceleracion = @(x) -(k/m) * x;

% Inicialización de variables
n = round(t_final/dt);
t = linspace(0, t_final, n);
x = zeros(1, n);
v = zeros(1, n);
a = zeros(1, n);

% Condiciones iniciales
x(1) = x0;
v(1) = v0;
a(1) = aceleracion(x(1));

% Implementación del método de Euler
for i = 2:n
    v(i) = v(i-1) + a(i-1) * dt;
    x(i) = x(i-1) + v(i-1) * dt;
    a(i) = aceleracion(x(i));
end

% Graficar los resultados
plot(t, x);
xlabel('Tiempo (s)');
ylabel('Posición (m)');
title('Simulación del movimiento armónico simple con método de Euler');
grid on;