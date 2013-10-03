% Function: maxpow
% ----------------
% Calcola l'autovalore di max modulo (metodo delle potenze)
%
% Prototipo: [lamb1,iter,err] = maxpow(A,toll,max_iter)
% Input:     La matrice A
%            La tolleranza richiesta, toll
%            Il numero max di iterazioni, max_iter
% Output:    L'autovalore di massimo modulo
%            Il numero di iterazioni utilizzate, iter
%            L'indicatore di errore err:
%            - err = 0 <==> Non si sono verificati errori
%            - err = 1 <==> Non si è raggiunta la tolleranza richiesta
%


function [lamb1,iter,err] = maxpow(A,toll,max_iter)

err = 0;

% Controlla che la matrice sia quadrata
[row,col] = size(A);
if (row ~= col)
   fprintf(' Impossibile proseguire: matrice non quadrata\n');
   return
end
n = row;

flag = 0;
iter = 0;
y0 = ones(n,1);
error = toll + 10;      % Maggiorazione arbitraria

while (iter < max_iter) & (error > toll)
   w1 = A * y0;
   
   % Trova la componente di y0 diversa da 0 di modulo massimo
   [m,k] = max(abs(y0)); 
   lamb1 = w1(k)/y0(k); %
   
   if (flag == 1)       % Non è la prima iterazione del ciclo
      error = abs(lamb0 - lamb1);
   else                 % E' la prima iterazione del ciclo
      flag = 1;
   end
   
   y0 = w1/norm(w1,inf);      % Normalizza
   iter = iter + 1;
   lamb0 = lamb1;
end

if (iter >= max_iter) & (error > toll)
   err = 1;
   return
end
