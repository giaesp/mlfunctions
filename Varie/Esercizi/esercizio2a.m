% Prepariamoci per la s1 prova di Analisi Numerica
% Corso di Laurea in Informatica, a.a. 2001-02
% Prof.ssa B. Paternoster
%
% Esercizio 2 (Fenomeno di Runge)
% -------------------------------
% Disegnare i grafici relativi ai polinomi di interpolazione di grado 4, 8 e 15
% individuati dalla funzione f(x) = 1/(1+x^2), x app. [-5,5], e dai seguenti
% insiemi di nodi:
% a) equidistanti in [-5,5]
%    (Per avere n+1 nodi equidistanti in [a,b], xi = a + i*(b-a)/n, i = 0,...,n);
% Commentare i risultati.

clear;
hold on;
grid on;
title('Fenomeno di Runge - Punti equidistanti');

% f(x)
x = -5 : 0.05 : 5;
y = 1./(1 + x.^2);
plot(x,y);
input(' Premi INVIO per continuare...\n');

% Polinomio di grado 4
n = 4;
for i = 0 : n
   xnodi(i+1) = -5 + i * (5 - (-5))/n;
end
ynodi = 1./(1 + xnodi.^2);
p4 = polyfit(xnodi,ynodi,n);
yy = polyval(p4, x);
plot(x,yy,'r', xnodi, ynodi, 'sk');
input(' Premi INVIO per continuare...\n');

% Polinomio di grado 8
n = 8;
for i = 0 : n
   xnodi(i+1) = -5 + i * (5 - (-5))/n;
end
ynodi = 1./(1 + xnodi.^2);
p8 = polyfit(xnodi, ynodi, n);
y8 = polyval(p8,x);
plot(x,y8,'g', xnodi, ynodi, '*r');
input(' Premi INVIO per continuare...\n');

% Polinomio di grado 15
n = 15;
for i = 0 : n
   xnodi(i+1) = -5 + i * (5 - (-5))/n;
end
ynodi = 1./(1 + xnodi.^2);
p15 = polyfit(xnodi, ynodi, n);
y15 = polyval(p15,x);
plot(x,y15,'k',xnodi,ynodi,'om');
input(' Premi INVIO per terminare...\n');

hold off;
close;