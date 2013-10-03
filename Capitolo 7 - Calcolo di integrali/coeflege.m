

function [a,b] = coeflege(n)

if (n <= 1)
   disp(' Impossibile proseguire: parametro errato (n > 1)\n');
   return
end

for k = 1 : n
   a(k) = 0;
   b(k) = 0;
end

b(1) = 2;

for k = 2 : n
   b(k) = 1/(4 - 1/(k - 1)^2);
end