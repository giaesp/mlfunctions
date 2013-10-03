% Funzione: eeps
% --------------
% Calcola la precisione di macchina
%
% Prototipo: x = eeps()
% Input:     -
% Output:    La precisione di macchina
%
% Esposito Gianluca (N.Matr.056/100858)

function x = eeps()

x = 1;
while ((1 + x) ~= 1)
   x = x / 2;
end
x = x * 2;

% Valore ottenuto sulla macchina di prova:
% 2.220446049250313e-016
