% Esercizio 1_4_5
% ---------------
% Studiare la convergenza del metodo di Jacobi e Gauss-Seidel sul seguente sistema
% lineari Ax = b
%
% A = [  4  -1  -1   0 ;   b = [ 1
%       -1   4   0  -1 ;         2
%       -1   0   4  -1 ;         0
%        0  -1  -1   4 ]         1 ]

A = [  4  -1  -1   0 ;
      -1   4   0  -1 ;
      -1   0   4  -1 ;
       0  -1  -1   4 ];
b = [  1   2   0   1 ]';
p = [  0   0   0   0 ]';

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
% Jacobi: CONVERGENTE
%         13 iterazioni richieste
%         13 iterazioni utilizzate
%         x = [ 0.49993896484375
%               0.74993896484375
%               0.24993896484375
%               0.49993896484375 ]
% Gauss-Seidel: CONVERGENTE
%               7 iterazioni richieste
%               8 iterazioni utilizzate
%               x = [ 0.49997711181641
%                     0.74998855590820
%                     0.24998855590820
%                     0.49999427795410 ]
