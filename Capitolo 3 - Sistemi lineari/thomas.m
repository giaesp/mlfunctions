% Function: thomas
% ----------------
% Risolve un sistema lineare Ax = b, dove A è una matrice tridiagonale, applicando
% il metodo di Thomas.
%
% Prototipo: [x,L,U] = thomas(A,b)
% Input:     La matrice tridiagonale dei coefficienti A
%            Il vettore dei termini noti b
% Output:    Il vettore soluzione x
%            Le matrici L ed U tali che A = LU
%
% Esposito Gianluca (N.Matr.056/100858)

function [x,L,U] = thomas(A,b)

[row,col] = size(A);

% Controlla che la matrice sia quadrata
if (row ~= col)
   fprintf(' Impossibile proseguire: matrice non quadrata\n');
   return
end
n = row;

% Controlla che le dimensioni del vettore b e della matrice A siano compatibili
if (n ~= length(b))
   fprintf(' Impossibile proseguire: le dimensioni del vettore b e della matrice A\n');
   fprintf('                         risultano non compatibili\n');
   return
end

eps_value = eeps;
% Controlla che la matrice sia non singolare
if (abs(det(A)) < eps_value)
   fprintf(' Impossibile proseguire: matrice singolare\n');
   return
end

% Controlla che la matrice sia tridiagonale
for i = 1 : n
   for j = 1 : n
      if (abs(i-j) > 1)
         if (abs(A(i,j)) >= eps_value)
            fprintf(' Impossibile proseguire: matrice non tridiagonale\n');
            return
         end
      end
   end
end

% Costruzione delle matrici L ed U
L = eye(n);
U = triu(A);
U(1,1) = A(1,1);
for k = 2 : n
   L(k,k-1) = A(k,k-1)/U(k-1,k-1);
   U(k,k) = A(k,k) - (L(k,k-1)*A(k-1,k));
end

% Risoluzione del sistema lineare Ly = b
y(1) = b(1);
for i = 2 : n
   j = i - 1;
   y(i) = b(i) - L(i,j) * y(j);
end

% Risoluzione del sistema lineare Ux = y
x(n) = y(n)/U(n,n);
for i = n-1 : -1 : 1
   x(i) = (y(i) - U(i,i+1)*x(i+1))/U(i,i);
end

