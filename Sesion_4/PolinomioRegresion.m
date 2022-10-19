function PR = PolinomioRegresion(x,y,M)
  %  Se ingresa el vector de absicas x de n datos
  %  Se ingresa el vector de ordenadas y de n datos
  %  Se ingresa el grado del polinomio M

n = length(x);
B = zeros(1:M+1);   % Se asigna a B una matriz de 0s de 1 fila y M+1 columnas
F = zeros(n,M+1);   % Se asigna a F una matriz de 0s de n filas y m+1 columnas
syms t
for k = 1:M+1
  F(:,k)=(x').^(k-1);  % Se reemplaza la matriz de 0s con columnas con las potencias de x
end
A = (F')*F;
B = (F')*(y');
scatter(x,y)
hold on
grid on

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

Z=[L B];     %Se le asigna a Z el ensamble de la Matriz L con la matriz B

  y=zeros(n,1);     %se le asigna a y una matriz vertical de n filas con valores = 0

  y(1)=Z(1,n+1)/Z(1,1);    %Se establece la solucion para y1 para despuer generalizar el calculo
  for i=2:n
    s=0;
    for j=1:n-1             %Se comienzan a correr los valores de j
      s=s+Z(i,j)*y(j);       %Acumulacion de s a medida que incrementa j
    end
    y(i)=(Z(i,n+1)-s)/Z(i,i);
  end
  y;

  D = [U y];        %Se le asigna a D el ensamble de la Matriz U con la matriz y
  [n, m]=size(D);
  C=zeros(n,1);
  C(n)=D(n,n+1)/D(n,n);

  for i=n-1:-1:1

    S=0;

    for j=n:-1:i+1
      S=S+D(i,j)*C(j);

    end
    C(i)=(D(i,n+1)-S)/D(i,i);
  end
C
P=0;
for i=2:n
    P=P+ (t^(i-1))*C(i);     %Ecuacion final polinomio
  end
  P=P + C(1)
ezplot(P,[-3,4])
legend({'Datos','Polinomio de ajuste'},'Location','best');
end




