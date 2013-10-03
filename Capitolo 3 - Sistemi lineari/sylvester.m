% Funzione: sylvester
% -------------------
% Controlla se una matrice simmetrica è definita positiva o meno
% utilizzando il Criterio di Sylvester.
%
% Prototipo: bool = sylvester(A)
% Input:     La matrice quadrata A da controllare
% Output:    Restituisce 1 (TRUE) se la matrice è simmetrica definita positiva
%            Restituisce 0 (FALSE) se la matrice non è simmetrica definita positiva
%
% Esposito Gianluca (N.Matr.056/100858)

function bool = sylvester(A)

[row,col] = size(A);

% Controlla che la matrice sia quadrata
if (row ~= col)
   fprintf(' Impossibile proseguire: matrice non quadrata\n');
   return
end

eps_value = eeps;

% Controlla che la matrice sia simmetrica
At = A';
for i = 1 : row
   for j = 1 : col
      if (abs(At(i,j) - A(i,j)) >= eps_value)
         fprintf(' Impossibile proseguire: matrice non simmetrica\n');
         return
      end
   end
end

% Verifica che la matrice sia definita positiva utilizzando il Criterio di Sylvester
for k = 1 : row
   if (det(A(1:k,1:k)) <= eps_value)
      bool = 0;
      return
   end
end
bool = 1;   