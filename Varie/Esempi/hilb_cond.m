function [x,c1,c2] = hilb_cond(n)

A = hilb(n);
x = cond(A,2);

l = eig(A);
c1 = sqrt(max(l)/min(l));

c2 = max(l)/min(l);

