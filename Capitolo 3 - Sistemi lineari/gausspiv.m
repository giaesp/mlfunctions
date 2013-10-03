% Funzione: gausspiv
% ------------------
% Risolve un sistema lineare Ax=b con il metodo di eliminazione di Gauss
% utilizzando la tecnica del pivoting parziale.
%
% Prototipo: [x,det] = gausspiv(A,b)
% Input:     La matrice A dei coefficienti
%            Il vettore b dei termini noti 
% Output:    Il vettore soluzione x
%            Il determinante della matrice A
%


function [x,det] = gausspiv(A,b)

[row,col] = size(A);

% Controlla che la matrice A sia quadrata
if(row ~= col)
   fprintf(' Impossibile proseguire: matrice non quadrata\n');
   return
end
n = row;

% Controlla che le dimensioni della matrice A e del vettore dei termini noti b 
% siano compatibili
if (n ~= length(b))
   fprintf(' Impossibile proseguire: le dimensioni della matrice e del vettore dei\n');
   fprintf('                         termini noti non sono compatibili\n');
   return
end

% Controlla che b sia un vettore colonna. Se non lo è lo trasforma in vettore colonna
[dim1,dim2] = size(b);
if ((dim1 == 1) & (dim2 > 1))
   b = b';
end

A = cat(2,A,b); % Unisce in un unica matrice la matrice A ed il vettore colonna b
% Inizializza vettore pivot
for i = 1 : n
   pivot(i) = i;
end

det = 1;
eps_value = eeps;

for j = 1 : n - 1
   ipiv = j;
   
   % Ricerca pivot
   amax = abs(A(j,j));
   for i = (j + 1) : n                  
      if (abs(A(i,j)) > amax)  
         ipiv = i;
         amax = abs(A(i,j));
      end
   end
   
   if (abs(amax) < eps_value)
      fprintf(' Impossibile proseguire: matrice singolare\n')
      return
   end
   
   if (ipiv > j)            % E' necessario uno scambio di righe
      temp = A(j,:);
      A(j,:) = A(ipiv,:);
      A(ipiv,:) = temp;
      det = -det;
      pivot(j) = ipiv;      % Ricorda lo scambio
    % pivot(ipiv) = j;  
   end
   
   det = det * A(j,j);
   for i = j + 1 : n
      A(i,j) = -A(i,j) / A(j,j);
      for k = j + 1 : n + 1
         A(i,k) = A(i,k) + (A(i,j) * A(j,k));
      end
   end
end

if (abs(A(n,n)) < eps_value);
   fprintf('Impossibile proseguire: matrice singolare\n');
   return
end

det = det * A(n,n);

% Risoluzione del sistema con sostituzione all'indietro
A(n,n + 1) = A(n,n + 1) / A(n,n);
for k = n - 1 : -1 : 1
   sum = 0;
   for j = k + 1 : n
      sum = sum + (A(k,j) * A(j,n+1));
   end   
   A(k,n + 1) = (A(k,n + 1) - sum) / A(k,k);
end
x = A(:,n + 1);                