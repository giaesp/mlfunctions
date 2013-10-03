% Funzione: glegett
% -----------------
% Calcola l'integrale di una funzione nell'intervallo [a,b] con la formula 
% di Gauss-Legendre. 
%
% Prototipo: [val1,eval,i,n,err] = glegeintt(f,a,b,toll,max_iter)  
% Input:     La funzione di cui si vuole calcolare l'integrale, f
%            Gli estremi a, b dell'intervallo
%            La tolleranza richiesta, toll
%            Il numero max di iterazioni, max_iter
% Output:    L'integrale della funzione data in input, val1     
%            Il numero di valutazioni di funzione (chiamate a feval)
%            Le iterazioni utilizzate, i
%            Il numero di nodi utilizzati, n
%            L'indicatore di errore, err:
%            - err = 0 <==> Non si sono verificati errori
%            - err = 1 <==> Iterazioni impostate insufficienti
%


function [val1,eval,i,n,err] = glegeintt(f,a,b,toll,max_iter)

err = 0;
eval = 0;
[val0,eval1] = glegeint(f,a,b,2);
eval = eval + eval1;
[val1,eval2] = glegeint(f,a,b,3);
eval = eval + eval2;
n = 4;
for i = 1 : max_iter
   if (abs(val0 - val1) <= toll)
      n = n - 1;
      return
   end
   val0 = val1;
   [val1,eval3] = glegeint(f,a,b,n);
   eval = eval + eval3;
   n = n + 1;
end
err = 1;