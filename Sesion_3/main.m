clear
clc

format long
%* -------------Interpolador de Lagrange------------- *%
f = @(x) cos(x);

%P1 = intlagrange([0.0, 1.2], [f(0), f(1.2)], f)
%Q1= intlagrange([0.2 1.0],[f(0.2) f(1)],f)
%P2= intlagrange([0.0 0.6 1.2],[f(0) f(0.6) f(1.2)],f)
%P3= intlagrange([0.0 0.4 0.8 1.2],[f(0) f(0.4) f(0.8) f(1.2)],f)

%* -------------Newton en Diferencias Finitas------------- *%

X = [50, 60, 70, 80, 90, 100];
Y = [24.94, 30.11, 36.05, 42.84, 50.57, 59.30];
P = 64;
G = 3;
P0 = 2;

[D, v] = newtonInterpolation(X, Y, P, G, P0)
