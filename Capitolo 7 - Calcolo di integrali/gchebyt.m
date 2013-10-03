% Funzione: gchebyt
% -----------------
% Calcola l'integrale di una funzione nell'intervallo [-1,1] con la formula 
% di Gauss-Chebyshev.
%
% Prototipo: [val,eval,i,n,err] = gchebyt(f,toll,max_iter)  
% Input:     La funzione di cui si vuole calcolare l'integrale, f
%            La tolleranza richiesta, toll
%            Il numero max di iterzioni, max_iter
% Output:    L'integrale della funzione data in input
%            Il numero di valutazioni di funzione (chiamate a feval)
%            Le iterazione effettuate, i
%            Il numero di nodi utilizzato, n
%            L'indicatore di errore, err:
%            - err = 0 <==> Non si sono verificati errori
%            - err = 1 <==> Iterazioni impostate insufficienti
%
% Esposito Gianluca (N.matr.056/100858)

function [val,eval,i,n,err] = gchebyt(f,toll,max_iter)

err = 0;
eval = 0;
[val0,eval1] = gcheby(f,2);
eval = eval + eval1;
[val1,eval2] = gcheby(f,3);
eval = eval + eval2;
n = 4;
for i = 1 : max_iter
   if (abs(val0 - val1) <= toll)
      n = n - 1;
      return
   end
   val0 = val1;
   [val1,eval3] = gcheby(f,n);
   eval = eval + eval3;
   n = n + 1;
end
err = 1;



