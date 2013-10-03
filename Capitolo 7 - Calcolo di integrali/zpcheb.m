% Function: zpcheb
% ----------------
% Calcola i nodi e i pesi per le formule di Gauss-Chebyshev
%
% Prototipo: [x,w] = zpcheb(n)
% Input:     Il numero di nodi che si vogliono usare nella formula
% Output:    Il vettore dei nodi x
%            Il vettore dei pesi w 
%


function [x,w] = zpcheb(n)

if (n <= 1)
   disp(' Impossibile proseguire: parametro errato (n > 1)\n');
   return
end

[a,b] = coefcheb(n);
JacM = diag(a) + diag(sqrt(b(2:n)),1) + diag(sqrt(b(2:n)),-1);
[w,x] = eig(JacM);
x = diag(x);
scal = pi;
w = w(1,:)'.^2 * scal;
[x,ind] = sort(x);
w = w(ind);

