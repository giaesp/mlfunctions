% Esercizio 1_2
% -------------
% Data la matrice di Hilbert 
% 	Hn = (hij)	hij = (i+j-1)^-1	i,j = 1,2,...,n
% calcolarne il numero di condizionamento per n = 1,...,15

str1 = 'n';
str2 = 'cond(Hn)';
fprintf(' %4s %30s\n', str1, str2);
for n = 1 : 15
   H = hilb(n);
   cond_matlab = cond(H);
   fprintf(' %4d %30.16g\n', n, cond_matlab);
end
