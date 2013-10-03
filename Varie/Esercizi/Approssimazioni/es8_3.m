% Esercizio 8_3
% -------------
% Tracciare il grafico della funzione f(x) = 1/x in [1,10] e del polinomio
% osculatore P(x) tale che
% P(1) = f(1)
% P(2) = f(2)
% P(10) = f(10)
% P'(10) = f'(10)

hold on;
func = inline('1/x');
fplot(func,[1 10],'r');
x = [ 1 2 10 10 ]
y = [func(1) func(2) func(10) func(10)];
der = [ -1/100 ];
[A,f,P] = newton(3,x,y,der,1,10)
legend('f(x) = 1/x','Polinomio osculatore');