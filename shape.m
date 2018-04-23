clear all;
close all;
clc;

% N�mero de Iteraciones
N = 1000000;

% Numero de V�rtices
Nvert = 3;

% Escala
scale = 10;

% Ubicaci�n de los v�rtices para un pol�gono regular
for a=1:(Nvert)
   Xpol(a) = scale*sin(a*2*pi/Nvert);
   Ypol(a) = scale*cos(a*2*pi/Nvert);
end
plot(Xpol,Ypol, 'b.');

%Inicializo dos vectores para llenarlos
X = zeros(1,N);
Y = X;

% Valores del punto inicial aleatorios
X(1) = scale * rand();
Y(1) = scale * rand();
vert = 1;
prevVert = 1;
% Itero para obtener los otros puntos
for i=2:N
   vert = floor(Nvert * rand() + 1);
   % Si Nvert es par, entonces me aseguro que no sea el mismo que antes.
    while(vert == prevVert && Nvert > 3)
        vert = floor(Nvert * rand() + 1);
    end
   % X de esta iteraci�n = Punto medio entre Xv�rtice al azar y X anterior
   X(i) = (X(i - 1) + Xpol(vert))/2;
   % Y de esta iteraci�n = Punto medio entre Yv�rtice al azar e Y anterior
   Y(i) = (Y(i - 1) + Ypol(vert))/2;
   % Registro el vertice actual para evitar volver a elegirlo si Nvert par.
   prevVert = vert;
end

plot(X,Y, 'r.', 'markers', 1);
axis square
axis([-1.1*scale 1.1*scale -1.1*scale 1.1*scale]);