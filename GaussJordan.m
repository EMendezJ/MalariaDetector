% GaussJordan.m
% Programacion del algoritmo de Gauss Jordan
% Luis Alvaro Rosales Salazar
clear
clc
n = input("Cuantas variables quieres encontrar: ");
A = zeros(n,n); %Llenar de zeros la matriz de las ecuaciones
for fil = 1 : n % Para ciclar por todos los  valores de las filas
    for col = 1 : n % Para ciclar por todos los valores de las columnas
        valor = input("Ingresa el coeficiente " + fil + " de la variable " + col + ": "); % Se piden los valores con el 
        % cual vamos a popular la matriz A
        A(fil,col) = valor; % Se popula la matriz A debidamente
    end
end

b = zeros(n,1); % Se crea una matriz para los valores independientes y se llena de zeros
for fil = 1: n % Se cicla por los valores de fila
    valor = input("Ingresa el termino independiente " + fil + " : "); % Aqui se le piden los terminos independientes al usuario adentro del for
    b(fil, 1) = valor; % Se popula la matriz de los valores independientes con lo que le pedimos al usuario
end
C = zeros(n,n); % Se crea una nueva matriz del mismo tamaño que A para usar cuando calculamos la inversa
C = A; % Se quivale a A
D = zeros(n,1); % Se crea una nueva matriz del mismo tamaño que b para usar cuando calculamos la inversa
D = b; % Se equivale a b
for fil = 1 : n % Se cicla por los valores de la fila
    for col = 1 : n % Se cicla por los valores de las columnas
        if fil == col
            factor = 1/ A(fil, col); % Se saca el factor (1/ el valor de el numero en posicion que deberia de ser 1) con el cual convertimos los valores en la diagonal en
            % 1's al mutiplicar las filas
            for i = 1 : n % Se cicla por i
                A(fil, i) = A(fil,i) * factor; % Se multiplican la fila por el factor para que en esa posicion (que se encuentra en la linea diagonal) salga 1
            end
            b(fil) = b(fil) * factor; % Se multiplica la fila de la matriz independiente por dicho factor para que quede todo correcto
            % y se sigan las reglas de Gauss.
        elseif fil > col % Esto se hace para asegurar que despues de este if solo hay numeros que se encuentran en el triangulo de abajo
            factor = -A(fil,col); % Se saca el numero por el cual vamos a hacer el numero que esta en ese triangulo de abajo cero. Esto aprovechando que hay 
            % un uno en la misma columna en donde en donde existe nuestro numero seleccionado que queremos cambiar a cero
            for i = 1 : n
                A(fil,i) = A(fil,i) + factor*A(col,i); % Se le resta la fila en donde esta el 1 en la misma columna que el numero que queremos hacer cero a la fila en donde 
                % esta el numero seleccionado multiplicado por el factor para hacer dicho numero cero.
            end
            b(fil) = b(fil) + factor*b(col); % Se le resta la fila que usamos en el paso anterior multiplicada por el factor que usamos en el paso 
            % anterior a la matriz de los valores independientes para
            % seguir las reglas de Gauss
        end
    end
end

for fil = n-1:-1:1 % Se usa un for de arriba para abajo para solo tratar el triangulo de arriba y se evade la fila 3
    for col = fil + 1 : n % se usa un for sumandole 1 a la columna para compensar que no tomamos en cuenta la ultima fila
        factor = -A(fil, col); % Se saca el factor necesario para hacer el numero seleccionado un cero y luego multiplicarle eso a la fila en donde existe 
        % el 1 en la misma columna que el numero seleccionado
        for i = 1 : n
            A(fil,i) = A(fil,i) + factor*A(col,i); % Se le resta a la fila donde esta el numero seleccionado del triangulo de arriba la fila en donde existe ese 1 que 
            % haria el numero seleccionado un cero multiplicado por el
            % factor para que el numero seleccionado se haga cero. 
        end
        b(fil) = b(fil) + factor * b(col); % Se le resta a la fila correspondiente de la matriz de valores lineales (la misma fila donde esta el numero 
        % seleccionado) la fila en donde existe el 1 que haria el numero seleccionado cero multiplicada por el factor que haria el numero seleciconado cero.
        % Esto para obedecer las reglas de Gauss
    end
end

% Imprimimos nuestors valores de forma bonita
fprintf("\nx = %d \n", b(1,1));
fprintf("y = %d \n", b(2,1));
fprintf("z = %d \n", b(3,1));
fprintf("t = %d \n" ,b(4,1));
fprintf("u = %d \n \n", b(5,1));
u

fprintf("\n \nAhora usando el metodo de la inversa \n \n")

% Sacamos la inversa
G = inv(C);
V = G * D;

% Imprimimos nuestros valores de forma bonita.
fprintf("x = %d \n", V(1,1));
fprintf("y = %d \n", V(2,1));
fprintf("z = %d \n", V(3,1));
fprintf("t = %d \n" ,V(4,1));
fprintf("u = %d ", V(5,1));