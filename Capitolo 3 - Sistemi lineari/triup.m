% Funzione: triup
% ---------------
% Risolve un sistema triangolare superiore con sostituzione all'indietro.
%
% Prototipo: [x] = triup(A,b)
% Input:     La matrice A dei coefficienti
%            Il vettore b dei termini noti
% Output:    Il vettore soluzione x
%


function [x] = triup(A,b)

eps_value = eps;

% Controlla che la matrice A sia quadrata
[row,col] = size(A);
if (row ~= col)
   fprintf(' Impossibile proseguire: matrice non quadrata\n');
   return
end
n = row;

% Controlla che la matrice A sia triangolare superiore
for i = 2 : n
   for j = 1 : i - 1
      if (abs(A(i,j)) >= eps_value)
         fprintf(' Impossibile proseguire: matrice non triangolare superiore\n');
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

% Calcola il vettore soluzione x e controlla che la matrice sia non singolare
x(n) = b(n) / A(n,n);
for k = n - 1 : -1 : 1
   sum = 0;
   for j = k + 1 : n
      sum = sum + (A(k,j)*x(j));
   end
   if (abs(A(k,k)) < eps_value)
      fprintf(' Impossibile proseguire: matrice non singolare\n');
      return
   end
   x(k) = (b(k) - sum) / A(k,k);
end