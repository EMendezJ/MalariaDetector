% Entrada de datos
d = input("Ingrese la distancia entre las filas: ");
n = input("Ingrese el numero de particulas por fila: ");
Qp = input("Ingrese la carga (por particula) de la primera fila: ");
Qn = input("Ingrese la carga (por particula) de la segunda fila: ");
visualizarDipolo(d, Qp, Qn, n);

function visualizarDipolo(d, Qp, Qn, n)
    % Parámetros de visualización
    N = 20;                 % Número de puntos en la malla
    lim = 2;                % Límites de visualización
    ap = abs(Qp)/100;        % Tamaño de las partículas de la primera fila (proporcional a la carga)
    an = abs(Qn)/100;        % Tamaño de las partículas de la segunda fila (proporcional a la carga)
    sep_x = 0.3;            % Separación horizontal entre partículas
    
    % Crear grid
    x = linspace(-lim, lim, N);
    y = linspace(-lim, lim, N);
    [xG, yG] = meshgrid(x, y);
    
    % Constante física
    kC = 9e9;               % Constante de Coulomb (1/4πε₀)
    
    % Inicializar los campos eléctricos
    Ex = zeros(size(xG));
    Ey = zeros(size(yG));
    
    % Crear figura
    figure('Name', 'Campo Eléctrico de Filas de Cargas');
    
    % Determinar colores según la carga (rojo para positiva, azul para negativa)
    colorP = [1 0 0];        % Rojo para carga positiva
    colorN = [0 0 1];        % Azul para carga negativa
    
    hold on;
    
    % Generar posiciones para la primera fila (superior)
    yCp = d/2;
    for i = 1:n
        % Calcular posición horizontal centrada
        xCp = (-(n-1)/2 + (i-1)) * sep_x;
        
        % Cálculo del campo eléctrico para esta carga usando ciclos for
        for row = 1:size(xG, 1)
            for col = 1:size(xG, 2)
                Rx_p = xG(row, col) - xCp;
                Ry_p = yG(row, col) - yCp;
                R_p = (Rx_p^2 + Ry_p^2);
                if R_p > 0
                    R_p = R_p^2;
                    Ex(row, col) = Ex(row, col) + kC * Qp * Rx_p / R_p;
                    Ey(row, col) = Ey(row, col) + kC * Qp * Ry_p / R_p;
                end
            end
        end
        
        % Dibujar partícula de la primera fila con tamaño proporcional a la carga
        h_p = rectangle('Position', [xCp - ap/2, yCp - ap/2, ap, ap], 'Curvature', [1 1]);
        if Qp > 0
            set(h_p, 'FaceColor', colorP, 'EdgeColor', [0 0 0]);
        else
            set(h_p, 'FaceColor', colorN, 'EdgeColor', [0 0 0]);
        end
    end
    
    % Etiqueta para la primera fila (colocada al lado izquierdo)
    text(-n*sep_x/2-0.3, yCp, ['Q = ', num2str(Qp)], 'VerticalAlignment', 'middle');
    
    % Generar posiciones para la segunda fila (inferior)
    yCn = -d/2;
    for i = 1:n
        % Calcular posición horizontal centrada
        xCn = (-(n-1)/2 + (i-1)) * sep_x;
        
        % Cálculo del campo eléctrico para esta carga usando ciclos for
        for row = 1:size(xG, 1)
            for col = 1:size(xG, 2)
                Rx_n = xG(row, col) - xCn;
                Ry_n = yG(row, col) - yCn;
                R_n = (Rx_n^2 + Ry_n^2);
                if R_n > 0
                    R_n = R_n^2;
                    Ex(row, col) = Ex(row, col) + kC * Qn * Rx_n / R_n;
                    Ey(row, col) = Ey(row, col) + kC * Qn * Ry_n / R_n;
                end
            end
        end
        
        % Dibujar partícula de la segunda fila con tamaño proporcional a la carga
        h_n = rectangle('Position', [xCn - an/2, yCn - an/2, an, an], 'Curvature', [1 1]);
        if Qn > 0
            set(h_n, 'FaceColor', colorP, 'EdgeColor', [0 0 0]);
        else
            set(h_n, 'FaceColor', colorN, 'EdgeColor', [0 0 0]);
        end
    end
    
    % Etiqueta para la segunda fila (colocada al lado izquierdo)
    text(-n*sep_x/2-0.3, yCn, ['Q = ', num2str(Qn)], 'VerticalAlignment', 'middle');
    
    % Calcular magnitud del campo eléctrico y vectores unitarios
    E = sqrt(Ex.^2 + Ey.^2);
    u = zeros(size(E));
    v = zeros(size(E));
    
    % Calcular vectores unitarios usando ciclos for
    for row = 1:size(E, 1)
        for col = 1:size(E, 2)
            if E(row, col) > 0
                u(row, col) = Ex(row, col) / E(row, col);
                v(row, col) = Ey(row, col) / E(row, col);
            end
        end
    end
    
    % Graficar el campo eléctrico con vectores
    h = quiver(xG, yG, u, v, 'autoscalefactor', 0.5);
    set(h, 'color', [0.7 0 0.7]);
    
    % Añadir línea entre filas para mostrar la distancia
    plot([0, 0], [yCp, yCn], 'k--', 'LineWidth', 1);
    text(0.1, 0, ['d = ', num2str(d), ' m'], 'VerticalAlignment', 'middle');
    
    % Configurar gráfico
    title(['Campo Eléctrico - ', num2str(n), ' partículas por fila, d = ', num2str(d), ' m']);
    axis([-lim lim -lim lim]);
    xlabel('x (m)');
    ylabel('y (m)');
    box on;
    hold off;
end
