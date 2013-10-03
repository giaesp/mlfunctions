% Function: gerschgorin
% ----------------------
% Permette di stabilire gli estremi degli intervalli [a,b] contenenti tutti
% gli autovalori della matrice A
%
% Prototipo: B = gerschgorin(A)
% Input:     La matrice A
% Output:    Gli estremi [a,b] degli intervalli contenenti tutti gli autovalori
%            organizzati in matrice (gli estremi sono suddivisi per riga).
% 
% Esposito Gianluca (N.Matr. 056/100858)

function Sol = gerschgorin(A)

[n,m] = size(A);
if (n ~= m)
   fprintf('Impossibile proseguire: matrice non quadrata\n');
   return;
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
   sx(i) = A(i,i) - r(i); % Intersezione del cerchio dal lato dx sull'asse x
   dx(i) = A(i,i) + r(i); % Intersezione del cerchio dal lato sx sull'asse x
   R(i,:) = [sx(i) dx(i)];
end

for i = 1 : n
   for j = 1 : n
      
      % Caso 1: eccedenza a sinistra
      %
      %                 |--------------------|
      %                R(i,1)               R(i,2)
      %
      %          |------|								oppure
      %       R(j,1)   R(j,2)
      %
      %          |---------------|              oppure
      %       R(j,1)           R(j,2)
      %
      %          |---------------------------|
      %       R(j,1)                      R(j,2)
      
      if ((R(i,1) >= R(j,1)) & (R(j,2) >= R(i,1)) & (R(j,2) <= R(i,2)))
         R(i,1) = R(j,1);
         R(j,2) = R(i,2);
         
      % Caso 2: eccedenza a destra
      %
      %              |--------------------|
      %            R(i,1)               R(i,2)
      %
      %                                   |------|      oppure
      %                               R(j,1)    R(j,2)
      %
      %                        |-----------------|      oppure
      %                      R(j,1)            R(j,2)
      %
      %              |---------------------------|
      %             R(j,1)                     R(j,2) 
      
      elseif ((R(j,2) >= R(i,2)) & (R(j,1) >= R(i,1)) & (R(j,1) <= R(i,2)))
         R(i,2) = R(j,2);
         R(j,1) = R(i,1);
        
      % Caso 3: contenuto/coincidente
      %
      %              |--------------------|
      %            R(i,1)               R(i,2)
      %
      %                    |-------|            oppure
      %                  R(j,1)   R(j,2)
      %
      %              |--------------------|
      %            R(j,1)               R(j,2)
      
      elseif ((R(j,1) >= R(i,1)) & (R(j,1) <= R(i,2)) & (R(j,2) >= R(i,1)) & (R(j,2) <= R(i,2)))
         R(j,1) = R(i,1);
         R(j,2) = R(j,2);
         
      %Caso 4: contenente
      %
      %                 |-------------|
      %               R(i,1)        R(i,2)
      %    
      %              |---------------------|
      %            R(j,1)                R(j,2)
      
      elseif((R(j,1) < R(i,1)) & R(j,2) > R(i,2))
         R(i,1) = R(j,1);
         R(i,2) = R(j,2);
         
      % Caso 5: segmenti distinti
      %
      %                     |-----------------|
      %                    R(i,1)             R(i,2)
      %
      %         |-------|									      oppure
      %      R(j,1)    R(j,2)
      %
      %                                          |-----|
      %                                       R(j,1)  R(j,2)
      
      else
         % Lascia tutto invariato
      end
   end
end

% Trova C
for j = 1 : n
   for i = 1 : n
      if (i ~= j)
         c(j) = c(j) + abs(A(i,j));
      end
   end
   sx(n+j) = A(j,j) - c(j); % Intersezione del cerchio dal lato dx sull'asse x
   dx(n+j) = A(j,j) + c(j); % Intersezione del cerchio dal lato sx sull'asse x
   C(j,:) = [sx(n+j) dx(n+j)];
end

for i = 1 : n
   for j = 1 : n
      
      if ((C(i,1) >= C(j,1)) & (C(j,2) >= C(i,1)) & (C(j,2) <= C(i,2)))
         C(i,1) = C(j,1);
         C(j,2) = C(i,2);
         
      elseif ((C(j,2) >= C(i,2)) & (C(j,1) >= C(i,1)) & (C(j,1) <= C(i,2)))
         C(i,2) = C(j,2);
         C(j,1) = C(i,1);
        
      elseif((C(j,1) >= C(i,1)) & (C(j,1) <= C(i,2)) & (C(j,2) >= C(i,1)) & (C(j,2) <= C(i,2)))
        C(j,1) = C(i,1);
        C(j,2) = C(j,2);
      
      elseif((C(j,1) < C(i,1)) & C(j,2) > C(i,2))
         C(i,1) = C(j,1);
         C(i,2) = C(j,2);
         
      else
         % Lascia tutto invariato
      end
   end
end

% Interseca R e C
for i = 1 : n
   for j = 1 : n
      if ((R(i,1) >= C(j,1)) & (R(i,2) >= C(j,2)) & (R(i,1) <= C(j,2)))
         RC(i,1) = R(i,1);
         RC(i,2) = C(j,2);
         
      elseif ((R(i,2) >= C(j,1)) & (R(i,2) <= C(j,2)) & (R(i,1) <= C(j,1)))
         RC(i,1) = C(j,1);
         RC(i,2) = R(i,2);
        
      elseif((C(j,1)>=R(i,1))&(C(j,1)<=R(i,2))&(C(j,2)>=R(i,1))&(C(j,2)<= R(i,2)))
         RC(i,1) = C(j,1);
         RC(i,2) = C(j,2);
      
      elseif((C(j,1) < R(i,1)) & C(j,2) > R(i,2))
         RC(i,1) = R(i,1);
         RC(i,2) = R(i,2);
         
      else
         % Lascia tutto invariato   
      end
   end
end

% Elimina gli intervalli ripetuti
Sol(1,:) = RC(1,:);
[n,m] = size(RC);
for i = 1 : n
   [p,q] = size(Sol);
   found = 0;
   for j = 1 : p
      if (RC(i,:) == Sol(j,:)) 
         found = 1;   
      end
   end
   if (found ~= 1)
      Sol = cat(1, Sol, RC(i,:));
   end
end

