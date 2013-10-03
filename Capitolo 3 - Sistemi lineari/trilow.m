% Funzione: trilow
% ----------------
% Risolve un sistema triangolare inferiore con sostituzione in avanti.
%
% Prototipo: [x] = trilow(A,b)
% Input:     La matrice A dei coefficienti
%            Il vettore b dei termini noti
% Output:    Il vettore soluzione x
%
% Esposito Gianluca (N.Matr.056/100858)

function [x] = trilow(A,b)

eps_value = eps;

% Controlla che la matrice A sia quadrata
[row,col] = size(A);
if (row ~= col)
   fprintf(' Impossibile proseguire: matrice non quadrata\n');
   return
end
n = row;

% Controlla che la matrice A sia triangolare inferiore
for i = 1 : n - 1
   for j = i + 1 : n
      if (abs(A(i,j)) >= eps_value)
         fprintf(' Impossibile proseguire: matrice non triangolare inferiore\n');
         return
      end
   end
end

% Controlla che le dimensioni della matrice A e del vettore dei termini noti b siano compatibili
if (n ~= length(b))
   fprintf(' Impossibile proseguire: le dimensioni della matrice e del vettore dei\n');
   fprintf('                         termini noti non sono compatibili\n');
   return
end

% Calcola il vettore soluzione controllando che la matrice A non sia singolare
x(1) = b(1) / A(1,1);
for k = 2 : n
   sum = 0;
   for j = 1 : k - 1
      sum = sum + (A(k,j)*x(j));
   end
   if (abs(A(k,k)) < eps_value)
      fprintf(' Impossibile proseguire: matrice non singolare\n');
      return
   end
   x(k) = (b(k) - sum) / A(k,k);
end
