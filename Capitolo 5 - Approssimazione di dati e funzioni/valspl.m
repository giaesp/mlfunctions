% Funzione: valspl
% ----------------
% Noti i coefficienti M1, M2, ..., Mn-1, contenuti nel vettore z, della spline cubica
% naturale passante per i punti (xi,yi), i=0,1,...,n valspl valuta il valore s che tale
% spline assume nel punto t, x0 <= t < xn. Se t app. [x0,xn] la variabile err
% assume il valore 0, altrimenti err = 1.

function [s,err] = valspl(n,x,y,z,t)

err = 1;
for i = 1 : n
   if (x(i) <= t) & (t < (x(i+1)))
      err = 0;
   end
   h = x(i+1) - x(i);
   temp1 = ((((x(i+1)-t)^3) * z(i)) + ((t - x(i))^3 * z(i+1)))/6*h;
   temp2 = ((y(i+1) - y(i))/h - (h/6)*(z(i+1) - z(i)))*(t-x(i));
   temp3 = y(i);
   temp4 = -((h^2)/6)*z(i);
   s = temp1 + temp2 + temp3 + temp4;
end

   
   