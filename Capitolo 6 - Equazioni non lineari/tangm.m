% Funzione: tangm
% ---------------
% Trova lo zero multiplo di un'equazione non lineare, applicando il metodo delle tangenti 
% (o di Newton-Raphson).
% Note: La molteplicitÓ della radice Ŕ nota.
%
% Prototipo: [x,convg,iter,err] = tangm(f,d,x3,m,int_toll,zero_toll,max_iter,v_mode,g_mode)
% Input:     La funzione f
%            La derivata d di f
%            L'approssimazione iniziale, x3
%            La molteplicitÓ della radice, m
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


function [x,convg,iter,err] = tang(f,d,x3,m,int_toll,zero_toll,max_iter,v_mode,g_mode)

err = 0;
convg = 0;
x1 = 0;
x2 = 0;
eps_value = eeps;

if (abs(d(x3)) < eps_value)
   fprintf(' Impossibile proseguire: approssimazione illegale\n');
   return
end

if (g_mode == 1)
   hold on;
   grid on;
   title('Calcolo della soluzione di un equazione non lineare - Metodo delle tangenti (Newton-Raphson)');
   xlabel('x');
   ylabel('f(x)');
   fplot(f,[x3-1 x3+1]);
end

if (v_mode == 1)
   fprintf('%5s %20s\n','iter','x');
end

for iter = 1 : max_iter
   k = d(x3);
   x4 = x3 - m*(f(x3)/k);
   
   if (abs(x3 - x4) <= int_toll * abs(x4))
      if (abs(f(x4)) <= zero_toll)
         x = x4;
         
         if (v_mode == 1)
            fprintf('%5d %20.14f\n',iter,x);
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
   
   if (iter > 2)
      convg = log(abs(x3 - x4)/abs(x2 - x4))/log(abs(x2 - x4)/abs(x1 - x4));
   end
   
   x1 = x2;
   x2 = x3;
   x3 = x4;
   
   if (v_mode == 1)
      fprintf('%5d %20.14f\n',iter,x4);
   end
end

x = x4;
if (g_mode == 1)
   plot(x,f(x),'sr');
   legend('f(x)','Radice');
end