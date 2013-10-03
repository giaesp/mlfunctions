% Funzione: pievalin
% ------------------
% Valuta il polinomio di interpolazione p in un certo intervallo conoscendo i vettori 
% x ed f della tavola delle differenze divise.
%
% Prototipo: [value] = pievalin(x,f,interv)
% Input:     Il vettore x della tavola delle differenze divise
%            Il vettore f della tavola delle differenze divise
%            Il vettore interv rappresentante l'intervallo in cui valutare il 
%            polinomio
% Output:    Il vettore y contenente la valutazione del polinomio nei punti 
%            dell'intervallo
%
% Esposito Gianluca (N.Matr.056/100858)

function [value] = pievalin(x,f,interv)

n = length(interv);
for i = 1 : n
   value(i) = pieval(x,f,interv(i));
end