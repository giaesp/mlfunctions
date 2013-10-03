% Funzione: ddder
% ---------------
% Calcola la diagonale della tavola delle differenze divise conoscendo oltre 
% al vettore dei punti in cui si conosce il valore della funzione e il vettore 
% dei valori della funzione in tali punti, anche il vettore dei valori che la 
% derivata prima della funzione ha in certi punti.
% NOTE: Qualora si conosca il valore della derivata prima nel pto x(i) è necessario 
%       duplicare  x(i) e f(i) nei loro rispettivi vettori
%
% Prototipo: [f] = ddder(x,f,d)
% Input:     Il vettore x dei punti in cui si conosce il valore della funzione
%            Il vettore f dei valori che la funzione assume in tali punti
%            Il vettore d dei valori che la derivata prima assume in alcuni punti 
% Output:    Il vettore f contenente la diagonale della tavola delle differenze 
%            divise
%


function [f] = dder(x,f,d)

n = length(x);
m = length(f);

% Controlla la lunghezza dei vettori x ed f
if (n ~= m)
   fprintf(' Impossibile proseguire: le dimensioni dei vettori x ed f non sono compatibili\n');
   return
end

k = length(d);
eps_value = eeps;
for i = 1 : n
   for j = n : -1 : i + 1
      if ((abs(x(j) - x(j-i))) >= eps_value)
         f(j) = (f(j) - f(j-1))/(x(j) - x(j-i));
      else
         % Controlla se il vettore delle derivate è terminato 
         if (k <= 0)
            fprintf(' Impossibile proseguire: parametri illegali\n');
            return
         end
         f(j) = d(k);
         k = k - 1;
      end
   end
end