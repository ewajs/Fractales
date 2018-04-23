clear all;
close all;
clc;
% Primera Matriz Probabilidad 1%
A1 = [0 0 ; 0 0.16];
A2 = [0 ; 0]
% Segunda Matriz Probabilidad 85%
B1 = [0.85 0.04 ; -0.04 0.85]; 
B2 = [0; 1.6];
% Tercera Matriz Probabilidad 7%
C1 = [0.2 -0.26 ; 0.23 0.22];
C2 = [0 ; 1.6];
% Cuarta Matriz Probabilidad 7%
D1 = [-0.15 0.28 ; 0.26 0.24];
D2 = [0 ; 0.4];
% Numero de Iteraciones
N = 1000000
% Punto Inicial
M{1} = [0.8 ; 0.3]
figure
hold on
for i=2:N
    p = 100*rand(); % Número aleatorio entre 0 y 100
    if (p < 1)
        M{i} = A1 * M{i-1} + A2;
    elseif (p > 1 && p < 86)
        M{i} = B1 * M{i-1} + B2;
    elseif (p > 86 && p < 93)
        M{i} = C1 * M{i-1} + C2;
    elseif (p > 93)
        M{i} = D1 * M{i-1} + D2;
    end    
end
M = cell2mat(M);
Y = M(2,:);
X = M(1,:);
plot(X,Y, 'g.', 'markers',1);
