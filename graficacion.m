% Script para visualizar el campo eléctrico de un dipolo
% Parámetros definidos según la tarea
q1 = 1e-6;          % Carga de la primera partícula: 1×10^-6 C
q2 = -1e-6;         % Carga de la segunda partícula: -1×10^-6 C
pos1 = [-0.1, 0];   % Posición de la primera carga en (-0.1, 0)
pos2 = [0.1, 0];    % Posición de la segunda carga en (0.1, 0)

% Parámetros de visualización
N = 20;             % Número de puntos en la malla
lim = 2;            % Límites de visualización [-1,1]
kC = 9e9;           % Constante de Coulomb (1/4πε₀)

% Crear grid para el campo vectorial
[xG, yG] = meshgrid(linspace(-lim, lim, N), linspace(-lim, lim, N));

% Inicializar los campos eléctricos
Ex = zeros(size(xG));
Ey = zeros(size(yG));

% Crear figura para el campo vectorial
figure('Name', 'Campo Eléctrico de un Dipolo');
subplot(1, 2, 1); % Primera subfigura para el campo vectorial

% Cálculo del campo eléctrico para la primera carga
for i = 1:size(xG, 1)
    for j = 1:size(xG, 2)
        % Vector posición relativa
        r1x = xG(i, j) - pos1(1);
        r1y = yG(i, j) - pos1(2);
        r1 = sqrt(r1x^2 + r1y^2);
        
        % Si el punto está muy cerca de la carga, evitar la singularidad
        if r1 > 0.02
            % Campo eléctrico de la primera carga
            Ex(i, j) = Ex(i, j) + kC * q1 * r1x / r1^3;
            Ey(i, j) = Ey(i, j) + kC * q1 * r1y / r1^3;
        end
        
        % Vector posición relativa para la segunda carga
        r2x = xG(i, j) - pos2(1);
        r2y = yG(i, j) - pos2(2);
        r2 = sqrt(r2x^2 + r2y^2);
        
        % Si el punto está muy cerca de la carga, evitar la singularidad
        if r2 > 0.02
            % Campo eléctrico de la segunda carga
            Ex(i, j) = Ex(i, j) + kC * q2 * r2x / r2^3;
            Ey(i, j) = Ey(i, j) + kC * q2 * r2y / r2^3;
        end
    end
end

% Calcular magnitud del campo eléctrico
E = sqrt(Ex.^2 + Ey.^2);

% Normalizar los vectores para su visualización
u = Ex ./ (E + eps); % Evitar división por cero
v = Ey ./ (E + eps);

% Dibujar las cargas
hold on;
% Carga positiva (roja)
plot(pos1(1), pos1(2), 'ro', 'MarkerFaceColor', 'r', 'MarkerSize', 10);
% Carga negativa (azul)
plot(pos2(1), pos2(2), 'bo', 'MarkerFaceColor', 'b', 'MarkerSize', 10);

% Graficar el campo eléctrico con vectores
quiver(xG, yG, u, v, 'autoscalefactor', 0.5, 'Color', [0.7 0 0.7]);

% Colocar un datatip en el origen (como se solicita en la tarea)
datatip(plot(0, 0, 'k.'), 'Location', 'northeast');

% Configurar gráfico
title('Campo Eléctrico de un Dipolo');
axis([-lim lim -lim lim]);
xlabel('x (m)');
ylabel('y (m)');
grid on;
box on;

% Segunda parte: Gráficas de intensidad del campo a lo largo de x
subplot(1, 2, 2);

% Crear vectores para las posiciones x
x_points = linspace(-lim, lim, 200);

% Inicializar vectores para almacenar la magnitud del campo en las dos alturas
E_y05 = zeros(size(x_points));
E_y1 = zeros(size(x_points));

% Calcular la magnitud del campo para cada posición x en y=0.5
for i = 1:length(x_points)
    % Punto en la primera línea (y=0.5)
    r1x = x_points(i) - pos1(1);
    r1y = 0.5 - pos1(2);
    r1 = sqrt(r1x^2 + r1y^2);
    
    r2x = x_points(i) - pos2(1);
    r2y = 0.5 - pos2(2);
    r2 = sqrt(r2x^2 + r2y^2);
    
    % Componentes del campo eléctrico
    Ex1 = kC * q1 * r1x / r1^3;
    Ey1 = kC * q1 * r1y / r1^3;
    
    Ex2 = kC * q2 * r2x / r2^3;
    Ey2 = kC * q2 * r2y / r2^3;
    
    % Campo eléctrico total
    Ex_total = Ex1 + Ex2;
    Ey_total = Ey1 + Ey2;
    
    % Magnitud del campo
    E_y05(i) = sqrt(Ex_total^2 + Ey_total^2);
    
    % Ahora para y=1
    r1y = 1 - pos1(2);
    r1 = sqrt(r1x^2 + r1y^2);
    
    r2y = 1 - pos2(2);
    r2 = sqrt(r2x^2 + r2y^2);
    
    % Componentes del campo eléctrico
    Ex1 = kC * q1 * r1x / r1^3;
    Ey1 = kC * q1 * r1y / r1^3;
    
    Ex2 = kC * q2 * r2x / r2^3;
    Ey2 = kC * q2 * r2y / r2^3;
    
    % Campo eléctrico total
    Ex_total = Ex1 + Ex2;
    Ey_total = Ey1 + Ey2;
    
    % Magnitud del campo
    E_y1(i) = sqrt(Ex_total^2 + Ey_total^2);
end

% Graficar las curvas de intensidad
plot(x_points, E_y05, 'ro-', 'MarkerIndices', 1:20:length(x_points));
hold on;
plot(x_points, E_y1, 'bs-', 'MarkerIndices', 1:20:length(x_points));

% Añadir leyenda y etiquetas
legend('y = 0.5', 'y = 1', 'Location', 'best');
title('Intensidad del Campo Eléctrico');
xlabel('Posición x (m)');
ylabel('|E| (N/C)');
grid on;

% Ajustar la figura completa
sgtitle('Campo Eléctrico de un Dipolo');