%Autor: Luis ALvaro Rosales Salazar
%Fecha: 28 de Septiembre de 2024

%Definir los valores
v0 = 162;
g = 9.81;
a = 70;
t = 1:5:46;

for val = t
    %Calcular los valores
    x = v0 * cos((deg2rad(a))) * val;
    y = ((v0 * sin((deg2rad(a))) * val) - (0.5 * g * (val^2)));
    r = sqrt((x^2 + y^2));
    ang = atan((y / x));
    ang = rad2deg(ang);
    if ang < 0
        ang = 360 + ang;
    end
    
    %Imprimir los valores
    fprintf('El valor de la magnitud es %f y el valor del angulo es %f \n', r,ang);
end



