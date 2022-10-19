function ans = regresionLineal(x,y)
  % regresionLineal Summery of this function goes here
  % Input:  x -- valores del vector x
  %         y -- valores del vector y

  % Output:
  N = length(x);      % Cantidad de valores de x
  X = [ones(N,1),x']; % Se crea una matriz con una columna de unos y otra columna con los valores de x
  Y = X'*y';          % Se crea un vector con dos valores, Y(1) es la sumatoria de los valores de y, Y(2) es sumatoria de x*y
  M = X'*X;           % Matriz con los valores de las sumatorias de x
  r = inv(X'*X)*Y;    % Se resuelve el sistema de ecuaciones

  r1 = num2str(r(1));
  r2 = num2str(r(2));
  ans = strcat(r2, "x+", r1);

  plot(x,y,'bs',[0.5 8], r(1)+r(2)*[0.5 8], '--r')
