function [pol] = retreg(x,y)

s0 = length(x) + 1;
s1 = sum(x);
s2 = sum(x.^2);

t1 = sum(x.*y);
t0 = sum(y);

dt = s2 * s0 - s1^2

a = (s0 * t1 - s1 * t0)/dt;
b = (s2 * t0 - s1 * t1)/dt;

pol = [a b];

hold on;
grid on;

tempx = x(1) : 0.01 : x(length(x));
tempy = polyval(pol,tempx);

plot(x,y,'ro',tempx,tempy,'b-');

   
