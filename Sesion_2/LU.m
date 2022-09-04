function [L, U] = LU(A)
  % LU Summary of this function goes here
  % Input:  A -- Matriz de coeficientes del sistema
  % Output: L -- La matriz triangular inferior
  %         U -- La matriz triangular superior


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
end

