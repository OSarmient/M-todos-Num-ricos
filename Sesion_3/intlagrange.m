function p=intlagrange(x,y,f)
  %x= vector de nodos de abscisas
  %Y= vector de nodos de ordenadas
  %f= funcion = @(x) cos (x)
  %P1= intlagrange([0.0 1.2],[f(0) f(1.2)],f)
  %Q1= intlagrange([0.2 1.0],[f(0.2) f(1)],f)
  %P2= intlagrange([0.0 0.6 1.2],[f(0) f(0.6) f(1.2)],f)
  %P3= intlagrange([0.0 0.4 0.8 1.2],[f(0) f(0.4) f(0.8) f(1.2)],f)
  syms t;
  n=length(x);  %orden del polinomio
  p=0;  %Valor inicial para el polinomio
  fplot(f,[0,2],'LineWidth',2)
  hold on;
  plot(x,y,'*')
  grid on;

  for i=1:n
    L=1;
    for j=1:n
      if j~=i
        L=L*(t-x(j))/(x(i)-x(j));  %Ecuacion polinomio
      end
    end
    p=p+L*y(i);     %Ecuacion final polinomio
  end

  p=simplify(expand(p))

  hold on;
  fplot(p,[0,2])
  legend({'f(x)','P(x)'},'Location','northeast')
  disp('Xk             f(Xk)         P(Xk)          f(Xk)-P(Xk)')
  for k = 0:0.1:1.2
    t=k;
    P=double(subs(p,t));
      F=f(t);
    r=F-P;
    disp([ t F P r ])
  end




