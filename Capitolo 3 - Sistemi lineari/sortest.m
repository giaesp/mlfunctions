% Funzione: sortest
% -----------------
% Stabilisce se il metodo SOR converge alla soluzione esatta del problema 
% quando è usato il parametro w per risolvere un sistema lineare Ax = b 
% di cui è data la matrice A.
%
% Prototipo: [bool,iter] = sortest(A,w,m)
% Input:     La matrice dei coefficienti A
%            Il valore del parametro di accelerazione di convergenza w
%            Il valore m, relativo alla tolleranza richiesta (10^-m)
% Output:    Restituisce bool = 1 (TRUE) se il metodo converge ed il numero minimo
%            di iterazioni richieste iter
%            Restituisce bool = 0 (FALSE) se il metodo non converge. In questo caso
%            anche il valore di iter è 0
%
% Eaposito Gianluca (N.Matr.056/100858)

function [bool,iter] = sortest(A,w,m)

[row,col] = size(A);

% Controlla la validità del valore del parametro w
if (w <= 0) | (w >= 2)
   fprintf(' Impossibile proseguire: valore del parametro w illegale\n');
   fprintf('                         (il metodo converge per 0 < w < 2)\n');
   return
end

% Controlla che la matrice sia quadrata
if (row ~= col)
   fprintf(' Impossibile proseguire: matrice non quadrata\n');
   return
end

% Costruisce le matrici L,U,D,Bsor
L   = tril(A,-1);
U   = triu(A,1);
D   = diag(diag(A));
Bsor= inv(D + w * L) * ((1 - w) * D - w * U);

rs = max(abs(eig(Bsor)));   % Raggio spettrale
if (rs >= 1)
   bool = 0;
   iter = 0;
   return
end
bool = 1;
iter = m/(-log10(rs));