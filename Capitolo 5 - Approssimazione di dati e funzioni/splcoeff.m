% Funzione: splcoeff
% ------------------
% L'algoritmo determina i coefficienti M1, M2, ..., Mn-1 necessari per rappresentare
% la spline cubica naturale passante per i punti (xi,yi), i = 0,1,...,n. Tali numeri
% vengono memorizzati nel vettore z. I vettori d e c vengono introdotti per memorizzare
% rispettivamente la diagonale e la codiagonale del sistema tridiagonale simmetrico
% la cui funzione fornisce i valori {Mi}. Il termine noto del sistema viene
% memorizzato nel vettore b.
%
% Prototipo: z = splcoeff(n,x,y)
% 


function z = splcoeff(n,x,y)

for i = 1 : n - 2
   d(i) = 2 * (x(i+2) - x(i));
   c(i) = (x(i+2) - x(i+1));
   b(i) = 6 * ((y(i+2) - y(i+1))/(x(i+2) - x(i+1)) - (y(i+1) - y(i))/(x(i+1) - x(i)));
end

d(n-1) = 2 * (x(n+1) - x(n-1));
b(n-1) = 6 * ((y(n+1) - y(n))/(x(n+1) - x(n)) - (y(n) - y(n-1))/(x(n) - x(n-1)));

% Processo di eliminazione di Gauss per il sistema tridiagonale
for i = 2 : n - 1
   d(i) = d(i) - (c(i-1)^2)/d(i-1);
   b(i) = b(i) - (c(i-1)/d(i-1)) * b(i-1);
end

% Soluzione del sistema bidiagonale
z(n-1) = b(n-1)/d(n-1);
for i = 2 : n - 1
   z(n-i) = (b(n-i) - c(n-i)*z(n+1-i))/d(n-i);
end

z = cat(2,0,z);
z(n+1) = 0;

