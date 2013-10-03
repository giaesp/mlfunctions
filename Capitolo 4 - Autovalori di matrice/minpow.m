% Funzione: minpow
% ----------------
% Calcola l'autovalore di minimo modulo della matrice data in input
%
% Prototipo: [lamb,iter,err] = minpow(A,toll,max_iter)
% Input:     La matrice A
%            La tolleranza richiesta toll
%            Il numero max di iterazioni max_iter
% Output:    L'autovalore di minimo modulo
%            Il numero di iterazioni utilizzate, iter
%            L'indicatore di errore err:
%            - err = 0 <==> Non si sono verificati errori
%            - err = 1 <==> Non si è raggiunta la tolleranza richiesta
% 
% Esposito Gianluca (N.Matr.056/100858)

function [lamb,iter,err] = minpow(A,toll,max_iter)

A = inv(A);
[lamb,iter,err] = maxpow(A,toll,max_iter);
lamb = 1/lamb;