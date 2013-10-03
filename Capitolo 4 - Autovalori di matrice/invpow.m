% Funzione: invpow
% ----------------
% Calcola l'autovalore della matrice A più vicino all'approssimazione p 
% data in input alla funzione.
%
% Prototipo: av = invpow(p,A,toll,max_iter)
% Input:     L'approssimazione iniziale p dell'autovalore da migliorare
%            La matrice A
%            La tolleranza richiesta, toll
%            Il numero max di iterazioni, max_iter
% Output:    L'autovalore (av) più vicino a quello di cui è conosciuta
%            l'approssimazione iniziale
%            Il numero di iterazioni utilizzate, iter
%            L'indicatore di errore err:
%            - err = 0 <==> Non si sono verificati errori
%            - err = 1 <==> Non si è raggiunta la tolleranza richiesta
%
% Esposito Gianluca (N.Matr.056/100858)

function [av,iter,err] = invpow(p,A,toll,max_iter)

eps_value = eeps;

% Controlla che la matrice sia quadrata
[row,col] = size(A);
if (row ~= col)
   fprintf(' Impossibile proseguire: matrice non quadrata\n');
   return
end
n = row;

A = inv(A - eye(n) * p);
[lamb1,iter,err] = maxpow(A,toll,max_iter); 
av = p + 1 / lamb1;