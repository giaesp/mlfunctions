% Esercizio 3
% -----------
% Scrivere una funzione MATLAB per risolvere equazioni non lineari con il metodo delle
% secanti e di Newton, e provarla sulle seguenti equazioni per ottenere una radice con 
% accuratezza 1E-4.
% Calcolare sperimentalmente l'ordine di convergenza dei metodi.
% Tracciare il grafico della funzione di cui si stanno cercando gli zeri, e giustificare
% la scelta dell'approssimazione iniziale.
% Verificare sperimentalmente che la convergenza dipende dall'approssimazione iniziale.

% Funzione 1
f1 = inline('cos(x) - log(x)');
hold on;
grid on;
fplot(f1,[-2 2]);

% Funzione 2
f2 = inline('exp(-2*x - 1) - 1 + x');
hold on;
grid on;
fplot(f2,[-10 10]);

% Funzione 3
f3 = inline('x^1.4 - sqrt(x) + 1/x - 100');

% Funzione 4
f4 = inline('5 - 2 * cos(x)^2 - 4 * sin(x) - 2 * cos(x)^2');

% Funzione 5
f5 = inline('1 / (sqrt(1+x) - sqrt(x)) + sqrt(x) + sqrt(1+x) - 1');

% Funzione 6
f6 = inline('2 * sin(x)^2 - 3 * cos(x)');

% Funzione 7
f7 = inline('cos(x)^2 - sin(x)^2 + tan(x)^2 - 5/6');

% Funzione 8
f8 = inline('(2 - sqrt(3)) * sin(x) - cos(x)');