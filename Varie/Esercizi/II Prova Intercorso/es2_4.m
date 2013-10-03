% Esercizio 2_4
% -------------
% Il polinomio
%
% x^4 - (13 + e) * x^3 + (57 + 8*e) * x^2 - (95 + 17*e) * x + 50 + 10 * e = 0
%
% ha radici 1,2,5,5+e. Calcolarne le radici con il metodo di Newton per diversi
% valori di e- Applicare poi opportunamente il metodo di Newton in modo tale che
% per e = 0, la convergenza risulti ancora quadratica.

p = inline('x^4 - (13 + e) * x^3 + (57 + 8*e) * x^2 - (95 + 17*e) * x + 50 + 10 * e');

p1  = inline('x^4 - (14) * x^3 + (65) * x^2 - (112) * x + 60');
d1  = inline('4 * x^3 - 42 * x^2 + 130 * x - 112');
x11 = tang(p1,d1,   0.5 ,10^-7,10^-7,1000,0,0)
x12 = tang(p1,d1,  1.98 ,10^-7,10^-7,1000,0,0)
x15 = tang(p1,d1,  4.55 ,10^-7,10^-7,1000,0,0)
x1e = tang(p1,d1, 12.51 ,10^-7,10^-7,1000,0,0)

p0 = inline('x^4 - (13) * x^3 + (57) * x^2 - (95) * x + 50');
d01 = inline('4 * x^3 - 39 * x^2 + 114 * x - 95');
d02 = inline('12 * x^2 - 78 * x + 114');
x01 = tangrm(p0,d01,d02, 0.5 ,10^-7,10^-7,1000,0,0)
x02 = tangrm(p0,d01,d02, 1.5 ,10^-7,10^-7,1000,0,0)
x05 = tangrm(p0,d01,d02, 5 ,10^-7,10^-7,1000,0,0)
