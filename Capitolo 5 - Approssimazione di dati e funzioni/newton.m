% Funzione: newton
% ----------------
% Calcola la tavola delle differenze divise, dati i vettori x ed f
%
% Prototipo:  [A,f,P] = newton(n,x,f,d,x_beg,x_end)
% Input:      Il grado n del polinomio di interpolazione cercato
%             Il vettore x dei punti
%             Il vettore f contenente la valutazione della funzione nei punti
%             del vettore x
%             Il vettore d delle derivate prime nei punti xi (qualora ci siano, è
%             necessario duplicare xi in x e f(xi) in f)
%             L'intervallo di rappresentazione della polinomio di interpolazione
%             (Specificando x_beg = 0 e x_end = 0 il polinomio non viene rappresentanto 
%              graficamente)
% Output:     La tavola delle differenze divise (sottoforma di matrice, A)
%             Il vettore f contenente la diagonale della tavola delle
%             differenze divise
%             Il polinomio di interpolazione P
%             Il grafico del polinomio di interpolazione P
%
% Esposito Gianluca (N.Matr.056/100858)

function [A,f,P] = newton(grad,x,f,d,x_beg,x_end)
eps_value = eeps;
xlen = length(x);
flen = length(f);
n = xlen;
grad = grad + 1;

if (grad > xlen)
   fprintf(' Impossibile proseguire: valore grad illegale\n');
   return
end

% Controlla la lunghezza dei vettori x ed f
if (xlen ~= flen)
   fprintf(' Impossibile proseguire: i vettori x ed f non sono compatibili\n');
   return
end

x = x';          % Trasforma il vettore x in un vettore colonna
f = f';          % Trasforma il vettore f in un vettore colonna
A = cat(2,x,f);  % Crea la matrice A concatenando i vettori x ed y
d_index = 1;

for k = 1 : n
   for t = k + 1 : n
      if (A(t,1) == A(t-1)) & (k == 1)
         A(t,k+2) = d(d_index);
         d_index = d_index + 1;
      else
         A(t,k+2) = (A(t,k+1) - A(t-1,k+1))/(A(t,1)-A(t-k,1));
      end
   end
end
f = diag(A(:,2:grad+1));

p = sprintf('%.14f', f(1));
for i = 2 : length(f)
   p = strcat(p,'+');
   diag_temp = sprintf('%.14f', f(i));
   p = strcat(p,diag_temp);
   for j = i-1 : -1 : 1
      clear temp;
      temp = sprintf(' * (x - (%.14f))', x(j));
      p = strcat(p,temp);
   end
end
P = inline(p);

if ((x_beg ~= 0) | (x_end ~= 0))
   hold on;
   title('Polinomio di interpolazione - Formula di interpolazione di Newton alle differenze divise');
   xlabel('x');
   ylabel('f(x)');
   fplot(P,[x_beg x_end]);
   grid on;
   for i = 1 : length(x)
      plot(x(i),P(x(i)),'sr')
   end
   legend('Polinomio di interpolazione','Punti di interpolazione');
end

