function [D, v] = newtonInterpolation(x, y, p, g, p0)
  % newtonInterpolation Summary of this function goes here
  % Input:  x -- valores del vector x
  %         y -- valores del vector y, dependientes de los valores de x
  %         p -- punto a encontrar
  %         g -- grado del polinomio
  %         p0 -- valor pivote


  n = length(x);
  D = zeros(n,n);
  D(:,1) = y;

  for j=2:n
    for i=j:n
      D(i,j) = D(i,j-1) - D(i-1,j-1);
    end
  end

  h = x(2)-x(1);
  s = (p-x(p0))/h;
  v = D(p0,1);
  for k=p0+1:g+p0
    s0 = s;
    if k>p0+1
      for l=1:k
        s0 = s0*(s-l);
      end
    end
    v = v + (D(k,k-p0+1)*s0)/factorial(k-p0);
  end

  A = linspace(x(1), x(n), 100);
  %B = polyval(x, D);
  plot(A, D, 'r')
  hold on;
  plot(x, y, '*')
end

