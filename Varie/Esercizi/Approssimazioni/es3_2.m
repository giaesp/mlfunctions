% Esercizio 3_2
% -------------
% Disegnare i grafici relativi ai polinomi di interpolazione di grado n-1
% individuati dalla funzione f(x) = 1/25x^2 + 1, x app. [-1,1], e dal
% seguente insieme di nodi:
% xi = cos((2i+1)/2n)*pi,    i = 0,1,...,n-1    n = 5, 10, 20
%
% Esposito Gianluca (N.Matr.056/100858)

func = inline('1/(25*x^2 + 1)');
xb = -1;
xe = 1;

n = 5;
for i = 1 : n
   x(i) = cos(((2*(i-1) + 1)*pi)/10);
   y(i) = func(x(i));
end
hold on;
grid on;
fplot(func,[xb xe],'r');
[A,f,P] = newton(n-1,x,y,[0],xb,xe)
legend('f(x) = 1/(25x^2 + 1)');
input(' Premi INVIO per continuare...');
close;

n = 10;
for i = 1 : n
   x(i) = cos(((2*(i-1) + 1)*pi)/20);
   y(i) = func(x(i));
end
hold on;
grid on;
fplot(func,[xb xe],'r');
[A,f,P] = newton(n-1,x,y,[0],xb,xe)
legend('f(x) = 1/(25x^2 + 1)');
input(' Premi INVIO per continuare...');
close;

n = 20;
for i = 1 : n
   x(i) = cos(((2*(i-1) + 1)*pi)/40);
   y(i) = func(x(i));
end
hold on;
grid on;
fplot(func,[xb xe],'r');
[A,f,P] = newton(n-1,x,y,[0],xb,xe)
legend('f(x) = 1/(25x^2 + 1)');
input(' Premi INVIO per continuare...');
close;