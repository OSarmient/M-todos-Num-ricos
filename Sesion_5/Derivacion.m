function DPol = Derivacion(t0,h,f)

  X=[t0, (t0+(1*h)), (t0+(2*h)), (t0+(3*h)), (t0+(4*h))];
  Y=[f(X(1)), f(X(2)), f(X(3)), f(X(4)), f(X(5))];
  n=length(X);
  A=Y;

  for j=2:n
    for k=n:-1:j
      A(k)=(A(k)-A(k-1))/(X(k)-X(k-j+1));
    end
  end

  A
  x0=X(1);
  d=A(2);
  arreglo=1;
  n2=length(A)-1;

  for k=2:n2
    arreglo=arreglo*(x0-X(k));
    d=d + arreglo*A(k+1);
  end

  %output_precision(10)
  d
  E= d - (-cos(0.8));
  disp('       h              P´(x)               Error')
  disp([h d E])
end
