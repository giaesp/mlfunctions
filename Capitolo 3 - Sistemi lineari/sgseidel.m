% Funzione: sgseidel
% ------------------
% Risolve un sistema lineare Ax = b con il metodo di Gauss-Seidel, dove A è una
% matrice sparsa.
% Note: Controllare la convergenza del metodo di Gauss-Seidel utilizzando l'apposita
%       funzione gstest (>>help gstest per ulteriori dettagli).
%
% Prototipo: [x,iter,err] = gseidel(A,b,x,toll,max_iter,verbose_mode,graphic_mode)
% Input:     La matrice A dei coefficienti
%            Il vettore b dei termini noti
%            Il vettore x dell'approssimazione iniziale della soluzione
%            La tolleranza richiesta toll
%            Il numero massimo di iterazioni eseguibili max_iter
%            verbose_mode = 1 <==> Stampa a video i risultati delle varie iterazioni
%            graphic_mode = 1 <==> Stampa a video il grafico degli errori/iterazione
% Output:    Il vettore soluzione x
%            Il numero di iterazioni utilizzato iter
%            L'indicatore di errore err:
%            - err = 1 <==> Non è stata raggiunta la tolleranza richiesta
%            - err = 0 <==> Non si sono verificati errori
%
% Esposito Gianluca (N.Matr.056/100858)

function [x,iter,err] = gseidel(A,b,x,toll,max_iter,verbose_mode,graphic_mode)

eps_value = eeps;
err = 0;
iter = 0;
error = toll + 10;    % Maggiorazione arbitraria
[B,J,I,row,col,dt] = d2s(A);

% Controlla che la matrice sia quadrata
if (row ~= col)
   fprintf(' Impossibile proseguire: matrice non quadrata\n');
   return
end
n = row;

% Controlla che le dimensioni dei vettori x e b e della matrice A siano compatiibli
if ((n ~= length(x)) | (n ~= length(b)))
   fprintf(' Impossibile proseguire: le dimensioni dei vettori x e b e della matrice\n');
   fprintf('                         A non sono compatibili\n'); 
   return
end

% Controlla che la matrice sia non singolare
if (abs(det(A)) < eps_value)
   fprintf(' Impossibile proseguire: matrice non singolare\n');
   return
end

% Controlla che gli elementi sulla diagonale principale siano tutti diversi da zero
for i = 1 : row
   if (abs(A(i,i)) < eps_value)
      fprintf(' Impossibile proseguire: sono necessari uno o più scambi di riga in A\n');
      return
   end
end

if (graphic_mode == 1)
   hold on;
   grid on;
   title(' Grafico degli errori - Metodo di Gauss-Seidel per matrici sparse');
   xlabel('Iterazioni');
   ylabel('Errore commesso');
end

% Metodo di Gauss-Seidel per matrici sparse
while (iter < max_iter) & (error > toll)
   xk = x;
   for i = 2 : length(I)
      sum = 0;
      for j = I(i-1) : I(i)-1
         if (J(j)<i-1)
            sum = sum + B(j) * x(J(j));
         elseif (J(j)>i-1)
            sum = sum + B(j) * xk(J(j));
         else
            div = B(j);
         end
      end
      x(i-1) = (b(i-1) - sum)/div;       
   end
   error = norm((x-xk),inf)/norm(x,inf);      % Usa l'errore relativo
   iter = iter + 1;
   
   if (graphic_mode == 1)
      plot(iter,error,'*');
   end
   
   if (verbose_mode == 1)
      fprintf('%5d', iter)
      for j = 1 : length(x)
         fprintf('%20.14f', x(j));
      end
      fprintf('\n');
   end
end
if (iter >= max_iter) & (error > toll)
   err = 1;
   return
end
