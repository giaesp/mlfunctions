% Esempio 5.2 (Pag. 140)
% ----------------------
% Trovare il polinomio di grado 3 passante per il punto (0,10) con coefficiente angolare
% della retta tangente uguale a 1, e per i punti (1,15) e (2,5).
%


clear;
hold on;

grado = 3;
x = [  0  0  1 2 ];
y = [ 10 10 15 5 ];

[A,f,P] = difdiv(grado,x,y,0,2)

for test = 0 : 0.01 : 2
   plot(test,P(test),'r');
end

input(' Premi INVIO per continuare...\n');
hold off;
close;
