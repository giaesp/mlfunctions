% Funzione: glegeint
% ------------------
% Calcola l'integrale di una funzione nell'intervallo [a,b] con la 
% formula di Gauss-Legendre.
%
% Prototipo: [val,eval] = glegeint(f,a,b,n)  
% Input:     La funzione di cui si vuole calcolare l'integrale, f
%            Gli estremi a, b dell'intervallo
%            Il numero di nodi da considerare, n
% Output:    L'integrale della funzione data in input, val  
%            Il numero di valutazioni di funzione (chiamate a feval)
%
% Esposito Gianluca (N.Matr.056/100858)

function [val,eval] = glegeint(f,a,b,n)

[x,w] = zplege(n);
val = 0;
eval = 0;
for i = 1 : n
   k = (x(i) * (b - a) + a + b)/2;
   val = val + w(i) * feval(f,k);
   eval = eval + 1;
end
val = (b - a) * val/2;
