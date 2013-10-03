% Funzione: gleget
% ----------------
% Calcola l'integrale di una funzione nell'intervallo [-1,1] con la formula 
% di Gauss Legendre.
%
% Prototipo: [val,eval,i,n,err] = gleget(f,toll,max_iter)  
% Input:     La funzione di cui si vuole calcolare l'valale, funz
%            La tolleranza richiesta, toll
%            Il numero max di iterazioni, max_iter
% Output:    L'integrale della funzione data in input, val     
%            Il numero di valutazioni di funzione (chiamate a feval)
%            Le iterazioni utilizzate, i
%            Il numero di nodi utilizzati, n
%            L'indicatore di errore, err:
%            - err = 0 <==> Non si sono verificati errori
%            - err = 1 <==> Iterazioni impostate insufficienti
%


function [val,i,n,err] = gleget(f,toll,max_iter)

err = 0;
eval = 0;
[val0,eval1] = glege(f,2);
eval = eval + eval1;
[val1,eval2] = glege(f,3);
eval = eval + eval2;
n = 4;
for i = 1 : max_iter
   if (abs(val0-val1) <= toll)
      n =  n - 1;
      return
   end
   val0 = val1;
   [val1,eval3] = glege(f,n)
   eval = eval + eval3;
   n = n + 1;
end
err = 1;
