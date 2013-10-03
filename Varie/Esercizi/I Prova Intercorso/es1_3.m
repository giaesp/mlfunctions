% Esercizio 3
% -----------
% Risolvere il seguente sisetma lineare con il metodo di eliminazione di Gauss
% senza pivoting e con pivoting parziale. Confrontare i risultati con quelli 
% ottenuti col comando in linea di Matlab
% >> A\b
% 	A(i,j) = cos((j-1)*theta(i))
% dove
% 	theta(i) = ((2*i - 1)/2*n)*pi_greco
% e
% 	b(i) = Sommatoria_per_j_che_va_da_1_a_n(A(i,j))

n = 18;
for i = 1 : n
   theta(i) = (((2 * i) - 1) / (2 * n)) * pi;
   s = 0;
   for j = 1 : n
      A(i,j) = cos((j - 1) * theta(i));
      s = s + A(i,j);
   end
   b(i) = s;
end

b = b';

x_matlab = A\b;

[x_gauss, det1] = gauss(A,b);

[x_gauss_piv, det2] = gauss_piv(A,b);

% fprintf(' Matrice risultante: ');
% A
% fprintf(' Vettore dei termini noti: ');
% b
% fprintf(' Vettore theta: ');
% theta

fprintf('  ----------------------------------------------------------------------------- \n');
fprintf(' | Risultati MatLab        | Risultati gauss()       | Risultati gauss_piv()   |\n');
fprintf('  ----------------------------------------------------------------------------- \n');
for i = 1 : length(x_matlab)
   fprintf(' | %23.14f | %23.14f | %23.14f |\n', x_matlab(i), x_gauss(i), x_gauss_piv(i));
end
fprintf('  ----------------------------------------------------------------------------- \n');
clear;
