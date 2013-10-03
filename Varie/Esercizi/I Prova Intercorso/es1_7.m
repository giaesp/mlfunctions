% Esercizio 7:
% ------------
% Data la matrice di Wilson
% A = [ 10  7  8  7 ;
%        7  5  6  5 ;
%        8  6 10  9 ;
%        7  5  9 10 ]
% verificare se è definita positiva, e risolvere poi il sistema lineare Ax = b con il
% metodo più efficiente, con
% b1 = [ 32    23    33    31 ]
% b2 = [ 32.1  22.9  32.9  31.1 ]
% b3 = [ 32.01 22.99 32.99 31.01 ]

A = [ 10  7  8  7 ;
       7  5  6  5 ;
       8  6 10  9 ;
       7  5  9 10 ];
b1 = [ 32    23    33    31    ]';
b2 = [ 32.1  22.9  32.9  31.1  ]';
b3 = [ 32.01 22.99 32.99 31.01 ]';

defpos = sylvester(A);
if (defpos == 1)
   fprintf(' La matrice A è simmetrica definita positiva\n');
else
   fprintf(' La matrice A non è simmetrica definita positiva\n');
end

% Metodi diretti e fattorizzazioni
% --------------------------------

% Funzioni MATLAB
xm1 = A\b1;
xm2 = A\b2;
xm3 = A\b3;

% Metodo di Gauss
xg1 = gauss(A,b1);
xg2 = gauss(A,b2);
xg3 = gauss(A,b3);

% Metodo di Gauss con pivoting parziale
xgp1 = gausspiv(A,b1);
xgp2 = gausspiv(A,b2);
xgp3 = gausspiv(A,b3);

% Fattorizzazione PLU
[P,L,U] = plu(A);
ylu1 = L\P*b1;
ylu2 = L\P*b2;
ylu3 = L\P*b3;
xlu1 = U\ylu1;
xlu2 = U\ylu2;
xlu3 = U\ylu3;

% Fattorizzazione di Cholesky
xch1 = cholesky(A,b1);
xch2 = cholesky(A,b2);
xch3 = cholesky(A,b3);

% Metodo di Jacobi
xj = 'non convergente';

