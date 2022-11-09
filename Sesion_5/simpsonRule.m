function s = simpsonRule(f,a,b,M)
  % sumpsonRule Summary of this function goes here
  % Input:  f -- función de la que se va a buscar la integral
  %         x -- primer valor del intervalo
  %         y -- último valor del intervalo
  %         M -- número de nodos

  % Output:
  h=(b-a)/(2*M)
  s1=0;
  s2=0;
  for k=1:M
    x =a+h*(2*k-1);
    s1=s1+f(x);
  end
  for k=1:(M-1)
    x=a+h*2*k;
    s2=s2+f(x);
  end
  s=h*(f(a)+f(b)+4*s1+2*s2)/3;

  x=0:0.1:6;
  plot(x, 2+(sin(2*sqrt(x))), a,f(a),'*-', b,f(b),'*-');
  grid on;
  xlabel("x");
  ylabel("2+sin(2*sqrt(x))");
  title("Regla Compuesta de Simpson");
  axis([0 6 0 3]);

  end

