% Funzione: avqr
% --------------
% Calcola gli autovalori della matrice A con il metodo QR
%
% Prototipo: [lamb,iter,err] = avqr(A,max_iter)
% Input:     La matrice A
%            Il numero max di iterazioni, max_iter
% Output:    Gli autovalori della matrice A, lamb
%            Il numero di iterazioni utilizzate, iter
%            L'indicatore di errore, err:
%            - err = 0 <==> Non si sono verificati errori
%            - err = 1 <==> Il numero di iterazioni impostato è risultato insufficiente
%


function [lamb,iter,err] = avqr(A,max_iter)

eps_value = eeps;
err = 0;

%controlla se la matrice è quadrata
[row,col]=size(A);
if (row ~= col)
   fprintf(' Impossibile proseguire: matrice non quadrata\n');
   return
end
n = row;
lamb = zeros(n,1);

for iter = 1 : max_iter
  [Qs,Rs] = qr(A);
  A = Rs * Qs;

  % Controlla se A è diventata triangolare superiore
  triang = 1;
  for i = 2 : n
     for j = 1 : i - 1
        if (abs(A(i,j)) >= eps_value)
           triang = 0;     % La matrice non è triangolare superiore 
           break
        end
     end
     if (triang == 0) % Se la matrice non è triangolare superiore
        break
     end
  end
  if (triang == 1)    % Se la matrice è triangolare superiore
     lamb = diag(A);
     return
  end     
end
err = 1;
