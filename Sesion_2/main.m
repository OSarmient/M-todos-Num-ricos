clear
clc

format long

% --------Factorización Triangular----------

M = [1 2 4 1; 2 8 6 4; 3 10 8 8; 4 12 10 6];
B=[21 52 79 82]';
[L, U, y, x] = LU(M, B)

% --------Método Jacobi Segundo Punto-------
A = [4 -1 1; 4 -8 1; -2 1 5]; % Coeficientes
b = [7 -21 15];               % Terminos independientes
x = [1 2 2];                  % Posible solución
t = 0.000000001;              % Tolerancia
n = 20;                       % Iteraciones

jacobi(A, b, x, t, n)
