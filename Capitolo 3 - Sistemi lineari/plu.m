% Funzione: plu
% -------------
% Determina la fattorizzazione PA = LU della matrice A
%
% Prototipo: [P,L,U,det] = plu(A)
% Input:     La matrice A dei coefficienti
% Output:    La matrice delle permutazioni P
%            La matrice triangolare inferiore L
%            La matrice triangolare superiore U
%            Il determinante della matrice A
%
% Esposito Gianluca (N.Matr.056/100858)

function [P,L,U,det] = plu(A)

[row,col] = size(A);

% Controlla che lamatrice A sia quadrata
if(row ~= col)
   fprintf(' Impossibile proseguire: matrice non quadrata\n');
   return
end

n = row;

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
      for k = j + 1 : n
         A(i,k) = A(i,k) + (A(i,j) * A(j,k));
      end
   end
end

if (abs(A(n,n)) < eps_value);
   fprintf('Impossibile proseguire: matrice singolare\n');
   return
end

det = det * A(n,n);

% Determina le matrici L ed U
U = triu(A);
L = -tril(A,-1) + eye(n);

% Determina la matrice di permutazione P
P = eye(n);
for i = 1 : n
   if (pivot(i) ~= i)           % C'è stato uno scambio di righe
      for j = 1 : n
         temp = P(pivot(i),j);
         P(pivot(i),j) = P(i,j);
         P(i,j) = temp;
      end
   end
end

% Risoluzione del sistema lineare Ax = b:
% ---------------------------------------
% Ly = Pb ---> y = L \ P*b
% Ux = y  ---> x = U \ y
% x è il vettore soluzione del sistema lineare Ax = b



