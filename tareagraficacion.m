% Script para visualizar el campo eléctrico de un dipolo
% Integrantes del equipo: Emiliano Mendez, Oscar Ortiz, Luis Salazar, Veronica Zapata
% Parámetros constantes
q1 = 1e-6;          % Carga positiva (C)
q2 = -1e-6;         % Carga negativa (C)
pos1 = [-0.1, 0];   % Posición de q1
pos2 = [0.1, 0];    % Posición de q2

% Parámetros de visualización
N = 20;             % Resolución de la malla
lim = 1;            % Límites del espacio
kC = 9e9;           % Constante de Coulomb (N·m^2/C^2)

% Crear malla usando la funcion de meshgrid
[xG, yG] = meshgrid(linspace(-lim, lim, N), linspace(-lim, lim, N));

% Iniciación de la matriz de los ampos electricos en el eje x y en el eje y
Ex = zeros(size(xG));
Ey = zeros(size(yG));

% Figura para graficar 
figure('Name', 'Campo Eléctrico de Dipolos');
subplot(1, 2, 1); % Subfigura para el campo vectorial

% Calcular el campo eléctrico en cada punto
for i = 1:size(xG, 1)
    for j = 1:size(xG, 2)
        % Campo por q1
        % Se cacula el vector que va desde un punto hasta la carga
        r1x = xG(i, j) - pos1(1);
        r1y = yG(i, j) - pos1(2);
        r1 = sqrt(r1x^2 + r1y^2);
        
        % Usar la funcion matemática eps para disminuir los errores
        % por redondeo
        Ex1 = kC * q1 * r1x / (r1^3 + eps);
        Ey1 = kC * q1 * r1y / (r1^3 + eps);

        % Campo por q2
        % Se cacula el vector que va desde un punto hasta la carga
        r2x = xG(i, j) - pos2(1);
        r2y = yG(i, j) - pos2(2);
        r2 = sqrt(r2x^2 + r2y^2);

        % Usar la funcion matemática eps para disminuir los errores
        % por redondeo
        Ex2 = kC * q2 * r2x / (r2^3 + eps);
        Ey2 = kC * q2 * r2y / (r2^3 + eps);

        % Sumar campos
        Ex(i, j) = Ex1 + Ex2;
        Ey(i, j) = Ey1 + Ey2;
    end
end

% Magnitud del campo eléctrico
E = sqrt(Ex.^2 + Ey.^2);

% Calcular el vector unitario de x y de y para graficar vectores
u = Ex ./ (E + eps); 
v = Ey ./ (E + eps);

% Dibujar cargas
hold on;
plot(pos1(1), pos1(2), 'ro', 'MarkerFaceColor', 'r', 'MarkerSize', 10);
plot(pos2(1), pos2(2), 'bo', 'MarkerFaceColor', 'b', 'MarkerSize', 10);

% Dibujar campo eléctrico con quiver
quiver(xG, yG, u, v, 'autoscalefactor', 0.5, 'Color', [0.7 0 0.7]);
plot(0, 0, 'k.');
datatip(plot(0, 0, 'k.'), 'Location', 'northeast');

title('Campo Eléctrico de Dipolos');
axis([-1 1 -1 1]);
xlabel('x (m)');
ylabel('y (m)');
grid on;
box on;

% Subgráfico para magnitud del campo en y = 0.5 y y = 1
subplot(1, 2, 2);
x_points = linspace(-lim, lim, 200);

for i = 1:length(x_points)
    % y = 0.5
    r1x = x_points(i) - pos1(1);
    r1y = 0.5 - pos1(2);
    r1 = sqrt(r1x^2 + r1y^2);
    
    r2x = x_points(i) - pos2(1);
    r2y = 0.5 - pos2(2);
    r2 = sqrt(r2x^2 + r2y^2);
    
    Ex1 = kC * q1 * r1x / (r1^3 + eps);
    Ey1 = kC * q1 * r1y / (r1^3 + eps);
    Ex2 = kC * q2 * r2x / (r2^3 + eps);
    Ey2 = kC * q2 * r2y / (r2^3 + eps);
    
    Ex_total = Ex1 + Ex2;
    Ey_total = Ey1 + Ey2;
    E_y05(i) = sqrt(Ex_total^2 + Ey_total^2);

    % y = 1
    r1y = 1 - pos1(2);
    r1 = sqrt(r1x^2 + r1y^2);
    
    r2y = 1 - pos2(2);
    r2 = sqrt(r2x^2 + r2y^2);
    
    Ex1 = kC * q1 * r1x / (r1^3 + eps);
    Ey1 = kC * q1 * r1y / (r1^3 + eps);
    Ex2 = kC * q2 * r2x / (r2^3 + eps);
    Ey2 = kC * q2 * r2y / (r2^3 + eps);
    
    Ex_total = Ex1 + Ex2;
    Ey_total = Ey1 + Ey2;
    E_y1(i) = sqrt(Ex_total^2 + Ey_total^2);
end

% Graficar intensidades
plot(x_points, E_y05, 'ro-', 'MarkerIndices', 1:20:length(x_points));
hold on;
plot(x_points, E_y1, 'bs-', 'MarkerIndices', 1:20:length(x_points));
legend('y = 0.5', 'y = 1', 'Location', 'best');
title('Intensidad del Campo Eléctrico');
xlabel('Posición x (m)');
ylabel('Energía (N/C)');
grid on;

% Título general
sgtitle('Campo Eléctrico de Dipolos');
