% Funzione: choles
% ----------------
% Data una matrice A simmetrica definita positiva, calcola la matrice L triangolare
% inferiore tale che L*L' = A.
%
% Prototipo: [L] = choles(A)
% Input:     La matrice dei coefficienti A (simmetrica definita positiva)
% Output:    La matrice L tale che L*L' = A
%
% Esposito Gianluca (N.Matr. 056/100858)

function [L] = choles(A)

% Applica il criterio di Sylvester per determinare se la matrice è
% simmetrica definita positiva. La funzione sylvester() controlla 
% anche se la matrice A è quadrata.
defpos = sylvester(A);
if (defpos == 0)
   fprintf(' Impossibile proseguire: matrice non simmetrica definita positiva\n');
   return
end

[row,col] = size(A);
n = row;
% Calcola la matrice L triangolare superiore tale che L*L' = A
L = zeros(n,n);
L(1,1) = sqrt(A(1,1));
for i = 2 : n
   for j = 1 : i
      sum = 0;
      if (i ~= j)
         for k = 1 : j - 1
            sum = sum + L(i,k)*L(j,k);
         end
         L(i,j) = (A(i,j) - sum)/L(i,j);
      else
         for k = 1 : i - 1
            sum = sum + (L(i,k))^2;
         end
         L(i,i) = sqrt(A(i,i) - sum);
      end
   end
end
