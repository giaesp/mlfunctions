% Algoritmo 1 : factor(n,A,pivot,det,ier)
% ---------------------------------------
% Il metodo di Gauss con pivoting parziale viene utilizzato per determinare la
% decomposizione GA=U di una matrice A di ordine n. La matrice triangolare
% superiore U viene memorizzata nella parte superiore di A, mentre i moltiplicatori
% mij (i>j) sono memorizzati nelle corrispondenti posizioni di A. Il vettore pivot,
% di dimensione n-1, contiene tutti gli scambi di riga effettuati durante il processo 
% di Gauss. Se la riga k-esima non viene rimossa pivot(k) = k; se invece allo stadio
% k-esimo la riga k-esima viene scambiata con la i-esima, pivot(k) = i.
% La variabile det contiene il valore di det(A).
% La variabile ier è un indicatore di errore. Se ier=0 il processo di Gauss è stato
% portato a termine ed in A troviamo le matrici G e U; se invece ier=1 la matrice A
% risulta singolare.
%
% Parametri:
% - Input: A
% - Output: A, pivot, det, ier
%
% Prototipo: [A,pivot,det,ier] = factor(A)
%
% Esposito Gianluca (N.Matr.056/100858)

function [A,pivot,det,ier] = factor(A)

eps_value = eeps;
det = 1;
[row,col] = size(A);

if (row == col)
   n = row;
else 
   ier = 0;
   return
end

for k = 1 : n - 1
   [amax,id] = max(abs(A(k:n,k)));
   i = id + k - 1;
   pivot(k) = i;
   if (amax < eps_value)
      det = 0;
      ier = 1;
      return
   end
   
   if (i ~= k)
      for j = k : n;
         temp = A(k,j);
         A(k,j) = A(i,j);
         A(i,j) = temp;
      end
      det = -det;
   end
   
   for i = k + 1 : n
      A(i,k) = -A(i,k)/A(k,k);
      for j = k+1 : 1 : n
         A(i,j) = A(i,j) + (A(i,k)*A(k,j));
      end
   end
   det = det * A(k,k);
end

if (A(n,n) == 0)
   det = 0;
   ier = 1;
   return
end
det = det * A(n,n);
ier = 0;
