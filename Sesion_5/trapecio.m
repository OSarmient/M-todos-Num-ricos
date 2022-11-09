function trapecio(a, b, m, f)
    % Regla Compuesta del Trapecio Integral
    %   input:  a -- Intervalo mínimo
    %           b -- Intervalo Máximo
    %           m -- Número de subintevalos
    %           f -- Función a evaluar

    % Creación de la gráfica
    ezplot(f, [a-1, b])
    title('Regla Compuesta del Trapecio')
    xlabel([num2str(a-1), ' < x < ', num2str(b)])
    ylabel('f(x)')

    hYLabel = get(gca,'YLabel');
    set(hYLabel,'rotation',0,'VerticalAlignment','middle')

    hold on
    x = linspace(a-1, b, m);
    y = f(x);
    plot(x, y, '--ro')
    
    legend({'f(x) continua', 'f(x) subintervalos'}, 'Location', 'southwest')
    hold off


    % Se revisa que el denominador de h no sea 0
    try
        h = (b - a) / (m - 1);
    catch
        dbstop if warning MATLAB:divideByZero
    end

    fprintf("h = %1.1f \n\n", h)

    fprintf("f(%1.0f) = %6.8f \n", a, f(a))
    fprintf("f(%1.0f) = %6.8f \n\n", b, f(b))

    % Calculamos la primera mitad de la ecuación con los extremos del intervalo
    first = (h/2) * (f(a) + f(b));

    i = a + h;
    sec = 0;

    % Calculamos la segunda mitad con la sumatoria de los sub-intervalos
    while i < b
        fprintf("f(%1.1f) = %6.8f \n", i, f(i))
        sec = sec + f(i);
        i = i + h;
    end

    % lo juntamos todo
    trap = first + h * sec;

    %imprime
    fprintf("\nT(f, %1.1f) = %6.8f \n", h, trap)
end
