% Esercizio 12_1
% ----------------
% Costruire il polinomio di interpolazione per la seguente funzione, sui seguenti nodi:
% y = sin(x),    xi = i*pi/n,     i =0,1,...,n       n = 2, 5, 10.

clear;
hold on;
n = 2;
for i = 1 : n
   x(i) = i * pi / n;
   y(i) = sin(x(i));   
   d(i) = cos(x(i));
end
[A,f,p] = newton(2,x,y,d,x(1),x(length(x)));
input(' Premi INVIO per continuare...');

n = 5;
for i = 1 : n
   x(i) = i * pi / n;
   y(i) = sin(x(i));   
   d(i) = cos(x(i));
end
[A,f,p] = newton(5,x,y,d,x(1),x(length(x)));
input(' Premi INVIO per continuare...');

n = 10;
for i = 1 : n
   x(i) = i * pi / n;
   y(i) = sin(x(i));   
   d(i) = cos(x(i));
end
[A,f,p] = newton(10,x,y,d,x(1),x(length(x)));
input(' Premi INVIO per continuare...');