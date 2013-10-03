% Esercizio 11
% ------------

x = [ -1 : 0.2 : 1 ]';
f = inline('sin((pi*x)/2)^2');
for i = 1 : length(x)
   y(i) = f(x(i));
end
y = y';

X2 = [ones(size(x)) x x.^2];
a2 = X2\y;
p2 = sprintf('%.14f * x^2 + %.14f * x + %.14f',a2(3),a2(2),a2(1));
pol2 = inline(p2);

X4 = [ones(size(x)) x x.^2 x.^3 x.^4];
a4 = X4\y;
p4 = sprintf('%.14f * x.^4 + %.14f * x.^3 + %.14f * x.^2 + %.14f * x + %.14f',a4(5),a4(4),a4(3),a4(2),a4(1));
pol4 = inline(p4);

pp = spline(x,y);
yy = ppval(pp,[-1:0.01:1]);

hold on;
grid on;
xlabel('x');
ylabel('f(x)');
title('Esercizio 11 - Approssimazioni di dati e funzioni');
fplot(f,[-1 1],'b');
fplot(pol2,[-1 1],'r');
fplot(pol4,[-1 1],'k');
plot([-1:0.01:1],yy,'m');
plot(x,y,'o');
legend('Funzione f(x)','Polinomio di regressione di grado 2','Polinomio di regressione di grado 4','Spline cubica');




