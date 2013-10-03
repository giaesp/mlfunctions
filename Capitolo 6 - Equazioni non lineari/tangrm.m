% Funzione: tangrm
% ----------------
% Trova lo zero di un'equazione non lineare, applicando il metodo delle tangenti 
% (o di Newton-Raphson) modificato per mantenere ordine di convergenza 2 anche in
% caso di radici multiple.
%
% Prototipo: [x,iter,err] = tangrm(f,d1,d2,x1,int_toll,zero_toll,max_iter,v_mode,g_mode)
% Input:     La funzione f
%            La derivata prima d1 di f
%            La derivata seconda d2 di f
%            L'approssimazione iniziale x1
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

function [x,iter,err] = tangrm(f,d1,d2,x1,int_toll,zero_toll,max_iter,v_mode,g_mode)

err = 0;
eps_value = eeps;

if (g_mode == 1)
   hold on;
   grid on;
   title('Calcolo della soluzione di un equazione non lineare - Metodo delle tangenti (Newton-Raphson) modificato');
   xlabel('x');
   ylabel('f(x)');
   fplot(f,[x3-1 x3+1]);
end

if (v_mode == 1)
   fprintf('%5s %20s\n','iter','x');
end

for iter = 1 : max_iter
   if (abs(d1(x1)) < eps_value) | (abs(d2(x1)) < eps_value) | (d1(x1)^2 - f(x1)*d2(x1) < eps_value)
      fprintf('Impossibile proseguire: impossibile trovare la radice\n');
      return
   end
   
   x2 = x1 - (f(x1)/d1(x1))/((d1(x1)^2 - f(x1)*d2(x1))/d2(x1));
   
   if (abs(x1 - x2) <= int_toll * abs(x2))
      if (abs(f(x2)) <= zero_toll)
         x = x2;
         
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
   
   x1 = x2;
   
   if (v_mode == 1)
      fprintf('%5d %20.14f\n',iter,x4);
   end
end

x = x2;
if (g_mode == 1)
   plot(x,f(x),'sr');
   legend('f(x)','Radice');
end