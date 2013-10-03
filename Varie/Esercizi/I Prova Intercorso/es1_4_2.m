% Esercizio 1_4_2
% ---------------
% Studiare la convergenza del metodo di Jacobi e Gauss-Seidel sul seguente sistema
% lineari Ax = b
%
% A = [   4  -1   0  -1   0   0 ;    b = [ 2
%        -1   4  -1   0  -1   0 ;          1
%         0  -1   4   0   0  -1 ;          2
%        -1   0   0   4  -1   0 ;          2 
%         0  -1   0  -1   4  -1 ;          1
%         0   0  -1   0  -1   4 ]          2 ]


A = [  4  -1   0  -1   0   0 ;
      -1   4  -1   0  -1   0 ;
       0  -1   4   0   0  -1 ;
      -1   0   0   4  -1   0 ; 
       0  -1   0  -1   4  -1 ;
       0   0  -1   0  -1   4 ];
b = [  2   1   2   2   1   2 ]';
p = [  0   0   0   0   0   0 ]';

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
%         18 iterazioni richieste
%         18 iterazioni utilizzate
%         x = [ 0.99990359197545
%               0.99986365846416
%               0.99990359197545
%               0.99990359197545
%               0.99986365846416
%               0.99990359197545 ]
% Gauss-Seidel: CONVERGENTE
%               9 iterazioni richieste
%               11 iterazioni effettuate
%               x = [ 0.99996150254583
%                     0.99996714036649
%                     0.99998597627413
%                     0.99997676473060
%                     0.99998016745678
%                     0.99999153593273 ]