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
% b) punti di Chebyshev:
%    (Per vaere n+1 punti di Chebyshev in [a,b], 
%     xi = ((a+b)/2) - ((b-a)/2 * cos((((2*i)+1)*pi_grego)/(2*(n+1)))), i = 0,1,...,n
% Commentare i risultati.

hold on;
grid on;

x = -5 : 0.05 : 5;
y = 1./(1+x.^2);
plot(x,y);
input(' Premi un tasto per continuare...\n');

% a)
xnodi = linspace(-5,5,5);
ynodi = 1./(1 + xnodi.^2);
p4 = polyfit(xnodi,ynodi,4);
yy = polyval(p4, x);
plot(x,yy,'r', xnodi, ynodi, 'sk');
input(' Premi un tasto per continuare...\n');

xnodi = linspace(-5,5,9);
ynodi = 1./(1 + xnodi.^2);
p8 = polyfit(xnodi, ynodi, 8);
y8 = polyval(p8,x);
plot(x,y8,'g', xnodi, ynodi, '*r');
input(' Premi un tasto per continuare...\n');

xnodi = linspace(-5,5,16);
ynodi = 1./(1 + xnodi.^2);
p15 = polyfit(xnodi, ynodi, 15);
y15 = polyval(p15,x);
plot(x,y15,'k',xnodi,ynodi,'om');
input(' Premi un tasto per continuare...\n');

% b)
n = 4;
indice = 0 : n;
xnodi = -5 * cos(12 * indice + 1)/ ((2 * (n + 1)) * pi)
x = -5 : 0.05 : 5;
y = 1./(1 + x.^2);
plot(x,y);
ynodi = 1./(1+xnodi.^2);
p = polyfit(xnodi,ynodi,n);
y = polyval(p,x);
plot(x,y,'g',xnodi,ynodi,'*r');