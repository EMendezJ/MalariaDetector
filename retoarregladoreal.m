clc;
clear;

%Puntos X
Px = [0.00000;    % C-1
      1.16934;    % D-2
      1.99639;    % E-3
      3.27715;    % F-4
      4.48313;    % G-5
      5.93171;    % H-6
      7.21473;    % I-7
      8.43568;    % J-8
      9.92565;    % K-9
      11.51908;   % L-10
      13.23669;   % M-11
      14.86397;   % N-12
      16.1183;    % O-13
      17.71949;   % P-14
      18.95625;   % Q-15
      20.01265;   % R-16
      20.75986;   % S-17
      21.50707;   % T-18
      21.99435;   % U-19
      22.25074;   % V-20
      22.43966;   % W-21
      22.68717;   % Z-22
      22.80083;   % A1-23
      23.48056;   % B1-24
      24.20263;   % C1-25
      24.99067    % D1 - 26
      ];  

Py = [4.89232;    % C-1
      4.89365;    % D-2
      5.10208;    % E-3
      5.42227;    % F-4
      5.69047;    % G-5
      5.73186;    % H-6
      5.66977;    % I-7
      5.5663;     % J-8
      5.15242;    % K-9
      4.84201;    % L-10
      4.86271;    % M-11
      5.14875;    % N-12
      5.44749;    % O-13
      5.61647;    % P-14
      5.48764;    % Q-15
      5.15268;    % R-16
      4.74043;    % S-17
      4.30241;    % T-18
      4.10872;    % U-19
      4.23692;    % V-20
      4.4056;     % W-21
      4.2527;     % Z-22
      4.30574;    % A1-23
      4.3;        % B1-24
      4.3;        % C1-25
      4.3;        % D1 - 26
      ]; 
hold on
delta = 0.01;

% Función #1
x = [Px(1), Px(2), Px(3), Px(4)]; % Valores X
y = [Py(1), Py(2), Py(3), Py(4)]; % Valores Y
x1 = Px(1): delta : Px(4); % Valores Prueba
y1 = spline(x, y, x1); % Interpolación

% Función #2
x = [Px(4), Px(5), Px(6), Px(7)]; % Valores X
y = [Py(4), Py(5), Py(6), Py(7)]; % Valores Y
x2 = Px(4): delta : Px(7); % Valores Prueba
y2 = spline(x, y, x2); % Interpolación

% Función #3
x = [Px(7), Px(8), Px(9), Px(10)]; % Valores X
y = [Py(7), Py(8), Py(9), Py(10)]; % Valores Y
x3 = Px(7): delta : Px(10); % Valores Prueba
y3 = spline(x, y, x3); % Interpolación

% Función #4
x = [Px(10), Px(11), Px(12), Px(13)]; % Valores X
y = [Py(10), Py(11), Py(12), Py(13)]; % Valores Y
x4 = Px(10): delta : Px(13); % Valores Prueba
y4 = spline(x, y, x4); % Interpolación

% Función #5
x = [Px(13), Px(14), Px(15), Px(16)]; % Valores X
y = [Py(13), Py(14), Py(15), Py(16)]; % Valores Y
x5 = Px(13): delta : Px(16); % Valores Prueba
y5 = spline(x, y, x5); % Interpolación

% Función #6 
x = [Px(16), Px(17), Px(18)]; % Valores X
y = [Py(16), Py(17), Py(18)]; % Valores Y
x6 = Px(16): delta : Px(18); % Valores Prueba
y6 = spline(x, y, x6); % Interpolación

% Función #7 
x = [Px(18), Px(19), Px(20), Px(21)]; % Valores X
y = [Py(18), Py(19), Py(20), Py(21)]; % Valores Y
x7 = Px(18): delta : Px(21); % Valores Prueba
y7 = spline(x, y, x7); % Interpolación

% función #8 
x = [Px(21), Px(22), Px(23)]; % Valores X
y = [Py(21), Py(22), Py(23)]; % Valores Y
x8 = Px(21): delta : Px(23); % Valores Prueba
y8 = spline(x, y, x8); % Interpolación

