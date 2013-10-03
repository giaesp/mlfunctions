% Funzione: wopt
% --------------
% Stabilisce sperimentalmente un valore del parametro w ottimale per l'accelerazione
% della convergenza della successione {x(k)}.
%
% Prototipo: w = wopt_brute(A)
% Input:     La matrice dei coefficienti A
% Output:    Il valore ottimale del parametro w
%


function w = wopt_brute(A)

L = tril(A,-1);
D = diag(diag(A));
U = triu(A,1);
rspmin = realmax;

for wt = 0.001 : 0.001 : 1.999
   Bsor = inv(D + wt * L) * ((1 - wt) * D - wt * U);
   rsp = max(abs(eig(Bsor)));
   if (rsp < rspmin)
      rspmin = rsp;
      w = wt;
   end
end

  