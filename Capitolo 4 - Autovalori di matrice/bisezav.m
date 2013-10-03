% Funzione: bisezav
% -----------------
% Calcola gli autovalori di una matrice tridiagonale simmetrica
%
% Prototipo:    av = bisezav(A,a,b,toll)
% Input:        La matrice tridiagonale simmetrica, A
%               Gli estremi dell'intervallo contenente tutti gli autovalori, [a,b]
%               La tolleranza richiesta, toll
% Output:       Il vettore degli autovalori, av
%


function av = bisezav(A,a,b,toll)

eps_value = eeps;

% Controlla che l'intervallo [a,b] sia legale
if (a >= b)
   fprintf(' Impossibile proseguire: intervallo illegale\n');
   return
end

% Controlla che la matrice sia quadrata
[row,col] = size(A);
if (row ~= col)
   fprintf(' Impossibile proseguire: matrice non quadrata\n')
   return
end
n = row;

% Controlla che la matrice sia tridiagonale
for i = 1 : n
   for j = 1 : n
      if (abs(i - j) > 1)
         if (abs(A(i,j)) >= eps_value)
            fprintf(' Impossibile proseguire: matrice non tridiagonale\n');
            return
         end
      end
   end
end

% Controlla che la matrice sia anche simmetrica
for i = 1 : n - 1
   j = i + 1;
   if (abs(A(i,j) - A(j,i)) >= eps_value)
      fprintf(' Impossibile proseguire: matrice non simmetrica\n')
      return
   end
end

flag = 0;
flag1 = 0;
v = 1;
for i = 1 : n - 1
   if (abs(A(i,i+1)) < eps_value)     % Se Bi = 0
      flag = 1;
      temp = bisezav2(A(v:i,v:i),a,b,toll);
      v = i + 1;
      if (flag1 == 0)    % VERO se in temp è stato scritto per la prima volta
         aut1 = temp;
         flag1 = 1;
      else
         aut1 = [aut1;temp];
      end
   end   
end
if (flag == 1)           % Almeno un Bi è uguale a 0
   v = v - 1;
   aut2 = bisezav2(A(v+1:n,v+1:n),a,b,toll);
   av = [aut1;aut2];
else
   av = bisezav2(A(v:n,v:n),a,b,toll);
end