% Funzione: secant2
% -----------------
% Trova lo zero di un'equazione non lineare in un intervallo [a,b], applicando
% il metodo delle secanti. Calcola l'ordine di convergenza in base allo zero dato in
% input.
%
% Prototipo: [x,convg,iter,err] = secant(f,x1,x2,zero,int_toll,zero_toll,max_iter,v_mode,g_mode)
% Input:     La funzione f
%            Gli estremi dell'intervallo [x1,x2]
%            Lo zero, zero.
%            La tolleranza sull'intervallo, int_toll
%            La tolleranza sul valore della f nello zero trovato, zero_toll
%            Il numero massimo di iterazioni possibili, max_iter
%            v_mode = 1 <==> Stampa a video ulteriori informazione per le iterazioni
%            g_mode = 1 <==> Disegna la funzione data nell'intervallo di interesse
% Output:    La radice dell'equazione non lineare appartenente all'intervallo [a,b]
%            L'ordine di convergenza del metodo, convg
%            Il numero di iterazioni richieste
%            L'indicatore di errore, err:
%            - err = 0 <==> Non si sono verificati errori
%            - err = 1 <==> La soluzione ottenuta non risponde alla precisione richiesta
%            - err = 2 <==> La soluzione ottenuta risponde alla precisione richiesta, ma
%                           in quel punto la funzione assume un valore in modulo
%                           superiore alla tolleranza richiesta
%
% Esposito Gianluca (N.Matr.056/100858)

function [x,convg,iter,err] = secant(f,x1,x2,zero,int_toll,zero_toll,max_iter,v_mode,g_mode)

err = 0;
eps_value = eeps;

if (f(x1)*f(x2) > 0)
   fprintf(' Impossibile proseguire: intervallo illegale\n');
   return
end

if (g_mode == 1)
   hold on;
   grid on;
   title('Calcolo della soluzione di un equazione non lineare - Metodo delle secanti');
   xlabel('x');
   ylabel('f(x)');
   fplot(f,[x1 x2]);
end


if (v_mode == 1)
   fprintf('%5s %20s\n','iter','x');
end

for iter = 1 : max_iter
   k = (f(x2) - f(x1))/(x2 - x1);
   x3 = x2 - f(x2)/k;
   
   if (abs(x2 - x3) <= int_toll * abs(x3))
      if (abs(f(x3)) <= zero_toll)
         x = x3;
         
         if (v_mode == 1)
            fprintf('%5d %20.14f\n',iter,x3);
         end
         
         if (g_mode == 1)
            plot(x,f(x),'sr');
            legend('f(x)','Radice');
         end
         
         err = 0;
         return
      else
         err = 2;
      end
   else
      err = 1;
   end
   
   if (iter > 1)
      convg = log(abs(x3 - zero)/abs(x2 - zero))/log(abs(x2 - zero)/abs(x1 - zero));
   end
   
   x1 = x2;
   x2 = x3;
   
   if (v_mode == 1)
      fprintf('%5d %20.14f\n',iter,x3);
   end
end

x = x3;
if (g_mode == 1)
   plot(x,f(x),'sr');
   legend('f(x)','Radice');
end