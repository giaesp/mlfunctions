% Funzione: d2s
% -------------
% Trasforma una matrice sparsa rappresentata come matrice densa in una matrice
% rappresentata sottoforma di tre vettori, A, J, I, rispettivamente il vettore
% dei valori non nulli, il vettore dell'indice delle colonne ed il vettore dei 
% puntatori ad A.
% NOTE: Per una corretta rappresentazione vettoriale della matrice sparsa, 
%       quest'ultima non deve presentare righe nulle.
%
% Prototipo: [B,J,I,row,col,det] = d2s(A)
% Input:     La matrice A da trasformare
% Output:    Il vettore B dei valori non nulli
%            Il vettore J dell'indice delle colonne
%            Il vettore I dei puntatori ad A
%            Il numero di righe della matrice A, row
%            Il numero di colonne della matrice A, col
%            Il determinante della matrice A, det
%


function [B,J,I,row,col,dt] = d2s(A)

[row,col] = size(A);
dt = det(A);
eps_value = eeps;
index_elem = 1;
index_ptr  = 1;

for i = 1 : row
   flag = 0;
   for j = 1 : col
      if (abs(A(i,j)) >= eps_value)
         B(index_elem) = A(i,j);
         if (flag == 0)                 % Se è il primo elemento non nullo della riga i
            I(index_ptr) = index_elem;
            index_ptr = index_ptr + 1;
            flag = 1;
         end
         J(index_elem) = j;
         index_elem = index_elem + 1;
      end
   end
end
I(index_ptr) = index_elem;

         
      