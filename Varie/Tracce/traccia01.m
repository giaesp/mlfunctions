% Esercizio:
% ----------
% Risolvere il sistema lineare Ax = b con il metodo di Gauss-Seidel e col metodo
% di sovrarilassamento, determinando sperimentalmente un valore del parametro w
% che ne acceleri la convergenza.
% 
% Provare con almeno tre valori differenti del parametro w.
%
% Trascrivere la soluzione del sistema ed il numero di iterazioni utilizzate sia dal
% metodo di Gauss-Seidel che dal metodo di sovrarilassamento con i tre valori di w,
% al fine di ottenere una precisione di 10^-4 e 10^6.

A = [  8   2   2  -3   5 ;
       0   5   6  -4   1 ; 
       1  -1   7   2  -3 ;
       4   0 -10   5   2 ;
      12  -1   2   0  12 ]
   
b = [ 23   9  22  -20 44 ]';
appr = [ 0  0  0  0  0 ]';

% Controlla la convergenza del metodo di Gauss-Seidel
[convg1,iter1] = gstest(A,4)
[convg2,iter2] = gstest(A,6)

% Applica il metodo di Gauss-Seidel
[x4,iter4,err4] = gseidel(A,b,appr,10^-4,100,0,0)
[x6,iter6,err6] = gseidel(A,b,appr,10^-6,100,0,0)

w4 = wopt(A,4)
w6 = wopt(A,6)

w4_1 = 0.93;
w4_2 = 0.93;

w4_2 = 1.12;  % Valori arbitrari
w6_2 = 1.12;

w4_3 = 0.51;
w6_3 = 0.51;

[x4_1,iter4_1,err4_1] = sor(A,b,appr,w4_1,10^-4,200,0,0)
[x4_2,iter4_2,err4_2] = sor(A,b,appr,w4_2,10^-4,200,0,0)
[x4_3,iter4_3,err4_3] = sor(A,b,appr,w4_3,10^-4,200,0,0)

[x6_1,iter6_1,err6_1] = sor(A,b,appr,w6_1,10^-6,200,0,0)
[x6_2,iter6_2,err6_2] = sor(A,b,appr,w6_2,10^-6,200,0,0)
[x6_3,iter6_3,err6_3] = sor(A,b,appr,w6_3,10^-6,200,0,0)

% Risultati ottenuti:
% -------------------
% Tolleranza :                                         10^-4 |             10^-6
% Convergenza metodo di Gauss-Seidel :            VERIFICATA |        VERIFICATA
% Numero minimo di iterazioni richiesto :                 14 |                21
% Numero di iterazioni utilizzate :                       17 |                24
% Risultato:                                1.99995644195167 |  2.00000041064397
%                                          -2.00008151180063 | -1.99999917694730
%                                           3.00000474939210 |  3.00000003552646
%                                           0.00007119784548 | -0.00000053897918
%                                           1.00003597383292 |  0.99999965202268
% ------------------------------------------------------------------------------
% Tolleranza :                     10^-4 |             10^-4 |             10^-4
% Parametro w :                     0.93 |              1.12 |              0.51
% Iterazioni eseguite :               12 |                70 |                26
% Risultato :           1.99988648662434 |  2.00006598997709 |  1.99956356775384
%                      -2.00000636794700 | -1.99987741324612 | -1.99939655218706
%                       3.00005484619691 |  2.99998855827739 |  3.00019132148370
%                       0.00010401402165 | -0.00013135214083 |  0.00074987025491
%                       1.00010384168060 |  0.99994613253950 |  1.00045483264995
% ------------------------------------------------------------------------------
% Tolleranza :                     10^-4 |             10^-4 |             10^-4
% Parametro w :                     0.93 |              1.12 |              0.51
% Iterazioni eseguite :               17 |               100 |                41
% Risultato :           1.99999923456761 |  2.00000062576189 |  1.99999641508132
%                      -2.00000013340518 | -1.99999883753478 | -1.99999499804642
%                       3.00000038966866 |  2.99999989152474 |  3.00000156868927
%                       0.00000075366953 | -0.00000124552359 |  0.00000618550304
%                       1.00000068937052 |  0.99999948918943 |  1.00000374029993







