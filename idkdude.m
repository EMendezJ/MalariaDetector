% Gráfica de Trayectoria (X, Y)
figure;
plot(x, y);
title('Trayectoria: X vs Y');
xlabel('Posición X (m)');
ylabel('Posición Y (m)');
grid on;


% Gráfica de Posición X y Y contra Tiempo
figure;


% Gráfica de posición en X vs Tiempo
subplot(2, 1, 1);
plot(t, x);
title('Posición vs Tiempo');
ylabel('Posición X (metros)');
xlabel('Tiempo (segundos)');
grid on;


% Gráfica de posición en Y vs Tiempo
subplot(2, 1, 2);
plot(t, y);
title('Posición Y vs Tiempo');
xlabel('Tiempo (s)');
ylabel('Posición Y (m)');
grid on;


% Gráfica de la Componente de la Velocidad contra Tiempo
figure;


% Gráfica de velocidad en X vs Tiempo
subplot(2, 1, 1);
plot(t, vx);
title('Velocidad en X vs Tiempo');
xlabel('Tiempo (s)');
ylabel('Velocidad en X (m/s)');
grid on;


% Gráfica de velocidad en Y vs Tiempo
subplot(2, 1, 2);
plot(t, vy);
title('Velocidad en Y vs Tiempo');
xlabel('Tiempo (s)');
ylabel('Velocidad en Y (m/s)');
grid on;


% Datos hipotéticos de ángulo del contrapeso y alcance
angulo = [30, 45, 60, 75, 90]; % Ángulos en grados
alcance = [5, 10, 15, 20, 18]; % Alcance en metros


% Gráfica de Alcance variando el Ángulo del Contrapeso
figure;
plot(angulo, alcance, '-o');
title('Alcance vs Ángulo del Contrapeso');
xlabel('Ángulo (grados)');
ylabel('Alcance (m)');
grid on;


% Datos de ángulos (en grados)
angulo = [30, 45, 60, 75, 90];


% Datos teóricos del modelo en MATLAB (en metros)
alcance_teorico = [5, 10, 15, 20, 18]; % Ejemplo de resultados de la simulación


% Datos experimentales de las mediciones reales, incluyendo un alcance de 0.4 metros
alcance_experimental = [4.8, 9.5, 14.7, 19.8, 0.4]; % Incluye el alcance de 40 cm


% Crear la gráfica
figure;
plot(angulo, alcance_teorico, '-o', 'DisplayName', 'Modelo Teórico');
hold on;
plot(angulo, alcance_experimental, '-x', 'DisplayName', 'Mediciones Reales');
title('Comparación: Modelo Teórico vs Mediciones Experimentales');
xlabel('Ángulo (grados)');
ylabel('Alcance (m)');
legend('Location', 'best');
grid on;