% función #9
x = [Px(23), Px(24), Px(25), Px(26)]; % Valores X
y = [Py(23), Py(24), Py(25), Py(26)]; % Valores Y
x9 = Px(23): delta : Px(26); % Valores Prueba
y9 = spline(x, y, x9); % Interpolación

%Matrices con funciones
X = [x1,x2,x3,x4,x5,x6,x7,x8,x9]; % Matriz con todos los valores de X
Y = [y1,y2,y3,y4,y5,y6,y7,y8,y9];   % Matriz con todos los valores de Y

%Grafica 2D
subplot(1,2,1);               % Dividir Imagen
hold on;
plot(X,Y,'k', 'LineWidth',5); % Dibuja la curva interpolada en color negro ('k') con grosor 5
plot(X, Y - 0.5, 'r', 'LineWidth', 2); % Contorno interior en rojo, que nos muestra el grosor que hay 
xlim([0 25]);                 % Limites en X
ylim([0 8]);                  % Limites en Y
camroll(90);                  % Rotar la vista de la grafica en 90 Grados

%Grafica 3D
hold on;
subplot(1,2,2); % Selecciona la segunda sección de la ventana dividida
cylinder(Y);    % Genera una representación cilíndrica de los datos
shading interp;               % Suavizar colores en la superficie
camlight;                     % Agregar luz para resaltar profundidad
set(gca, 'XColor', 'none', 'YColor', 'none', 'ZColor', 'none'); % Eliminar bordes y ejes

% Obtención de coeficientes
P1 = vander(Px(1:4))\Py(1:4);  
P2 = vander(Px(4:7))\Py(4:7);  
P3 = vander(Px(7:10))\Py(7:10); 
P4 = vander(Px(10:13))\Py(10:13); 
P5 = vander(Px(13:16))\Py(13:16); 
P6 = vander(Px(16:18))\Py(16:18); 
P7 = vander(Px(18:21))\Py(18:21); 
P8 = vander(Px(21:23))\Py(21:23); 
P9 = vander(Px(23:26))\Py(23:26); 
disp(P1)

% Obtencion de las funciones
f1 = @(x) (P1(1)*x.^3 + P1(2)*x.^2 + P1(3)*x + P1(4)).^2;
f2 = @(x) (P2(1)*x.^3 + P2(2)*x.^2 + P2(3)*x + P2(4)).^2;
f3 = @(x) (P3(1)*x.^3 + P3(2)*x.^2 + P3(3)*x + P3(4)).^2;
f4 = @(x) (P4(1)*x.^3 + P4(2)*x.^2 + P4(3)*x + P4(4)).^2;
f5 = @(x) (P5(1)*x.^3 + P5(2)*x.^2 + P5(3)*x + P5(4)).^2;
f6 = @(x) (P6(1)*x.^2 + P6(2)*x + P6(3)).^2;
f7 = @(x) (P7(1)*x.^3 + P7(2)*x.^2 + P7(3)*x + P7(4)).^2;
f8 = @(x) (P8(1)*x.^2 + P8(2)*x + P8(3)).^2;
f9 = @(x) (P9(1)*x.^3 + P9(2)*x.^2 + P9(3)*x + P9(4)).^2;


% Obtencion de las funciones del grosor interno
f1i = @(x) (P1(1)*x.^3 + P1(2)*x.^2 + P1(3)*x + (P1(4)-0.5)).^2;
f2i = @(x) (P2(1)*x.^3 + P2(2)*x.^2 + P2(3)*x + (P2(4)-0.5)).^2;
f3i = @(x) (P3(1)*x.^3 + P3(2)*x.^2 + P3(3)*x + (P3(4)-0.5)).^2;
f4i = @(x) (P4(1)*x.^3 + P4(2)*x.^2 + P4(3)*x + (P4(4)-0.5)).^2;
f5i = @(x) (P5(1)*x.^3 + P5(2)*x.^2 + P5(3)*x + (P5(4)-0.5)).^2;
f6i = @(x) (P6(1)*x.^2 + P6(2)*x + (P6(3)-0.5)).^2;
f7i = @(x) (P7(1)*x.^3 + P7(2)*x.^2 + P7(3)*x + (P7(4)-0.5)).^2;
f8i = @(x) (P8(1)*x.^2 + P8(2)*x + (P8(3)-0.5)).^2;
f9i = @(x) (P9(1)*x.^3 + P9(2)*x.^2 + P9(3)*x + (P9(4)-0.5)).^2;


