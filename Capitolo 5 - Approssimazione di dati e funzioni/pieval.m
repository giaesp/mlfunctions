% Funzione: pieval
% ----------------
% Valuta il polinomio di interpolazione p in un certo punto conoscendo i vettori 
% x ed f della tavola delle differenze divise.
%
% Prototipo: value = pieval(x,f,t)
% Input:     Il vettore x della tavola delle differenze divise
%            Il vettore f della tavola delle differenze divise
%            Il pto t in cui bisogna valutare il polinomio di interpolazione
% Output:    La valutazione del polinomio di interpolazione nel punto t
%


function value = pieval(x,f,t)

n = length(f);
value = f(n);
for i = n-1 : -1 : 1
   value = value * (t - x(i)) + f(i);
end
   