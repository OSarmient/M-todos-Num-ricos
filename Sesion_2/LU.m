function [L U  y  x] = LU(A, B)

    [m,n] = size(A);                  % A tiene m filas y n columnas
    L = eye(m);                       % L es la matriz identidad de tamaño m*m
    for k=1:n                         % iteración sobre las columnas de A
      for i=k+1:m                     % iteración sobre las filas de A
      L(i,k) = A(i,k)/A(k,k);         % Elemento Pivote
        for j=k+1:n                     % iteración para cálculo por filas
          A(i,j)=A(i,j)-L(i,k)*A(k,j);  % Operación por filas
        end
      end
    end
  L;                                  % Matriz triangular inferior
  U = triu(A);                        % Matriz triangular superior

C=[L B];     %Se le asigna a C el ensamble de la Matriz L con la matriz B

  y=zeros(n,1);     %se le asigna a y una matriz vertical de n filas con valores = 0

  y(1)=C(1,n+1)/C(1,1);    %Se establece la solucion para y1 para despuer generalizar el calculo
  for i=2:n
    s=0;
    for j=1:n-1             %Se comienzan a correr los valores de j
      s=s+C(i,j)*y(j);       %Acumulacion de s a medida que incrementa j
      endfor
    y(i)=(C(i,n+1)-s)/C(i,i);
    endfor
  y;

  D = [U y];        %Se le asigna a D el ensamble de la Matriz U con la matriz y
  [n, m]=size(D);
  x=zeros(n,1);
  x(n)=D(n,n+1)/D(n,n);

  for i=n-1:-1:1

    S=0;

    for j=n:-1:i+1
      S=S+D(i,j)*x(j);

    endfor
    x(i)=(D(i,n+1)-S)/D(i,i);
  endfor
x;
 endfunction


