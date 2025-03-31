%Autor: Luis ALvaro Rosales Salazar
%Fecha: 28 de Septiembre de 2024

A = rand(4);
disp(A)

%Consiste en una multiplicacion matricial
B = A * A;
disp(B)

%Cada elemento se multiplica por el elemento de la segunda
%matriz en la misma posicion
C = A .* A;
disp(C);

% Trata de resolver un sistema de ecuaciones simultaneas tal que AX = A. Es
% como encontrar la matriz identidad.
D = A \ A;
disp(D);

%Divide cada elemento de la primera matriz por el elemento de la segunda
%matriz en su misma posicion.
E = A./ A;
disp(E);

%Calcula el determinante de la matriz
F = det(A);
disp(F);

%Calcula la inversa de la matriz
G = inv(A);
disp(G);