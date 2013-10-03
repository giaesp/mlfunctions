% Prepariamoci per la s1 prova di Analisi Numerica
% Corso di Laurea in Informatica, a.a. 2001-02
% Prof.ssa B. Paternoster
%
% Esercizio 2 (Fenomeno di Runge)
% -------------------------------
% Disegnare i grafici relativi ai polinomi di interpolazione di grado 4, 8 e 15
% individuati dalla funzione f(x) = 1/(1+x^2), x app. [-5,5], e dai seguenti
% insiemi di nodi:
% b) punti di Chebyshev:
%    (Per vaere n+1 punti di Chebyshev in [a,b], 
%     xi = ((a+b)/2) - ((b-a)/2 * cos((((2*i)+1)*pi_grego)/(2*(n+1)))), i = 0,1,...,n
% Commentare i risultati.

clear;
hold on;
grid on;
title('Fenomeno di Runge - Punti di Chebyshev');

% f(x)
x = -5 : 0.05 : 5;
y = 1./(1 + x.^2);
plot(x,y);
input(' Premi INVIO per continuare...\n');

% Polinomio di grado 4
n = 4;
for i = 0 : n
   xnodi(i+1) = -5 * cos((((2*i) + 1)*pi)/(2 * (n + 1)));
end
ynodi = 1./(1 + xnodi.^2);
p = polyfit(xnodi,ynodi,n);
y = polyval(p,x);
plot(x,y,'r',xnodi,ynodi,'sk');
input(' Premi INVIO per continuare...\n');

% Polinomio di grado 8
n = 8;
for i = 0 : n
   xnodi(i+1) = -5 * cos((((2*i) + 1)*pi)/(2 * (n + 1)));
end
ynodi = 1./(1 + xnodi.^2);
p = polyfit(xnodi,ynodi,n);
y = polyval(p,x);
plot(x,y,'g',xnodi,ynodi,'*r');
input(' Premi INVIO per continuare...\n');

% Polinomio di grado 15
n = 15;
for i = 0 : n
   xnodi(i+1) = -5 * cos((((2*i) + 1)*pi)/(2 * (n + 1)));
end
ynodi = 1./(1 + xnodi.^2);
p = polyfit(xnodi,ynodi,n);
y = polyval(p,x);
plot(x,y,'k',xnodi,ynodi,'om');
input(' Premi INVIO per terminare...\n');

hold off;
close;



