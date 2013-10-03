% Prepariamoci per la 2a prova intercorsi di Analisi Numerica
% Corso di Laurea in Informatica, a.a. 2001-02
% Prof.ssa B. Paternoster
%
% Esercizio 3
% -----------
% Disegnare i grafici relativi ai polinomi di interpolazione di grado n-1 individuati
% dalla funzione f(x) = 1 / (25*x^2 + 1), x app. [-1,1], e dai seguenti insiemi di nodi:
% a) x(i) = -1 + ((2*i)/(n-1)), i = 0,1,...,n, n = 5, 10, 20
% Commentare i risultati

clear;
hold on;
grid on;
title('Esercizio 3 - Parte a')

% f(x)
x = -1 : 0.05 : 1;
y = 1./(25 * x.^2 + 1);
plot(x,y);
input(' Premi INVIO per continuare...\n');

% Polinomio di grado n = 5
n = 5;
for i = 0 : n - 1
   xnodi(i+1) = -1 + ((2*i)/(n-1));
end
ynodi = 1./(25 * xnodi.^2 +1);
p5 = polyfit(xnodi,ynodi,n);
y5 = polyval(p5,x);
plot(x,y5,'r',xnodi,ynodi,'sk');
input(' Premi INVIO per continuare...\n');

% Polinomio di grado n = 10
n = 10;
for i = 0 : n - 1
   xnodi(i+1) = -1 + ((2*i)/(n-1));
end
ynodi = 1./(25 * xnodi.^2 +1);
p10 = polyfit(xnodi,ynodi,n);
y10 = polyval(p10,x);
plot(x,y10,'g',xnodi,ynodi,'*r');
input(' Premi INVIO per continuare...\n');

% Polinomio di grado n = 15
n = 15;
for i = 0 : n - 1
   xnodi(i+1) = -1 + ((2*i)/(n-1));
end
ynodi = 1./(25 * xnodi.^2 +1);
p15 = polyfit(xnodi,ynodi,n);
y15 = polyval(p15,x);
plot(x,y15,'k',xnodi,ynodi,'om');
input(' Premi INVIO per terminare...\n');

hold off;
close;

