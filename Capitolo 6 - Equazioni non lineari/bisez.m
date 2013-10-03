% Funzione: bisez
% ---------------
% Trova lo zero di un'equazione non lineare in un intervallo [a,b], applicando
% il metodo della bisezione.
%
% Prototipo: [x,iter,err] = bisez(f,a,b,int_toll,zero_toll,max_iter,v_mode,g_mode)
% Input:     La funzione f
%            Gli estremi dell'intervallo [a,b]
%            La tolleranza sull'intervallo, int_toll
%            La tolleranza sul valore della f nello zero trovato, zero_toll
%            Il numero massimo di iterazioni possibili, max_iter
%            v_mode = 1 <==> Stampa a video ulteriori informazione per le iterazioni
%            g_mode = 1 <==> Disegna la funzione data nell'intervallo di interesse
% Output:    La radice dell'equazione non lineare appartenente all'intervallo [a,b]
%            Il numero di iterazioni richieste
%            L'indicatore di errore, err:
%            - err = 0 <==> Non si sono verificati errori
%            - err = 1 <==> La soluzione ottenuta non risponde alla precisione richiesta
%            - err = 2 <==> La soluzione ottenuta risponde alla precisione richiesta, ma
%                           in quel punto la funzione assume un valore in modulo
%                           superiore alla tolleranza richiesta
%
% Esposito Gianluca (N.Matr.056/100858)

function [x,iter,err] = bisez(f,a,b,int_toll,zero_toll,max_iter,v_mode,g_mode)

err = 0;
limit = eeps*10;
str1 = 'Iter';
str2 = 'An';
str3 = 'Bn';
str4 = 'Mn';
str5 = '(Bn-An)/2';
str6 = 'sgn(f(B0)f(Mn))';

if (f(a)*f(b) > 0)
   fprintf(' Impossibile proseguire: intervallo illegale\n');
   return
end

if (v_mode == 1)
   fprintf('%5s%19s%19s%19s%19s  %5s\n',str1,str2,str3,str4,str5,str6);
end

if (g_mode == 1)
   hold on;
   grid on;
   title('Calcolo della soluzione di un equazione non lineare - Metodo di bisezione');
   xlabel('x');
   ylabel('f(x)');
   fplot(f,[a b]);
end

for iter = 1 : max_iter
   m = (a + b)/2;       % Punto medio
   
   if (v_mode == 1)
      fprintf('%5d%19.14f%19.14f%19.14f%19.14f',iter,a,b,m,(b-a)/2);
   end
   
   if (abs(a - b) <= 2 * int_toll + limit)
      if (abs(f(m)) <= zero_toll + limit)
         x = m;
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
   
   if (f(m)*f(b) < 0)
      a = m;
      if (v_mode == 1)
         fprintf('  -\n');
      end
   else
      b = m;
      if (v_mode == 1)
         fprintf('  +\n');
      end
   end
end

x = m;
if (g_mode == 1)
   plot(x,f(x),'sr');
   legend('f(x)','Radice');
end
 