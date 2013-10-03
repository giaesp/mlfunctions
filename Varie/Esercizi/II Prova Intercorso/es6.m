% Esercizio 6
% -----------

f1 = inline('(1 + exp(sqrt(x)))/sqrt(x)');
P1 = inline('2*(sqrt(x) + exp(sqrt(x)))');

f2 = inline('1/(sqrt((1+x.^2).^3))');
P2 = inline('x/sqrt(1+x.^2)');

f3 = inline('(4*x.^2 - 16*x + 4)/(x.^3 - 3*x.^2 - x + 3)');
P3 = inline('log((((x - 1).^2)*((x + 1).^3))/(x - 3))');

f4 = inline('sin(x).^5 * cos(x)');
P4 = inline('(sin(x).^6)/6');