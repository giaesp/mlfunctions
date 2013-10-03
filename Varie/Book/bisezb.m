% Algoritmo 9 : bisez(a0,b0,f,toll)
% ---------------------------------
% L'algoritmo determina con tolleranza relativa toll una radice x dell'equazione 
% f(x) = 0, contenuta nell'intervallo (a0,b0), mediante la tecnica di bisezione.
% Se f(a0)*f(b0)<0, la variabile ier assume il valore 0, e il calcolo di x viene 
% effettuato; altrimenti l'algoritmo si arresta e segnala l'inconveniente ponendo
% ier = 1.
%
% Parametri:
% - Input: a0, b0, f, toll
% - Output: x, ier
%
% Prototipo: [x,ier] = bisez(a0,b0,f,toll,x)
%
% Esposito Gianluca (N.Matr.056/100858)

function [x,ier] = bisez(a0,b0,f,toll)

if (f(a0)*f(b0) > 0)
   ier = 1;
   return
end

ier = 0;
n = 0;
a = a0;
b = b0;

while(1)
   n = n + 1
   m = (1/2) * (a + b)
   
   if (abs(b - a) < 2 * toll * abs(m))
      x = m;
      return
   end
   
   if (f(b0)*f(m) < 0)
      a = m;
   else
      b = m;
   end
end      
   