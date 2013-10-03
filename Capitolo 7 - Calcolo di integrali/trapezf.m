% Funzione: trapezf
% -----------------
% Calcola l'integrale definito di una funzione con la formula composita dei Trapezi 
% a schema fisso.
%
% Prototipo: [val,eval,i,err] = trapezf(f,a,b,toll,max_iter)
% Input:     La funzione f di cui si vuole calcolare l'integrale
%            Gli estremi a,b dell'intervallo
%            La tolleranza richiesta, toll
%            Il numero max di iterazioni, max_iter
% Output:    L'integrale della funzione data in input
%            Il numero di valutazioni di funzione (chiamate a feval)
%            Le iterazioni utilizzate, i
%            L'indicatore di errore, err:
%            - err = 0 <==> Non si sono verificati errori
%            - err = 1 <==> Iterazioni impostate insufficienti
%


function [val,eval,i,err] = trapezf(f,a,b,toll,max_iter)

err = 0;
g(1) = feval(f,a);
g(3) = feval(f,b);
eval = 2;
s0 = (b - a) * (g(1) + g(3))/2;

N = 2;
h = (b - a)/2;
g(2) = feval(f,(a+h));
eval = eval + 1;
s1 = h * (g(1) + 2*g(2) + g(3))/2;

for i = 1 : max_iter
   if (abs(s1 - s0) <= 4*toll/3)
      val = s1 + 3*(s1 - s0)/4;
      return
   end
   s0 = s1;
   h = h/2;
   N2 = N * 2;
   for j = 0 : N - 1
      g(N2-2*j+1) = g(N-j+1);
   end
   for k = 0 : N - 1
      g(2*k+1+1) = feval(f,(a+(2*k+1)*h));
      eval = eval + 1;
   end
   sum = 0;
   for i = 0 : N - 1 
      sum = sum + g(2*i+1) + 2*g(2*i+1+1) + g(2*i+2+1);
   end
   s1 = h * sum/2;
   N = N2;
end
err = 1;