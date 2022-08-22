function newton(f, fd, x0, n)
    %NEWTON-RAPHSON
    %   input:  f -- Función a evaluar
    %           fd -- Función derivada
    %           x0 -- Valor arbitrario inicial
    %           n -- Cantidad de iteraciones
    %   output: La impresión en pantalla de el numero de iteraciones,
    %           la diferencia el valor obtenido y el evaluado y 
    %           la evaluación de la función

    x = x0;
    
    disp('          k                   pk               p(k+1)-pk             f(pk)')

    for i = 0:n
        y = x - f(x)/fd(x);
        disp([  i   x   y-x     f(x)])
        x = y;
    end
end