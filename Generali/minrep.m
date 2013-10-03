% Funzione: minrep
% ----------------
% Calcola il minimo numero rappresentabile nella macchina.
%
% Prototipo: x = minrep()
% Input:     -
% Output:    Il minimo numero rappresentabile nella macchina.
%


function x = minrep()

x = 1;
while (x ~= 0)
   temp = x;
   x = x / 10;
end
x = temp;

% Valore ottenuto sulla macchina di prova:
% 9.881312916824931e-324