% Metodo di Gauss-Seidel
[xgs1,itergs1] = gseidel(A,b1,[0 0 0 0]',10^-4,10000,0,0);
[xgs2,itergs2] = gseidel(A,b2,[0 0 0 0]',10^-4,10000,0,0);
[xgs3,itergs3] = gseidel(A,b3,[0 0 0 0]',10^-4,10000,0,0);

% Metodo di sovrarilassamento (SOR)
w = wopt(A,4);
[xsor1,itersor1] = sor(A,b1,[0 0 0 0]',w,10^-4,10000,0,0);
[xsor2,itersor2] = sor(A,b2,[0 0 0 0]',w,10^-4,10000,0,0);
[xsor3,itersor3] = sor(A,b3,[0 0 0 0]',w,10^-4,10000,0,0);

% Metodo della massima pendenza
[xmp1,itermp1] = maxpend(A,b1,60000,0);
[xmp2,itermp2] = maxpend(A,b2,60000,0);
[xmp3,itermp3] = maxpend(A,b3,60000,0);

% Metodo del gradiente coniugato
[xgc1,itergc1] = gcon(A,b1,10000,0);
[xgc2,itergc2] = gcon(A,b2,10000,0);
[xgc3,itergc3] = gcon(A,b3,10000,0);

fprintf('\n');
str1 = 'MATLAB';
str2 = 'gauss';
str3 = 'gausspiv';
str4 = 'plu';
str5 = 'cholesky';
str7 = 'gseidel (toll=10^4)';
str8 = 'sor (toll=10^-4)';
str9 = 'maxpend';
str10 = 'gcon';
fprintf('%20s %20s %20s %20s %20s %20s %20s %20s %20s\n',str1,str2,str3,str4,str5,str7,str8,str9,str10);

fprintf('\n Risultati Ax = b1 \n');
fprintf('%20d %20d %20d %20d %20d %20d %20d %20d %20d\n',0,0,0,0,0,itergs1,itersor1,itermp1,itergc1);
for i = 1 : length(A)
   fprintf('%20.14f %20.14f %20.14f %20.14f %20.14f %20.14f %20.14f %20.14f %20.14f\n',xm1(i),xg1(i),xgp1(i),xlu1(i),xch1(i),xgs1(i),xsor1(i),xmp1(i),xgc1(i));
end

fprintf('\n Risultati Ax = b2 \n');
fprintf('%20d %20d %20d %20d %20d %20d %20d %20d %20d\n',0,0,0,0,0,itergs2,itersor2,itermp2,itergc2);
for i = 1 : length(A)
   fprintf('%20.14f %20.14f %20.14f %20.14f %20.14f %20.14f %20.14f %20.14f %20.14f\n',xm2(i),xg2(i),xgp2(i),xlu2(i),xch2(i),xgs2(i),xsor2(i),xmp2(i),xgc2(i));
end

fprintf('\n Risultati Ax = b3 \n');
fprintf('%20d %20d %20d %20d %20d %20d %20d %20d %20d\n',0,0,0,0,0,itergs3,itersor3,itermp3,itergc3);
for i = 1 : length(A)
   fprintf('%20.14f %20.14f %20.14f %20.14f %20.14f %20.14f %20.14f %20.14f %20.14f\n',xm3(i),xg3(i),xgp3(i),xlu3(i),xch3(i),xgs3(i),xsor3(i),xmp3(i),xgc3(i));
end
fprintf('\n');

% Report:
% -------
%             MATLAB                gauss             gausspiv                  plu             cholesky  gseidel (toll=10^4)     sor (toll=10^-4)              maxpend                 gcon
%
% Risultati Ax = b1 
%                   0                    0                    0                    0                    0                 1088                  251                27448                    6
%    1.00000000000003     0.99999999999999     1.00000000000000     0.99999999999997     1.00000000000003     1.01989332826566     1.00175305547667     1.00000000000027     1.00000000000002
%    0.99999999999995     1.00000000000001     1.00000000000000     1.00000000000005     0.99999999999995     0.96723537188581     0.99723218325433     0.99999999999956     0.99999999999997
%    1.00000000000001     1.00000000000000     1.00000000000000     0.99999999999999     1.00000000000001     1.00813919362967     1.00063192350440     1.00000000000011     1.00000000000001
%    0.99999999999999     1.00000000000000     1.00000000000000     1.00000000000001     0.99999999999999     0.99513171000443     0.99958803838520     0.99999999999993     0.99999999999999
%
% Risultati Ax = b2 
%                   0                    0                    0                    0                    0                 1117                  175                20654                    7
%    5.99999999999999     5.99999999999979     5.99999999999979     5.99999999999985     5.99999999999999     5.86407492250967     6.01265121942455     5.99999999999986     5.99999999999983
%   -7.19999999999999    -7.19999999999964    -7.19999999999965    -7.19999999999975    -7.19999999999999    -6.97612923509381    -7.21997441463918    -7.19999999999977    -7.19999999999971
%    2.89999999999999     2.89999999999990     2.89999999999990     2.89999999999993     2.89999999999999     2.84438735891513     2.90456038215581     2.89999999999994     2.89999999999992
%   -0.10000000000000    -0.09999999999994    -0.09999999999994    -0.09999999999996    -0.10000000000000    -0.06673645123348    -0.10297299021782    -0.09999999999996    -0.09999999999995
%
% Risultati Ax = b3 
%                   0                    0                    0                    0                    0                  351                  238                36972                    7
%    1.49999999999991     1.49999999999996     1.49999999999996     1.49999999999999     1.49999999999991     1.52985110631303     1.50262728386862     1.49999999999981     1.49999999999992
%    0.18000000000014     0.18000000000006     0.18000000000007     0.18000000000001     0.18000000000014     0.13083475303467     0.17585190521125     0.18000000000032     0.18000000000012
%    1.18999999999997     1.18999999999998     1.18999999999998     1.19000000000000     1.18999999999997     1.20221333761234     1.19094705641174     1.18999999999992     1.18999999999997
%    0.89000000000002     0.89000000000001     0.89000000000001     0.89000000000000     0.89000000000002     0.88269484521244     0.88938259791578     0.89000000000005     0.89000000000002


