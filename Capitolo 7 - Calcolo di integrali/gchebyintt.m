% Funzione: gchebyintt
% --------------------
% Calcola l'integrale di una funzione nell'intervallo di estremi a,b con 
% la formula di Gauss-Chebyshev.
%
% Prototipo: [val1,eval,i,n,err] = gchebyintt(f,a,b,toll,max_iter)
% Input:     La fuzione, f
%            Gli estremi dell'intervallo a, b
%            La tolleranza richiesta, toll
%            Il numero max di iterazioni, max_iter
% Output:    L'integrale della funzione, val1
%            Il numero di valutazioni di funzione (chiamate a feval)
%            Il numero di iterazioni, i
%            Il numero di nodi usati, n
%            L'indicatore di errore, err:
%            - err = 0 <==> Non si sono verificati errori
%            - err = 1 <==> Iterazioni impostate insufficienti
%


function [val1,eval,i,n,err] = gchebyintt(f,a,b,toll,max_iter)

err = 0;
eval = 0;
[val0,eval1] = gchebyint(f,a,b,2)
eval = eval + eval1;
[val1,eval2] = gchebyint(f,a,b,3)
eval = eval + eval2;
n = 4;
for i = 1 : max_iter
   if (abs(val0 - val1) <= toll)
      n =  n - 1;
      return
   end
   val0 = val1;
   [val1,eval3] = gchebyint(f,a,b,n)
   eval = eval + eval3;
   n = n + 1;
end
err = 1;



