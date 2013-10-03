% Esercizio 1_4_4
% ---------------
% Studiare la convergenza del metodo di Jacobi e Gauss-Seidel sul seguente sistema
% lineari Ax = b
%
% A = [ -13   2  -1   3 ;
%        -6  19   4   5 ;
%         1  -5 -37   7 ;
%         5  -9   8  23 ]

A = [ -13     2   -1    3 ;
       -6    19    4    5 ;
        1    -5  -37    7 ;
        5    -9    8   23 ];
b = [ -61  -217  247  590 ]';
p = [   0     0    0    0 ]';

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
%         11 iterazioni richieste
%         13 iterazioni utilizzate
%         x = [   7.00004470805522
%               -14.00002921067165
%                -1.00012128983299
%                19.00045581306593 ]
% Gauss-Seidel: CONVERGENTE
%               5 iterazioni richieste
%               7 iterazioni utilizzate
%               x = [   7.00004425417909
%                     -13.99998357487127
%                      -0.99997509465949
%                      18.99998814402343 ]
