% Esercizio 1_1
% -------------
% Considera i seguenti comandi MATLAB:
% >> A = [ 3.021 2.714 6.913 ; 1.031 -4.273 1.121 ; 5.084 -5.832 9.155 ]
% >> b = [ 12.648 ; -2.121 ; 8.407 ]
% >> A\b
% Modifica poi A(2,2) da -4.2730 a -4.2750
% >> A(2,2) = -4.2750
% >> A\b
% Osserva il risultato

A = [ 3.021 2.714 6.913 ; 1.031 -4.273 1.121 ; 5.084 -5.832 9.155 ]
b = [ 12.648 ; -2.121 ; 8.407 ]
x1 = A\b
det(A)

dA = [ 0  0  0 ; 0 -0.0020 0 ; 0  0  0 ];   % Perturbazione su A
B = A + dA
x2 = B\b
det(B)

% Risultati sulla macchina di prova:
% x1 =  1.00000000000111
%       1.00000000000013
%       0.99999999999946
%
% x2 = -1.74034137775869
%       0.68508534444013
%       2.32117021226652
%
% det(A)  = 0.03258164300001
% cond(A) = 3.726860520732595e+004
%
% Si osservi che il determinante della matrice A (originale) è un valore prossimo
% allo zero, quindi il numero di condizionamento spettrale è di ordine elevato.
% Il problema è dunque malcondizionato. Ecco spiegata la forte differenza tra il
% primo ed il secondo risultato.