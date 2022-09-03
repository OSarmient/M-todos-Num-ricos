function jacobi(A, b, x, t, n)
    % JACOBI Sumary of this fucntion goes here
    % Input:    A -- Matriz de coeficientes del sistema
    %           b -- Matriz de terminos independientes del sistema
    %           x -- Aproximación Inicial
    %           t -- Tolerancia
    %           n -- Número de iteraciones
    % Output:

    m = length(x);          % la longitud del vector (array) que estamos ingresando

    for k = 0:n             % El bucle que itera hasta la cantidad de veces que queramos
        w = x;              % Se le asigna a W la aproximación inicial

        fprintf("\n      k        Xk            Yk           Zk      \n")
        fprintf("      %1.0f   %6.8f    %6.8f   %6.8f   \n", k, x(1), x(2), x(3))
        for i = 1:m         % Iteración sobre la longitud de las filas
            s = 0;          % Inicializando la sumatoria
            for j = 1:m     % Iteración sobre la longitud de las colummnas
                if i ~= j   % Si el indice de las filas y las columnas son diferentes
                    s = s + A(i, j) * w(j);
                            % Sumatoria de los indices de la matriz por los indices de la aproximación inicial
                end
            end
                            % Aplicación de la ecuación
            x(i) = (b(i)-s)/A(i,i);
            if norm(w-x)<t      % Aplicación de la tolerancia
                return
            end
        end
    end
end
