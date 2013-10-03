% Funzione: csa
% -------------
% Calcola l'integrale definito di una funzione con la formula composita di 
% Cavalieri-Simpson con schema adattivo.
%
% Prototipo: [AI,eval,lev,it,err] = csa(f,a,b,toll,max_level,graph_mode)
% Input:     La funzione f di cui si vuole calcolare l'integrale
%            Gli estremi a,b dell'intervallo
%            La tolleranza richiesta, toll
%            Il numero max di livelli, max_level
%            graph_mode = 1 <==> Disegna la f(x) ed i nodi di integrazione
% Output:    L'integrale della funzione data in input,AI
%            Il numero di valutazioni di funzione (chiamate a feval)
%            Il livello raggiunto, lev
%            Le iterazioni, it
%            L'indicatore di errore, err:
%            - err = 0 <==> Non si sono verificati errori
%            - err = 1 <==> Raggiunto il livello massimo
%
% Esposito Gianluca (N.Matr.056/100858)

function [AI,eval,lev,it,err] = csa(f,a_,b,toll,max_level,graph_mode)

if (graph_mode == 1)
   hold on;
   title('Calcolo integrale con la formula di Cavalieri-Simpson (schema adattivo)');
   xlabel('x');
   ylabel('f(x)');
   fplot(f,[a_ b]);
end
   
lev = 0;   
err = 0;
AI = 0;
i = 1;
tol(i) = 10 * toll; 
a(i) = a_;
h(i) = (b - a_)/2;
TA(i) = feval(f,a_);
TC(i) = feval(f,a_+h(i));
TB(i) = feval(f,b);
eval = 3;
S(i) = h(i)*(TA(i)+4*TC(i)+TB(i))/3;
L(i) = 1*toll;              
it = 0;
while (i > 0)
   TD = feval(f,a(i)+h(i)/2);
   eval = eval + 1;
   TE = feval(f,a(i)+3*h(i)/2);
   eval = eval + 1;
   
   if (graph_mode == 1)
      plot(a(i),f(a(i)),'.r');                     % TA(i)
      plot(a(i)+h(i),f(a(i)+h(i)),'.r');           % TC(i)
      plot(a(i)+2*h(i),f(a(i)+2*h(i)),'.r');       % TB(i)
      plot(a(i)+h(i)/2, f(a(i)+h(i)/2),'.r');      % TD
      plot(a(i)+3*h(i)/2,f(a(i)+3*h(i)/2),'.r');   % TE
   end
   
   S1 = h(i)*(TA(i)+4*TD+TC(i))/6;
   S2 = h(i)*(TC(i)+4*TE+TB(i))/6;
   t1 = a(i);
   t2 = TA(i);
   t3 = TC(i);
   t4 = TB(i);
   t5 = h(i);
   t6 = tol(i);
   t7 = S(i);
   t8 = L(i);
   i  = i - 1;                    % Cancella il livello
   if (abs(S1 + S2 - t7) < t6)
      AI = AI + (S1 + S2);
   else
      if (t8 >= max_level)
         err = 1;
         return
      else
         % Si aggiunge un livello
         lev = lev + 1;
         
         % Dati per mezzo intervallo dx
         i = i + 1;
         a(i) = t1 + t5;
         TA(i) = t3;
         TC(i) = TE;
         TB(i) = t4;
         h(i) = t5/2;
         tol(i) = t6/2;
         S(i) = S2;
         L(i) = t8+1;
         
         % Dati per mezzo intervallo sx
         i = i + 1;
         a(i) = t1;
         TA(i) = t2;
         TC(i) = TD;
         TB(i) = t3;
         h(i) = h(i-1);
         tol(i) = tol(i-1);
         S(i) = S1;
         L(i) = L(i-1);

      end
   end
   it = it + 1;
end
