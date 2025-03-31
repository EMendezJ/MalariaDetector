clc;
clear;
Px = [0.00586; % C - 1
    0.12692;    % D - 2
    0.33012;    % E - 3
    0.50376;    % F - 4
    0.93664;    % G - 5
    1.46542;    % H - 6
    1.81418;    % I - 7
    4.54539;    % J - 8
    6.67035;    % K - 9
    9.18146;    % L - 10
    10.7846;   % M - 11
    12.08967;   % N - 12
    13.52305;   % O - 13
    13.89855;   % Q - 14
    14.29572    % R - 15
    14.50454    % S - 16
    8.21572     % P - 17
    ];

Py = [1.89669;  % C - 1
    1.99085;    % D - 2
    1.92967;    % E - 3
    1.89838;    % F - 4
    2.13712;    % G - 5
    2.6659;     % H - 6
    2.93591;    % I - 7
    3.70833;    % J - 8
    3.25298;    % K - 9
    1.57434;    % L - 10
    0.9218;    % M - 11
    0.75263;    % N - 12
    1.0659      % O - 13
    1.19967     % Q - 14
    1.27708     % R - 15
    1.09806     % S - 16
    2.31713     % P - 17
    ];

hold on; % Mantiene la gráfica actual para agregar múltiples curvas sin borrar las anteriores.
delta = 0.01; % Define el incremento en el eje X para interpolación.

%Funcion 1
x = [Px(1), Px(2), Px(3), Px(4)]; % Valores x
y = [Py(1), Py(2), Py(3), Py(4)]; % Valores y
x1 = Px(1):delta:Px(4); % Valores x de la funcion 1
y1 = spline(x,y,x1); % Interpolacion
 
%Funcion 2
x = [Px(4), Px(5), Px(6), Px(7)]; % Valores x
y = [Py(4), Py(5), Py(6), Py(7)]; % Valores y
x2 = Px(4):delta:Px(7); % Valores x de la funcion 2
y2 = spline(x,y,x2); % Interpolacion

%Funcion 3
x = [Px(7), Px(8), Px(9)]; % Valores x
y = [Py(7), Py(8), Py(9)]; % Valores y
x3 = Px(7):delta:Px(9); % Valores x de la funcion 3
y3 = spline(x,y,x3); % Interpolacion

%Funcion 4
x = [Px(9), Px(17), Px(10)]; % Valores x
y = [Py(9), Py(17), Py(10)]; % Valores y
x4 = Px(9):delta:Px(10); % Valores x de la funcion 4
y4 = spline(x,y,x4); % Interpolacion

%Funcion 5
x = [Px(10), Px(11), Px(12), Px(13)]; % Valores x
y = [Py(10), Py(11), Py(12), Py(13)]; % Valores y
x5 = Px(10):delta:Px(13); % Valores x de la funcion 5
y5 = spline(x,y,x5); % Interpolacion

%Funcion 6
x = [Px(13), Px(14), Px(15), Px(16)]; % Valores x
y = [Py(13), Py(14), Py(15), Py(16)]; % Valores y
x6 = Px(13):delta:Px(16); %Valores x para la funcion 6
y6 = spline(x,y,x6); % Interpolacion

%Matrices con funciones
X = [x1,x2,x3,x4,x5,x6]; % Vector con los valores finales de x
Y = [y1,y2,y3,y4,y5,y6]; % Vector con los valores finales de y

%Grafica 2D
subplot(1,2,1); % Se usa para poner la grafica a la izquierda
plot(X,Y,'k', 'LineWidth',3); % Grafica el diagrama
xlim([0 19]); % Establece los limites en x
ylim([0 10]); %Establece los limites en y
camroll(90); % Gira la camara 90 grados

%Grafica 3D
subplot(1,2,2); % Coloca la grafica a la derecha
cylinder(Y); % Hace el diagrama en 3D

% Obtencion de los coeficientes
P1 = vander(Px(1:4))\Py(1:4);
P2 = vander(Px(4:7))\Py(4:7);
P3 = vander(Px(7:9))\Py(7:9);
P4 = vander((Px([9,17,10])))\Py([9,17,10]);
P5 = vander(Px(10:13))\Py(10:13);
P6 = vander(Px(13:16))\Py(13:16);

% Obtencion de las funciones
f1 = @(x) pi*(P1(1)*x.^3 + P1(2)*x.^2 + P1(3)*x + P1(4)).^2;
f2 = @(x) pi *(P2(1) * x.^3 + P2(2) * x.^2 + P2(3) * x + P2(4)).^2;
f3 = @(x) pi*(P3(1) * x.^2 + P3(2) * x + P3(3)).^2;
f4 = @(x) pi*(P4(1) * x.^2 + P4(2) * x + P4(3)).^2;
f5 = @(x) pi*(P5(1) * x.^3 + P5(2) * x.^2 + P5(3) * x + P5(4)).^2;
f6 = @(x) pi*(P6(1) * x.^3 + P6(2) * x.^2 + P6(3) * x + P6(4)).^2;

% Obtencion de volumen de todas las partes
v1 = integral(f1,Px(1), Px(4));
v2 = integral(f2, Px(4), Px(7));
v3 = integral(f3, Px(7),Px(9));
v4 = integral(f4, Px(9), Px(10));
v5 = integral(f5, Px(10),Px(13));
v6 = integral(f6,Px(13), Px(16));

% Generar una lista para sumarlos mas facilmente
V = [v1,v2,v3,v4,v5,v6];

% Sumar todos los volumenes
suma = 0;
for i = V
    suma = suma + i;
end

% Mostrar el resultado
fprintf("El volumen total del florero es %.2f cm^3 \n", suma);

densidad = 2.4;
masa = (2.4*suma)/1000;
fprintf("La masa del florero es de %.2f kg\n", masa);

precio = 20;
precioF = precio * masa;

fprintf("El precio del florero es de $%.2f pesos", precioF);