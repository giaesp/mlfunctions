% Esposito Gianluca (N.Matr.056/100858)

function av = bisezav2(A,a_,b_,toll)

eps_value = eeps;

% Controlla che la matrice sia quadrata
[row,col] = size(A);
if (row ~= col)
   fprintf(' Impossibile proseguire: matrice non quadrata\n');
   return
end
n = row;
tofind = n;

% Controlla che l'intervallo sia corretto
if (a_ >= b_)
   fprintf(' Impossibile proseguire: intervallo illegale\n');
   return
end

found = 0;
av = zeros(n,1);
a = a_;
b = b_;

while (found < tofind)
   med = (a+b)/2;
   dx = howmanyav(A,med);
   while (dx < 0) 
      if (abs(b - a) < toll)
         a = b;
         b = b_;
         found = found + 1;
         av(found) = med;
         med = (a+b)/2;
         dx =howmanyav(A,med);
      else
         b = med;
         med = (a+b)/2;
         dx = howmanyav(A,med);
      end   
   end
   sx = tofind - found - dx;
   if (sx == 0)
      a = med;
      if (abs(b-a) < toll)
         found = found + 1;
         av(found) = med;
         b = b_;
      end
   else  
      if (sx == 1) & (abs(b-a) < toll)
         found = found + 1;
         av(found) = med;
         a = med;
         b = b_;
      else
         b=med;
      end
   end
end