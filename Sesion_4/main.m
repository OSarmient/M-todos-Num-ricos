clear
clc

format long

%* ------------- Recta de Regresión ------------*%

x = [-1, 0, 1, 2, 3, 4, 5, 6];
y = [10, 9, 7, 5, 4, 3, 0, -1];

%ans = regresionLineal(x, y)

%* ------------- Polinomio de Regresión ------------*%

X = [-3, 0, 2, 4];
Y = [3, 1, 1, 3];
M = 2;

PR = PolinomioRegresion(X, Y, M);
