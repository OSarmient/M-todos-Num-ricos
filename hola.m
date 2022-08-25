clear
clc

disp('Hola Mundo')

format long

g = @(x) x * sin(x) - 1;
bisection(g, 0, 2, 8)

f = @(x) 1980*(1-exp(-x/10))-98*x;
fd = @(x) 198*exp(-x/10)-98;
newton(f, fd, 16, 4)
