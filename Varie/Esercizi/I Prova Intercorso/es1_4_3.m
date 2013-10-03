% Esercizio 1_4_3
% ---------------
% Studiare la convergenza del metodo di Jacobi e Gauss-Seidel sul seguente sistema
% lineari Ax = b
%
% A = [  1   0  1 ;   b = [ 2
%        1   1  0 ;         2
%       0.1  1  1 ]        2.1 ]

A = [  1    0   1 ;
       1    1   0 ;
      0.1   1   1 ];
b = [  2    2  2.1 ];  
p = [  0    0   0  ]';

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
%               87 iterazioni richieste
%               96 iterazioni utilizzate
%               x = [ 0.99995501803775
%                     1.00004498196225
%                     0.99995951623398 ]
