% Prepariamoci per la 2a prova intercorso di Analisi Numerica
% Corso di Laurea in Informatica, a.a. 2001-02
% Prof.ssa B. Paternoster
%
% Esercizio 5:
% ------------
% Costruire una spline cubica ed un polinomio di interpolazione per i seguenti dati:
% x = [-2,0,2,3,4,5]
% y = [4,0,-4,-30,-40,-30]
% Fare il plot dei punti, del polinomio e della spline contemporaneamente. Quale curva 
% sembra dare la rappresentazione più realistica della funzione da cui potrebbero essere
% stati presi i dati?


hold on;

% Inizializzazione dei dati
x = [-2,0,2,3,4,5];
y = [4,0,-4,-30,-40,-30];

% Plot dei dati (punti)
plot(x,y,'sr');

% Costruisce un polinomio di interpolazione e ne fa il plot
p = polyfit(x,y,5);
xx = -2 : 0.1 : 5;
yy = polyval(p,xx);
plot(xx,yy);

% Costruisce la spline cubica e ne fa il plot
ys = spline(x,y,xx);
plot(xx,ys,'g');

hold off;
input(' Premi un tasto per continuare...\n');
close;
clear;