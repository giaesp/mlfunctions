% Funzione: wopt
% --------------
% Stabilisce sperimentalmente un valore del parametro w ottimale per l'accelerazione
% della convergenza della successione {x(k)}.
%
% Prototipo: [w,iter,rsp] = wopt(A,m)
% Input:     La matrice dei coefficienti A
%            Il valore m, relativo all'accuratezza richiesta (10^-m)
% Output:    Il valore ottimale del parametro w
%
% Esposito Gianluca (N.Matr.056/100858)

function [w,iter,rsp] = wopt(A,m)

L = tril(A,-1);
D = diag(diag(A));
U = triu(A,1);

eps_value = eeps;
exp = 1;
delta = 10^-exp;
start = 0 + delta;
finish = 2 - delta;
iter_flag = 0;

fprintf('%6s%20s%20s%20s%20s%6s\n','Toll','Inizio intervallo','Fine intervallo','w','Raggio spettrale','Iter');
while (delta > eps_value)
   i = 1;
   for wt = start : delta : finish
      w_test(i) = wt;
      i = i + 1;
   end

   for i = 1 : length(w_test)
      Bsor = inv(D + w_test(i) * L) * ((1 - w_test(i)) * D - w_test(i) * U);
      rsp(i) = max(abs(eig(Bsor)));
   end
   [mr,index] = min(rsp);
   w = w_test(index);
   iter = m / (-log10(mr));
   
   if (iter_flag == 0)
      hold on;
      grid on;
      title('Comportamento del parametro w');
      xlabel('w');
      ylabel('Raggio spettrale');
      for i = 1 : length(w_test)
         plot(w_test(i),rsp(i),'sr');
      end
      iter_flag = 1;
   end
   fprintf('10^-%2d%20.14f%20.14f%20.14g%20.14g%6.0f\n',exp,start,finish,w,mr,iter);

   exp = exp + 1;
   delta = 10^-exp;
   start = w - delta*10;
   finish = w + delta*10;
end



   