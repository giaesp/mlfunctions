% Esempio 5.1 (Pag. 139)
% ----------------------
% Costruire il polinomio di grado n = 4 passante per i punti (-4,1245), (-1,33),(0,5),
% (2,9),(5,1335).
%


clear;
hold on;

grado = 4;
x = [  -4 -1 0 2    5];
y = [1245 33 5 9 1335];

[A,f,P] = difdiv(grado,x,y,-4,5)

for test = -4 : 0.05 : 5;
   plot(test,P(test),'r');
end

input(' Premi INVIO per terminare...\n');
hold off;
close;
