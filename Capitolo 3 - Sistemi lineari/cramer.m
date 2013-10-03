% Funzione: cramer
% ----------------
% Calcola la soluzione x di un sistema lineare Ax = b utilizzando la regola di Cramer.
% N.B.: E' un metodo oneroso e lento, generalmente sconsigliato.
%
% Prototipo: [x] = cramer(A,b)
% Input:     La matrice dei coefficienti A
%            Il vettore dei termini noti b
% Output:    Il vettore soluzione x
%
% Esposito Gianluca (N.Matr.056/100858)

function [x] = cramer(A,b)

% Controlla che la matrice sia quadrata
[row,col] = size(A);
if (row ~= col)
   fprintf(' Impossibile proseguire: la matrice non è quadrata\n');
   return
end

% Controlla che le dimensioni della matrice e del vettore dei termini noti
% siano compatibili
n = row;
m = length(b);
if (n ~= m)
   fprintf(' Impossibile proseguire: le dimensioni della matrice e del vettore dei\n');
   fprintf('                         termini noti non sono compatibili\n');
   return
end

for i = 1 : n
   Ai = A;
   Ai(:,i) = b(:);
   x(i) = det(Ai)/det(A);
end


