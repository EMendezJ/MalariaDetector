%Autor: Luis ALvaro Rosales Salazar
%Fecha: 28 de Septiembre de 2024

%Definir mis matrices
a = [-4 3 1; 5 6 -2; 2 -5 4.5];
b = [-18.2; -48.8; 92.5];

%Calcular el vector del valor
valor = a\b;

%Imprimir el valor
fprintf('El valor de x es %f, el de y es %f y el de z es %f', valor(1), valor(2), valor(3));


