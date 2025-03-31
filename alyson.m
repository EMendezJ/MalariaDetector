clc;
clear;

%Puntos X
Px = [0;            % C - 1
    0.06966;        % D - 2
    0.10749;        % E - 3
    0.24942;        % F - 4
    0.36493;        % G - 5
    0.73467;        % H - 6
    1.08902;        % I - 7
    1.42005;        % J - 8
    1.76619;        % K - 9
    2.03211;        % L - 10
    2.30456;        % M - 11
    2.58208;        % N - 12
    3.04069;        % O - 13
    3.52399;        % P - 14
    4.523;          % Q - 15
    5.38629;        % R - 16
    6.43844;        % S - 17
    7.4;            % T - 18
    7.66152;        % U - 19
    8.11995;        % V - 20
    8.59037;        % W - 21
    8.73371;        % Z - 22
    8.80899;        % A1 - 23
    9.29402;        % B1 - 24
    9.85437;        % C1 - 25
    ];
Py = [0;    % C - 1
    1.14075;    % D - 2
    1.36494;    % E - 3
    1.63663;    % F - 4
    1.77705;    % G - 5
    1.78992;    % H - 6
    1.85986;    % I - 7
    1.93446;    % J - 8
    1.99531;    % K - 9
    2.05307;    % L - 10
    2.07253;    % M - 11
    2.08672;    % N - 12
    2.07944;    % O - 13
    2.01457;    % P - 14
    1.79076;    % Q - 15
    1.76617;    % R - 16
    1.93767;    % S - 17
    2;          % T - 18
    1.95302;    % U - 19
    1.78192;    % V - 20
    1.48436;    % W - 21
    1.47629;    % Z - 22
    1.5591;     % A1 - 23
    1.55777;    % B1 - 24
    1.55777;    % C1 - 25
    ];

hold on
delta = 0.01;

%Obtencion de nuestra nueva matriz para Py para dibujar el grosor de
%nuestro termo.
Pynueva = Py - 0.5;

%Funcion 1
x = [Px(1), Px(2), Px(3)]; % Valores X
y = [Py(1), Py(2), Py(3)]; % Valores Y
x1 = Px(1):delta:Px(3);    % Valores interpolados en X
y1 = spline(x,y,x1);       % Interpolacion

%Funcion 2
x = [Px(3), Px(4), Px(5)]; % Valores X
y = [Py(3), Py(4), Py(5)]; % Valores Y
x2 = Px(3):delta:Px(5);    % Valores interpolados en X
y2 = spline(x,y,x2);       % Interpolacion

%Funcion 3
x = [Px(5), Px(6), Px(7), Px(8)]; % Valores X
y = [Py(5), Py(6), Py(7), Py(8)]; % Valores Y
x3 = Px(5):delta:Px(8);           % Valores interpolados en X
y3 = spline(x,y,x3);              % Interpolacion

%Funcion 4
x = [Px(8), Px(9), Px(10)]; % Valores X
y = [Py(8), Py(9), Py(10)]; % Valores Y
x4 = Px(8):delta:Px(10);    % Valores interpolados en X
y4 = spline(x,y,x4);        % Interpolacion

%Funcion 5
x = [Px(10), Px(11), Px(12)]; % Valores X
y = [Py(10), Py(11), Py(12)]; % Valores Y
x5 = Px(10):delta:Px(12);     % Valores interpolados en X
y5 = spline(x,y,x5);          % Interpolacion

%Funcion 6
x = [Px(12), Px(13), Px(14), Px(15)]; % Valores X
y = [Py(12), Py(13), Py(14), Py(15)]; % Valores Y
x6 = Px(12):delta:Px(15);             % Valores interpolados en X
y6 = spline(x,y,x6);                  % Interpolacion

%Funcion 7
x = [Px(15), Px(16), Px(17), Px(18)]; % Valores X
y = [Py(15), Py(16), Py(17), Py(18)]; % Valores Y
x7 = Px(15):delta:Px(18);             % Valores interpolados en X
y7 = spline(x,y,x7);                  % Interpolacion

%Funcion 8
x = [Px(18), Px(19), Px(20), Px(21)]; % Valores X
y = [Py(18), Py(19), Py(20), Py(21)]; % Valores Y
x8 = Px(18):delta:Px(21);             % Valores interpolados en X
y8 = spline(x,y,x8);                  % Interpolacion

%Funcion 9
x = [Px(21), Px(22), Px(23)]; % Valores X
y = [Py(21), Py(22), Py(23)]; % Valores Y
x9 = Px(21):delta:Px(23);     % Valores interpolados en X
y9 = spline(x,y,x9);          % Interpolacion

%Funcion 10
x = [Px(23), Px(24), Px(25)]; % Valores X
y = [Py(23), Py(24), Py(25)]; % Valores Y
x10 = Px(23):delta:Px(25);    % Valores interpolados en X
y10 = spline(x,y,x10);        % Interpolacion

%Matrices con funciones
X = [x1, x2, x3,x4,x5,x6,x7,x8,x9,x10]; % Vector con todos los valores de X
Y = [y1,y2,y3,y4,y5,y6,y7,y8,y9,y10];   % Vector con todos los valores de Y

%Grafica 2D
subplot(1,2,1);               % Dividir Imagen
plot(X,Y,'k', 'LineWidth',5); % Dibuja la curva interpolada en color negro ('k') con grosor 5
xlim([0 10]);                 % Limites en X
ylim([0 3]);                  % Limites en Y
camroll(90);                  % Rotar la vista de la grafica en 90 Grados

%Grafica 3D
subplot(1,2,2); % Selecciona la segunda sección de la ventana dividida
cylinder(Y);    % Genera una representación cilíndrica de los datos

% Obtencion de las funciones
f1 = @(x) (P1(1) * x.^2) + (P1(2) * x) + (P1(3));
f2 = @(x) (P2(1) * x.^2) + (P2(2) * x) + (P2(3));
f3 = @(x) (P3(1) * x.^3) + (P3(2) * x.^2) + (P3(3) * x) + (P3(4));
f4 = @(x) (P4(1) * x.^2) + (P4(2) * x) + (P4(3));
f5 = @(x) (P5(1) * x.^2) + (P5(2) * x) + (P5);