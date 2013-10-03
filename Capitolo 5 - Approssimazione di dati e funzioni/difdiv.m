% Funzione: difdiv
% ----------------
% Calcola la diagonale della tavola delle differenze divise, dati i vettori
% x ed f.
%
% Prototipo: [f] = difdiv(x,f)
% Input:     Il vettore x dei punti
%            Il vettore y contenente la valutazione della funzione nei pti
%            del vettore x
% Output:    Il vettore f contenente la diagonale della tavola delle
%            differenze divise
%


function [f] = difdiv(x,f)

n = length(x);
m = length(f);

% Controlla la lunghezza dei vettori x ed f
if (n ~= m)
   fprintf(' Impossibile proseguire: le dimensioni dei vettori x ed f non sono compatibili\n');
   return
end

for i = 1 : n
   for j = n : -1 : i + 1
      f(j) = (f(j) - f(j-1))/(x(j) - x(j-i));
   end
end