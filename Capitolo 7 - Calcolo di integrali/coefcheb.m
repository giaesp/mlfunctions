% Esposito Gianluca (N.Matr.056/100858)

function [a,b] = coefcheb(n)

if (n <= 1)
   disp(' Impossibile proseguire: parametro errato (n > 1)\n');
   return
end

for k = 1 : n  
   a(k) = 0;
   b(k) = 0;
end

b(1) = 4 * atan(1);
b(2) = 0.5;

for k = 3 : n;
   b(k) = 0.25;
end