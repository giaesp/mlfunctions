% Esercizio 3_1
% -------------
% Scrivere una funzione MATLAB per risolvere equazioni non lineari con il metodo delle
% secanti e di Newton, e provarla sulle seguenti equazioni per ottenere una radice con
% accuratezza 1E-4.
% Calcolare sperimentalmente l'ordine di convergenza dei metodi.
%
% cos(x) = log(x)
%
% Tracciare il grafico della funzione di cui si stanno cercando gli zeri, e giustificare
% la scelta dell'approssimazione iniziale. Verificare sperimentalmente che la convergenza
% dipende dall'approssimazione iniziale.

f = inline(' cos(x) - log(x)');
d = inline('-sin(x) - 1/x');

fprintf('Calcolo di radice con il metodo delle secanti\n');
[xs,convgs,iters,errs] = secant(f,0.2,2,10^-4,10^-4,100,1,1)
input(' Premi INVIO per continuare...');
close;

fprintf('Calcolo di radice con il metodo delle tangenti\n')
[xt,convgt,itert,errt] = tang(f,d,2,10^-4,10^-4,100,1,1)
input(' Premi INVIO per continuare...');
close;

% Report:
% -------
% Metodo delle secanti:  x     = 1.30296400120930
%                        convg = 1.77566918615381
%                        iter  = 5
% Metodo delle tangenti: x     = 1.30296400121601  
%                        convg = 2.33976726414802
%                        iter  = 4
%
