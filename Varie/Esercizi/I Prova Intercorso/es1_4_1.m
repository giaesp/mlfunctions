% Esercizio 1_4_1
% ---------------
% Studiare la convergenza del metodo di Jacobi e Gauss-Seidel sul seguente sistema
% lineari Ax = b
%
% A = [ 5  7  6  5 ;    b = [ 23
%       7 10  8  7 ;          32
%       6  8 10  9 ;          33
%       5  7  9 10 ]          31 ]

A = [  5  7  6  5 ;
       7 10  8  7 ;
       6  8 10  9 ;
       5  7  9 10 ];
b = [ 23 32 33 31 ];
p = [  0  0  0  0 ]';

m = input(' Inserisci il grado di accuratezza desiderato: ');
[boolj,iterj] = jtest(A,m);
[boolgs,itergs] = gstest(A,m);

fprintf(' Testing report:\n');
fprintf(' ---------------\n');
fprintf(' Il metodo iterativo di Jacobi ');
if (boolj == 1)
   fprintf('converge\n');
   fprintf(' Sono richieste almeno %.0f iterazioni\n', iterj);   
   max_iter = input(' [Jacobi] Inserisci il numero massimo di iterazioni possibili: ');
   [xj,iterj,errj] = jacobi(A,b,p,10^-m,max_iter);
else
   fprintf('non converge\n');
end
fprintf(' Il metodo iterativo di Gauss-Seidel ');
if (boolgs == 1)
   fprintf('converge\n');
   fprintf(' Sono richieste almeno %.0f iterazioni\n', itergs);
   max_iter = input(' [Gauss-Seidel] Inserisci il numero massimo di iterazioni possibili: ');
   [xgs,itergs,errgs] = gseidel(A,b,p,10^-m,max_iter);
else
   fprintf('non converge\n');
end

% Report:
% -------
% Jacobi: NON CONVERGENTE
% Gauss-Seidel: CONVERGENTE 
%               2964 iterazioni richieste
%               1206 iterazioni utilizzate
%               x = [ 1.03314438911189
%                     0.98007895154803
%                     0.99158455582861
%                     1.00494643911468 ]
% N.B.: Il numero minimo di iterazioni richieste è maggiore rispetto al numero
%       di iterazioni effettivamente utilizzate. Ciò è dovuto molto probabilmente
%       al malcondizionamento della matrice A (dell'ordine di 10^3).
