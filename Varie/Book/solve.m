% Algoritmo 2: solve(n,A,pivot,b)
% -------------------------------
% L'algoritmo risolve il sistema non singolare, di ordine n, Ux=b", dove
% b" = Mn-1Pn-1...M2P2M1P1b, con (U)ij = (A)ij, i<=j, e mij=(A)ij, i>j.
% La matrice input A è stata ottenuta dall'algoritmo factor.
% Il vettore pivot contiene gli scambi di riga effetuati da factor.
% Al termine il vettore b contiene la soluzione x.
%
% Parametri:
% - Input: A,pivot,b
% - Output: b
%
% Prototipo:
%
% Esposito Gianluca (N.Matr.056/100858)

function [b] = solve(A,pivot,b)

[row,col] = size(A);

if (row == col)
   n = row;
else
   return
end

for k = 1 : n - 1
   j = pivot(k);
   if (j ~= k)
      temp = b(j);
      b(j) = b(k);
      b(k) = temp;
   end
   for i = k + 1 : n
      b(i) = b(i) + (A(i,k) * b(k));
   end
end
b(n) = b(n)/A(n,n);
for i = n - 1 : -1 : 1
   sum = 0;
   for l = i + 1 : n
      sum = sum + A(i,l)*b(l);
   end
   b(i) = (b(i) - sum)/A(i,i);
end
