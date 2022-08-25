function bisection(f, a, b, n)
    %BISECTION Summary of this function goes here
    %   Detailed explanation goes here
    %   intput:     f -- La función a evaluar
    %               a -- Extremo izquierdo del intervalo
    %               b -- Extremo derecho del intervalo
    %               n -- Cantidad de iteraciones
    %   output:     La impresión en pantalla de el numero de iteraciones,
    %               el extremo izquierdo, el punto medio, el extremo derecho,
    %               y la evaluación de la función

    fplot(f,[a,b],'LineWidth',2)
    xlabel('x'); ylabel('y')
    title('Metodo de Biseccion');
    grid on

    % Evaluar y verificar que exista un cambio de signo
    c = f(a);
    d = f(b);
    if c*d > 0.0
        error('Los extremos tienen los mismos signos')
    end

    disp('            k             Extremo Izq         Punto Medio          Extremo Der            f(x)')
    for i = 0:n
        % Encuentra el punto medio
        x = (a + b) / 2;
        y = f(x);
        disp([  i   a    x   b   y])
        if y == 0.0 %Solución exacta
            a = x;
            b = x;
            break
        end
        % Decide qué mitad usar
        if c*y < 0.0
            b = x;
        else
            a = x;
        end
    end
    x = (a + b)/2;

    hold on
    plot(x,0,'rd','MarkerSize',6)
    legend({'f(x)','Raiz aproximada'},'Location','northwest')

end

