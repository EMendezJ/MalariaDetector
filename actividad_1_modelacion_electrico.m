%%
%1
t=0:0.001:10;
x = t.^2 - 2*t;
y = t+1;
plot(x,y,'r')
xlabel("Coordenada x");
ylabel("Coordenada y");
hold off;
%%
%2
t = 0:100;
x = (t.^3)-4*t;
y = (t.^2)-4;
plot(x,y)
grid on
title("Grafica Problema 2")

%%
%3
t=0:pi/10:2*pi;
u=0:pi/10:2*pi;
[T,U] = meshgrid(t,u);
x = cos(T).*cos(U);
y = cos(T).*sin(U);
z = (cos(T)).^2;
surf(x,y,z)

%%
%4
x=0:100;
y=0:100;
[X,Y]=meshgrid(x,y);
z = 0.2*X + cos(Y);
mesh(X,Y,z)

%%
%5
x=0:10;
y1=x.^2;
y2= log(x);
y3=1./x;

figure;
hold on;

plot(x,y1,'-ob');
plot(x,y2, '-xr');
plot(x,y3, 'diamond');
legend("Primera funcion", "Segunda funcion", "Tercera funcion")

%%
%6
x =-1:0.1:1;
y =-1:0.1:1;
[X,Y]=meshgrid(x,y);
U=Y;
V=X;
quiver(X,Y,U,V);
