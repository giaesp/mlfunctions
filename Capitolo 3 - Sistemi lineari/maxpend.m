% Funzione: maxpend
% -----------------
% Risolve un sistema lineare Ax = b la cui matrice dei coefficienti A è simmetrica 
% definita positiva. Per la risoluzione è utilizzato il metodo della massima pendenza.
%
% Prototipo: [x,iter,err] = maxpend(A,b,max_iter,verbose_mode)
% Input:     La matrice A dei coefficienti 
%            Il vettore b dei termini noti
%            Il numero massimo di iterazioni possibili, max iter
%            verbose_mode = 1 <==> Stampa a video i risultati delle varie iterazioni
% Output:    Il vettore soluzione x
%            Le iterazioni utilizzate
%            L'indicatore di errore err:
%            - err = 1  <==>  Non è stata raggiunta la tolleranza richiesta
%            - err = 0  <==>  Non si sono verificati errori
%
% Esposito Gianluca (N.Matr.056/100858)

function [x,iter,err] = maxpend(A,b,max_iter,verbose_mode)

[row,col] = size(A);
eps_value = eeps;
err = 0;

% Controlla che la matrice sia quadrata
if (row ~= col)
   fprintf(' Impossibile proseguire: matrice non quadrata\n');
   return
end
n = row;

% Controlla che le dimensioni del vettore b e della matrice A siano compatiibli
if (n ~= length(b))
   fprintf(' Impossibile proseguire: le dimensioni del vettore b e della matrice\n');
   fprintf('                         A non sono compatibili\n'); 
   return
end

% Controlla che la matrice sia non singolare
if (abs(det(A)) < eps_value)
   fprintf(' Impossibile proseguire: matrice non singolare\n');
   return
end

x0 = zeros(n,1);
r0 = b;
iter = 1;
while (iter < max_iter)
   
   ak = (r0' * r0)/(r0' * A * r0);
   x = x0 + ak * r0;
   
   if (verbose_mode == 1)
      fprintf('%5d', iter)
      for j = 1 : length(x)
         fprintf('%20.14f', x(j));
      end
      fprintf('\n');   
   end
   
   r = b - (A * x);
   if (norm(r,inf) < eps_value)   
      return
   end
   r0 = r;
   x0 = x;
   iter = iter + 1;
end

if (iter >= max_iter)
   err = 1;
   return
end
