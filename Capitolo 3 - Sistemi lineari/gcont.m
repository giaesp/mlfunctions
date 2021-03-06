% Funzione: gcont
% ---------------
% Risolve un sistema lineare Ax=b utilizzando il metodo del gradiente coniugato.
% NOTE: Non effettua alcun controllo sulla positivit� di A.
% 
% Prototipo: [x,iter,err] = gcont(A,b,toll,max_iter,verbose_mode)
% Input:     La matrice A dei coefficienti 
%            Il vettore b dei termini noti
%            La tolleranza richiesta, toll
%            Il numero massimo di iterazioni possibili, max iter
%            verbose_mode = 1 <==> Stampa a video i risultati delle varie iterazioni
% Output:    Il vettore soluzione x
%            Le iterazioni utilizzate
%            L'indicatore di errore err:
%            - err = 1  <==>  Non � stata raggiunta la tolleranza richiesta
%            - err = 0  <==>  Non si sono verificati errori
%


function [x,iter,err] = gcont(A,b,toll,max_iter,verbose_mode)

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

iter  = 0;
x0 = zeros(n,1);
r0 = b;
p  = r0;
a0 =(r0' * r0)/(p' * A * p);
x  = x0 + a0 * p;
r  = r0 - a0 * A * p;

while (iter < max_iter) & (norm(r,inf) > toll) 
   B  = (r' * r)/(r0' * r0);
   p  = r + B * p;
   a  = (r' * r)/(p' * A * p);
   x0 = x;
   x  = x + a * p;
   r0 = r;
   r  = r - a * A * p;
   iter  = iter + 1;
   
   if (verbose_mode == 1)
      fprintf('%5d', iter)
      for j = 1 : length(x)
         fprintf('%20.14f', x(j));
      end
      fprintf('\n');   
   end
end

if (iter >= max_iter) & (norm(r,inf) > toll)
   err = 1;
   return
end

