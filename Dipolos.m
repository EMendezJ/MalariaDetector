function visualizarDipolo(d, Qp, Qn)
% Valores predeterminados si no se proporcionan
if nargin < 1
    d = 1;           % Distancia predeterminada entre partículas
end
if nargin < 2
    Qp = +20;        % Carga positiva predeterminada
end
if nargin < 3
    Qn = -20;        % Carga negativa predeterminada
end

% Parámetros de visualización
N = 20;             % Número de puntos en la malla
lim = 2;            % Límites de visualización
a = 0.4;            % Tamaño de las partículas

% Crear grid
x = linspace(-lim, lim, N);
y = linspace(-lim, lim, N);
[xG, yG] = meshgrid(x, y);

% Posiciones de las partículas (simétricas respecto al origen)
xCp = -d/2;  yCp = 0;    % Partícula positiva
xCn = d/2;   yCn = 0;    % Partícula negativa

% Constante física
kC = 9e9;               % Constante de Coulomb (1/4πε₀)

% Cálculo del campo eléctrico para la carga positiva
Rx_p = xG - xCp;
Ry_p = yG - yCp;
R_p = sqrt(Rx_p.^2 + Ry_p.^2).^3;
Ex_p = kC * Qp * Rx_p ./ R_p;
Ey_p = kC * Qp * Ry_p ./ R_p;

% Cálculo del campo eléctrico para la carga negativa
Rx_n = xG - xCn;
Ry_n = yG - yCn;
R_n = sqrt(Rx_n.^2 + Ry_n.^2).^3;
Ex_n = kC * Qn * Rx_n ./ R_n;
Ey_n = kC * Qn * Ry_n ./ R_n;

% Campo eléctrico total (suma de ambas contribuciones)
Ex = Ex_p + Ex_n;
Ey = Ey_p + Ey_n;
E = sqrt(Ex.^2 + Ey.^2);

% Vectores unitarios para la dirección del campo
u = Ex ./ E;
v = Ey ./ E;

% Crear figura
figure('Name', 'Campo Eléctrico de un Dipolo');

% Graficar el campo eléctrico con vectores
h = quiver(xG, yG, u, v, 'autoscalefactor', 0.5);
set(h, 'color', [0.7 0 0.7]);
title(['Campo Eléctrico - Distancia = ', num2str(d), ' m']);
axis([-1.5 1.5 -1.5 1.5]);
xlabel('x (m)');
ylabel('y (m)');
box on;
hold on;

% Determinar colores según la carga (rojo para positiva, azul para negativa)
colorP = [1 0 0];  % Rojo para carga positiva
colorN = [0 0 1];  % Azul para carga negativa

% Dibujar la primera partícula
h_p = rectangle('Position', [xCp - a/2, yCp - a/2, a, a], 'Curvature', [1 1]);
if Qp > 0
    set(h_p, 'FaceColor', colorP, 'EdgeColor', [0 0 0]);
    text(xCp-0.1, yCp, '+', 'Color', 'white', 'FontSize', 20, 'FontWeight', 'bold');
else
    set(h_p, 'FaceColor', colorN, 'EdgeColor', [0 0 0]);
    text(xCp-0.1, yCp, '-', 'Color', 'white', 'FontSize', 20, 'FontWeight', 'bold');
end

% Dibujar la segunda partícula
h_n = rectangle('Position', [xCn - a/2, yCn - a/2, a, a], 'Curvature', [1 1]);
if Qn > 0
    set(h_n, 'FaceColor', colorP, 'EdgeColor', [0 0 0]);
    text(xCn-0.1, yCn, '+', 'Color', 'white', 'FontSize', 20, 'FontWeight', 'bold');
else
    set(h_n, 'FaceColor', colorN, 'EdgeColor', [0 0 0]);
    text(xCn-0.1, yCn, '-', 'Color', 'white', 'FontSize', 20, 'FontWeight', 'bold');
end

% Añadir línea entre partículas para mostrar la distancia
plot([xCp, xCn], [yCp, yCn], 'k--', 'LineWidth', 1);
text(0, -0.1, ['d = ', num2str(d), ' m'], 'HorizontalAlignment', 'center');

% Añadir información sobre las cargas
text(xCp, yCp-0.3, ['Q = ', num2str(Qp)], 'HorizontalAlignment', 'center');
text(xCn, yCn-0.3, ['Q = ', num2str(Qn)], 'HorizontalAlignment', 'center');

hold off;
end


visualizarDipolo(1.2, 15, -15);
