% Esercizio 1_6
% -------------
% Data la matrice simmetrica
% A = [  1  2  3  4 ;
%        2  5  1 10 ;
%        3  1 35  5 ;
%        4 10  5 45 ]
% verificare se è definita positiva, e risolvere poi il sistema lineare Ax = b con
% b = [ 9 35 -45 189]', col metodo di Choleski, se possibile, oppure mediante
% fattorizzazione LU, usando le funzioni in linea di MATLAB:
% >> [L,U,P] = lu(A)
% >> U = chol(A)

A = [  1   2   3   4 ;
       2   5   1  10 ;
       3   1  35   5 ;
       4  10   5  45 ];
b = [  9  35 -45 189 ];

defpos = sylvester(A);
if (defpos == 1)
   fprintf(' La matrice A è simmetrica definita positiva\n');
   fprintf('\n Applicazione del metodo di Choleski\n');
   U = chol(A)
   L = U'
   y = trilow(L,b)
   xc = triup(U,y)
else
   fprintf(' La matrice A non è simmetrica definita positiva\n');
end

fprintf(' Applicazione della fattorizzazione LU\n');
[L,U,P] = lu(A)
y = gausspiv(L,P*b')
xl = gausspiv(U,y)

% Report:
% -------
% A\b (Comando MATLAB) |  Metodo di Choleski  |  Fattorizzazione LU
% ---------------------|----------------------|--------------------
%                    1 |                   1  |    0.99999999999981
%                   -3 |                  -3  |   -2.99999999999992
%                   -2 |                  -2  |   -1.99999999999999
%                    5 |                   5  |    5.00000000000000