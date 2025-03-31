%Autor Luis ALvaro Rosales Salazar
%Fecha 8 de Octubre de 2024

%Definir los valores iniciales
t0 = 0;
tf = 1;
vox = 0;
xo = 4;
m = 0.0006;
k = 10;

%Definir el vector del tiempo
t = linspace(t0, tf, 10000);

%Definir las 2 y
y1 = zeros(1, length(t));
y2 = zeros(1,length(t));
y1(1) = vox;
y2(1) = xo;

%Hallar los valores de y
for i = 2:length(t)
y1(i) = y1(i-1)-(((k * y2(i-1))/m)*(t(i) - t(i-1)));
y2(i) = y2(i-1) + (y1(i-1) * (t(i) - t(i-1)));
end

%Encontrar los picos de la funcion y1 y y2
[pks, locs] = findpeaks(y1,t);
[pks2, locs2] = findpeaks(y2,t);


%Calcular el periodo como la diferencia entre dos picos sucesivos
T = mean(diff(locs));
T2 = mean(diff(locs2));

%Imprimir el periodo real de las 2 funciones
fprintf('El valor del periodo real es %f\n', T);
fprintf('El valor del periodo real de la segunda funcion es %f\n', T2);

%Calcular el periodo teoretico
Tteo = (2 * pi)*((sqrt(m))/(sqrt(k)));

%Imprimir el periodo teoretico
fprintf('El valor teoretico del periodo es %f\n', Tteo);

%Graficar la primera grafica
subplot(2,1,1);
plot(t, y1);
title('Grafica de velocidad contra tiempo');
xlabel('Tiempo')
ylabel('Posicion')
legend('Velolocidad', 'Location', 'northeast');

%Graficar la segunda grafica
subplot(2,1,2);
plot(t, y2);
title('Grafica de posicion contra tiempo');
xlabel('Tiempo');
ylabel('Posicion')
legend('Posicion', 'Location', 'northeast');