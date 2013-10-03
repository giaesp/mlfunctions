% Funzione: howmanyav
% -------------------
% Stabilisce il numero di autovalori alla destra dell'autovalore lamb sfruttando
% il seguente teorema:
%
% Teorema (4.9 - pag.114 - Fondamenti di calcolo numerico):
% Sia A una matrice tridiagonale, reale e simmetrica, con Betai ~= 0, i = 1,...,n-1.
% Gli zeri di ogni polinomio pi(l), i = 2,...,n, definito da
%
% p0(l) = 1
% p1(l) = l - alfai
% ...
% pi(l) = (l - alfai) * pi-1(l) - betai-1^2 * pi-2(l), i = 2,3,...,n
%
% sono tutti reali e distinti; inoltre gli zeri di pi(l) si alternano con quelli di
% pi-1(l). Fissato un reale gamma, se pn(gamma) ~= 0, il numero di zeri di pn(l), quindi
% autovalori di A che si trovano alla destra di gamma è uguale al numero di variazioni
% di segno nella successione (di numeri)
% 1,p1(gamma),p2(gamma),...,pn-1(gamma),pn(gamma).
%
% Prototipo: numav = howmanyav(A,lamb)
% Input:     La matrice A
%            Il reale lamb
% Output:    Il numero di autovalori alla destra di lamb
%
% Esposito Gianluca (N.Matr.056/100858)

function numav = howmanyav(A,lamb)

[row,col] = size(A);
eps_value = eeps;
n = row;

% Conta il numero di autovalori a destra di lamb
p(1) = 1;
p(2) = lamb - A(1,1);
for i = 2 : n
   p(i+1) = (lamb - A(i,i)) * p(i) - (A(i,i-1)^2) * p(i-1);
end

if (abs(p(n+1)) < eps_value)
   fprintf(' Impossibile proseguire: applicazione della regola non valida\n');
   variaz = -1;
   return
end

n = length(p);
numav = 0;
prev = 1;
for i = 1 : n
   this = sign(p(i));
   if (this ~= 0) & (this ~= prev)
      numav = numav + 1;
      prev = this;
   end
end