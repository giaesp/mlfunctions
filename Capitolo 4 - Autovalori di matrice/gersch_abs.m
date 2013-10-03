% Funzione: gersch_abs
% --------------------
% Stabilisce un intervallo [a,b] contenente tutti gli autovalori della matrice A.
%
% Prototipo: [a,b] = gersch_abs(A)
% Input:     La matrice A
% Output:    Gli estremi a,b dell'intervallo contenente tutti gli autovalori
%


function [a,b] = gersch_abs(A)

[n,m] = size(A);
if (n ~= m)
   fprintf(' Impossibile proseguire: matrice non quadrata\n');
   return
end

r = zeros(n,1);
c = zeros(n,1);

% Trova R
for i = 1 : n
   for j = 1 : n
      if (j ~= i)
         r(i) = r(i) + abs(A(i,j));
      end
   end
   sx(i) = A(i,i) - r(i);   % Intersezione del cerchio dal lato destro sill'asse x
   dx(i) = A(i,i) + r(i);   % Intersezione del cerchio dal lato sinistro sull'asse x
end
a1 = min(sx);
b1 = max(dx);

% Trova C
for j = 1 : n
   for i = 1 : n
      if (i ~= j)
         c(j) = c(j) + abs(A(i,j));
      end
   end
   sx(j) = A(j,j) - c(j);
   dx(j) = A(j,j) + c(j);
end
a2 = min(sx);
b2 = max(dx);

% Interseca R e C
if (a1 <= a2)
   a = a2;
else
   a = a1;
end
if (b1 <= b2)
   b = b1;
else
   b = b2;
end