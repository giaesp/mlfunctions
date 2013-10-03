% Funzione: glege
% ---------------
% Calcola l'integrale di una funzione nell'intervallo [-1,1] con la formula 
% di Gauss-Legendre.
%
% Prototipo: [val,eval] = glege(f,n)  
% Input:     La funzione di cui si vuole calcolare l'integrale, f
%            Il numero di nodi da considerare, n 
% Output:    L'integrale della funzione data in input  
%            Il numero di valutazioni di funzione (chiamate a feval)
%
% Esposito Gianluca (N.Matr.056/100858)

function [val,eval] = glege(f,n)

[x,w] = zplege(n);
val = 0;
eval = 0;
for i = 1 : n
   val = val + w(i) * feval(f,x(i));
   eval = eval + 1;
end

