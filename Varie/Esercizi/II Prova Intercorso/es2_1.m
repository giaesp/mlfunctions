% Esercizio 1
% -----------
% Calcolare gli autovalori della seguente matrice tridiagonale simmetrica con accuratezza
% 10^-2 mediante la costruzione dei polinomi caratteristici associati alle sottomatrici
% principali.
% Trascrivere la successione dei questi polinomi.
% Tracciare il grafico del polinomio caratteristico della matrice in un intervallo
% contenente tutti gli zeri.
% Migliorare poi l'accuratezza degli autovalori con il metodo delle potenze inverse.
%
% A = [ 10   6   0   0   0   0 ;
%        6  -3   4   0   0   0 ;
%        0   4   1   2   0   0 ;
%        0   0   2  -3  -1   0 ;
%        0   0   0  -1   5  12 ;
%        0   0   0   0  12   9 ].

A = [ 10   6   0   0   0   0 ;
       6  -3   4   0   0   0 ;
       0   4   1   2   0   0 ;
       0   0   2  -3  -1   0 ;
       0   0   0  -1   5  12 ;
       0   0   0   0  12   9 ]
    
p = tds_pc(A,1,1);

[a,b] = gersch_abs(A);
av = bisezav(A,a,b,10^-2);  % Calcola gli autovalori col metodo di bisezione
for i = 1 : length(av)
   av(i) = invpow(av(i),A,10^-8,1000);
end

av

fprintf('\n');
for i = 1 : length(av)
   plot(av(i),p(av(i)),'*r');
end