% Obtener volumen interno
v1i = pi * (integral(f1i, Px(1), Px(4)));
v2i = pi * (integral(f2i, Px(4), Px(7)));
v3i = pi * (integral(f3i, Px(7), Px(10)));
v4i = pi * (integral(f4i, Px(10), Px(13)));
v5i = pi * (integral(f5i, Px(13), Px(16)));
v6i = pi * (integral(f6i, Px(16), Px(19)));
v7i = pi * (integral(f7i, Px(19), Px(22)));
v8i = pi * (integral(f8i, Px(22), Px(24)));
v9i = pi * (integral(f9i, Px(24), Px(26)));
volumen_total_int = v1i + v2i + v3i + v4i + v5i + v6i + v7i + v8i + v9i;

% Obtener volumen externo
v1e = pi* (integral(f1, Px(1), Px(4)));
v2e = pi*(integral(f2, Px(4), Px(7)));
v3e = pi * (integral(f3, Px(7), Px(10)));
v4e = pi * (integral(f4, Px(10), Px(13)));
v5e = pi * ((integral(f5, Px(13), Px(16))));
v6e = pi * ((integral(f6, Px(16), Px(19))));
v7e = pi * ((integral(f7, Px(19), Px(22))));
v8e = pi * ((integral(f8, Px(22), Px(24))));
v9e = pi * ((integral(f9, Px(24), Px(26))));
volumen_total_ext = v1e + v2e + v3e + v4e + v5e + v6e + v7e + v8e + v9e;

% Calculo del volumen total
volumen_total = volumen_total_ext - volumen_total_int;

% Obtener volumen de la base
h_base = 0.5; % Grosor de la base en cm
r_base = Py(1); % Radio de la base, asumiendo que Py contiene los radios del florero
volumen_base = pi * r_base^2 * h_base; % Volumen de la base en cm^3

% Obtener volumen de la tapa
h_tapa = 0.25;
r_tapa = Py(26);
volumen_tapa = pi * r_tapa^2 * h_tapa;

% Costo 
dns = 7.85; % g/cm^3 (Acero Inoxidable)
masa = dns * volumen_total; % Formula para sacar la masa, Densidad por volumen
masa_kg = masa / 1000;
fprintf("El volumen del termo es de %.2f cm^3\n", volumen_total)
fprintf("La masa del termo es %.2f kg\n", masa_kg); 
precio_por_kg = 80; % Precio del Acero Inoxidable en pesos por kg
costo = precio_por_kg * masa_kg;
fprintf("El costo del termo es $%.2f pesos\n",costo);

% Parámetros de la base
num_puntos = 50;  % Resolución del círculo
r_base = Py(1);   % Radio de la base (igual al radio exterior del bebedero)
h_base = 0; % Altura de la base (parte inferior del bebedero)

% Generación de puntos para el círculo de la base
theta = linspace(0, 2*pi, num_puntos);
x_base = r_base * cos(theta); % Coordenadas en X del círculo
y_base = r_base * sin(theta); % Coordenadas en Y del círculo
z_base = h_base * ones(size(theta)); % Coordenadas en Z del círculo

% Dibujar la base en la parte inferior
hold on
fill3(x_base, y_base, z_base, 'k') % Relleno de la base en color negro
hold off

% Test del cilindro
h = max(Px)-min(Px);
r = max(Py);
volumen = pi * r^2 * h;
fprintf("El volumen del cilindro es %.2f cm^3\n", volumen)