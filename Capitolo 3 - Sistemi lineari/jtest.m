% Funzione: jtest
% ---------------
% Stabilisce se il metodo di Jacobi converge alla soluzione esatta del sistema
% lineare Ax = b di cui è data la matrice A
%
% Prototipo: [bool,iter] = jtest(A,m)
% Input:     La matrice dei coefficienti A
%            Il valore m, relativo all'accuratezza richiesta (10^-m)
% Output:    Restituisce bool = 1 (TRUE) se il metodo converge ed il numero minimo
%            di iterazioni richieste, iter.
%            Restituisce bool = 0 (FALSE) se il metodo non converge. In questo caso
%            il valore iter restituito è 0.
%


function [bool,iter] = jtest(A,m)

[row,col] = size(A);
if (row ~= col) 
   fprintf(' Impossibile proseguire: matrice non quadrata\n');
   return
end

D = diag(diag(A));
C = A - D;
B = -inv(D) * C;
rs = max(abs(eig(B)));    		% Raggio spettrale
if (rs >= 1)
   bool = 0;
   iter = 0;
else
   bool = 1;
   iter = m / (-log10(rs));
end
