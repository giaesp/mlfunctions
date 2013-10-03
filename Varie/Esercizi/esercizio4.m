% Esercizio 4
% Studiare la convergenza del metodo di Jacobi e Gauss-Seidel sui seguenti
% sistemi lineari Ax=b
%
% 1) A = [ 5  7  6  5     b = [ 23 
%          7 10  8  7           32
%          6  8 10  9           33
%          5  7  9 10 ]         31 ]
%
% 2) A = [  4  -1   0  -1   0   0     b = [ 2 
%          -1   4  -1   0  -1   0           1
%           0  -1   4   0   0  -1           2
%          -1   0   0   4  -1   0           2 
%           0  -1   0  -1   4  -1           1 
%           0   0  -1   0  -1   4 ]         2 ]
%
% 3) A = [  1   0   1     b = [ 2
%           1   1   0           2
%          0.1  1   1 ]        2.1 ]
%
% 4) A = [ -13   2   -1   3    b = [  -61
%           -6  19    4   5          -217
%            1  -5  -37   7           247 
%            5  -9    8  23 ]         590 ]
%
% 5) A = [  4  -1  -1   0
%          -1   4   0  -1
%          -1   0   4  -1 
%           0  -1  -1   4 ]
% -----------------------------------------------------------------------------------
close;
fprintf(' Problema 1\n');
A = [  5  7  6  5 ;
       7 10  8  7 ;
       6  8 10  9 ;
       5  7  9 10 ];
b = [ 23 32 33 31 ];
[convg1a,iter1a] = is_jacobi(A,4)
[convg2a,iter2a] = is_gseidel(A,4)
if (convg1a ~= 0)
   input(' Premi un tasto per procedere con la risoluzione mediante Jacobi\n');
   [xj1] = jacobi(A,b,[eps eps eps eps],0.0001,iter1a*2)
end
if (convg2a ~= 0)
   input(' Premi un tasto per procedere con la risoluzione mediante Gauss-Seidel\n');
   close;
   [xgs1] = gseidel(A,b,[eps eps eps eps],0.0001,iter2a*2)
end
input(' Premi un tasto per continuare...\n');
% -----------------------------------------------------------------------------------
close;
fprintf(' Problema 2\n');
B = [  4  -1   0  -1   0   0 ;     
      -1   4  -1   0  -1   0 ;         
       0  -1   4   0   0  -1 ;         
      -1   0   0   4  -1   0 ;          
       0  -1   0  -1   4  -1 ;          
       0   0  -1   0  -1   4 ]
c = [  2   1   2   2   1   2 ]
[convg1b,iter1b] = is_jacobi(B,4)
[convg2b,iter2b] = is_gseidel(B,4)
if (convg1b ~= 0)
   input(' Premi un tasto per procedere con la risoluzione mediante Jacobi\n');
   [xj2] = jacobi(B,c,[eps eps eps eps eps eps],0.0001,iter1b*2)
end
if (convg2b ~= 0)
   input(' Premi un tasto per procedere con la risoluzione mediante Gauss-Seidel\n');
   close;
   [xgs2] = gseidel(B,c,[eps eps eps eps eps eps],0.0001,iter2b*2)
end
input(' Premi un tasto per continuare...\n');
% -----------------------------------------------------------------------------------
close;
fprintf(' Problema 3\n');
C = [  1   0   1 ;
       1   1   0 ;
      0.1  1   1 ]
d = [  2   2  2.1 ]
[convg1c,iter1c] = is_jacobi(C,4)
[convg2c,iter2c] = is_gseidel(C,4)
if (convg1c ~= 0)
   input(' Premi un tasto per procedere con la risoluzione mediante Jacobi\n');
   [xj3] = jacobi(C,d,[eps eps eps],0.0001,iter1c*2)
end
if (convg2c ~= 0)
   input(' Premi un tasto per procedere con la risoluzione mediante Gauss-Seidel\n');
   close;
   [xgs3] = gseidel(C,d,[eps eps eps],0.0001,iter2c*2)
end
input(' Premi un tasto per continuare...\n');
% -----------------------------------------------------------------------------------
close;
fprintf(' Problema 4\n');
D = [ -13    2   -1    3 ;
       -6   19    4    5 ;
        1   -5  -37    7 ;
        5   -9    8   23 ]
e = [ -61 -217  247  590 ]
[convg1d,iter1d] = is_jacobi(D,4)
[convg2d,iter2d] = is_gseidel(D,4)
if (convg1d ~= 0)
   input(' Premi un tasto per procedere con la risoluzione mediante Jacobi\n');
   [xj4] = jacobi(D,e,[eps eps eps eps],0.0001,iter1d*2)
end
if (convg2d ~= 0)
   input(' Premi un tasto per procedere con la risoluzione mediante Gauss-Seidel\n');
   close;
   [xgs4] = gseidel(D,e,[eps eps eps eps],0.0001,iter2d*2)
end
input(' Premi un tasto per continuare...\n');
% -----------------------------------------------------------------------------------
fprintf(' Problema 5\n');
E = [  4  -1  -1   0 ;
      -1   4   0  -1 ;
      -1   0   4  -1 ;
       0  -1  -1   4 ]
f = [  1   2   0   1 ]
[convg1e,iter1e] = is_jacobi(E,4)
[convg2e,iter2e] = is_gseidel(E,4)
if (convg1e ~= 0)
   input(' Premi un tasto per procedere con la risoluzione mediante Jacobi\n');
   [xj5] = jacobi(E,f,[eps eps eps eps],0.0001,iter1e*2)
end
if (convg2e ~= 0)
   input(' Premi un tasto per procedere con la risoluzione mediante Gauss-Seidel\n');
   close;
   [xgs5] = gseidel(E,f,[eps eps eps eps],0.0001,iter2e*2)
end
input(' Premi un tasto per continuare...\n');
% -----------------------------------------------------------------------------------
