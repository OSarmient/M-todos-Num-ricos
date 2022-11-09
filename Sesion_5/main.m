clear
clc

format long

%* ------- Derivación Numérica ------ *%
g = @(x) -sin(x);
h = 0.01;
t0 = 0.8;

DPol = Derivacion(t0, h, g)
%* -- Regla Compuesta del Trapecio -- *%
f = @(x)  2 + sin(2 * sqrt(x));
a = 1;
b = 6;

%trapecio(a, b, 11, f)

%* --- Regla Compuesta de Simpson --- *%

%s = simpsonRule(f, a, b, 5)
