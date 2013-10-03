% Funzione: choleski
% ------------------
% Calcola la matrice L triangolare inferiore con l(i,i) > 0 tale che L * L' = A.
% Successivamente trova la soluzione al problema originario risolvendo i due sistemi 
% triangolari Ly = b e Ux = y.
%
% Prototipo: [x] = choleski(A,b,fmode,rmode)
% Input:     La matrice dei coefficienti A
%            Il vettore dei termini noti b
%            Il metodo di calcolo della fattorizzazione fmode:
%            - fmode = 1  Utilizza la funzione MATLAB chol()
%            - fmode = 2  Utilizza la funzione definita dall'utente choles()
%            Il metodo di calcolo della soluzione rmode:
%            - rmode = 1  Calcola la soluzione senza richiamare altre funzioni
%            - rmode = 2  Calcola la soluzione richiamando trilow() e triup()
% Output:    Il vettore soluzione x
%


function [x] = choleski(A,b,fmode,rmode)

[row,col] = size(A);

% Controlla che la matrice A sia quadrata
if(row ~= col)
   fprintf(' Impossibile proseguire: matrice non quadrata\n');
   return
end
n = row;

% Controlla che le dimensioni della matrice A e del vettore dei termini noti b 
% siano compatibili
if (n ~= length(b))
   fprintf(' Impossibile proseguire: le dimensioni della matrice e del vettore dei\n');
   fprintf('                         termini noti non sono compatibili\n');
   return
end

eps_value = eeps;

% Controlla che la matrice sia simmetrica
At = A';
for i = 1 : n
   for j = 1 : n     
       if (abs(A(i,j) - At(i,j)) >= eps_value)
          fprintf(' Impossibile proseguire: matrice non simmetrica\n');
          return
        end
   end
end

% Costruisce le matrici L,U
% Utilizza la funzione MATLAB
if (fmode == 1)
   U = chol(A);
   L = U';
% Utilizza la funzione definita dall'utente
elseif (fmode == 2)
   L = choles(A); 
   U = L';
else
   fprintf(' Impossibile proseguire: valore fmode illegale\n');
end


if (rmode == 1)
   % Risolve il sistema triangolare inferiore Ly = b (sostituzione in avanti)
   y(1,1) = b(1) / L(1,1);
   for i = 2 : n
      sum = 0;
      for j = 1 : i - 1
         sum = sum + (L(i,j)*y(j));
      end
      y(i,1) = (b(i) - sum)/L(i,i);
   end
   % Risolve il sistema triangolare superiore Ux = y (sostituzione all'indietro)
   x(n,1) = y(n) / U(n,n);
   for i = n-1 : -1 : 1
      sum = 0;
      for k = i + 1 : n
         sum = sum + (U(i,k)*x(k));
      end
      x(i,1) = (y(i)-sum) / U(i,i);
   end
   
elseif (rmode == 2)
   % Risolve il sistema triangolare inferiore Ly = b utilizzando la funzione trilow()
   y = trilow(L,b);
   % Risolve il sistema triangolare superiore Ux = y utilizzando la funzione triup()
   x = triup(U,y);
   
else
   fprintf(' Impossibile proseguire: valore rmode illegale\n');
end
