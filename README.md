mlfunctions
===========

Analisi Numerica - MATLAB functions

A distanza di qualche anno pubblico un mio piccolo lavoro, svolto per l'esame di Analisi Numerica, il quale consisteva nell'elaborare una serie di metodi, da utilizzare in MATLAB, per lo svolgimento di problemi matematici.  
Ecco una panoramica, opportunamente strutturata, dei file presenti nel seguente archivio compresso liberamente scaricabile, ma soggetta alla <a href="http://creativecommons.org/licenses/by-sa/2.5/deed.it">Creative Commons Licence</a>:

La quasi totalit&agrave; &egrave; commentata e spiegata: troverete all'interno di ciascun file una spiegazione sufficientemente dettagliata. 
 alginst.m  - Installa i metodi seguenti aggiornando le path in Matlab

 Sistemi Lineari

  - choles.m  
  Data una matrice A simmetrica definita positiva, calcola la matrice L triangolare inferiore tale che L*L' = A.
  - choleski.m  
  Calcola la matrice L triangolare inferiore con l(i,i) &gt; 0 tale che L * L' = A. Successivamente trova la soluzione al problema originario risolvendo i due sistemi triangolari Ly = b e Ux = y.
  - cramer.m  
  Calcola la soluzione x di un sistema lineare Ax = b utilizzando la regola di Cramer.
  - d2s.m  
  Trasforma una matrice sparsa rappresentata come matrice densa in una matrice rappresentata sottoforma di tre vettori, A, J, I, rispettivamente il vettore dei valori non nulli, il vettore dell'indice delle colonne ed il vettore dei  puntatori ad A.
  - gauss.m  
  Risolve un sistema lineare Ax = b utilizzando il metodo di eliminazione di Gauss senza pivoting.
  - gausspiv.m  
  Risolve un sistema lineare Ax=b con il metodo di eliminazione di Gauss utilizzando la tecnica del pivoting parziale.
  - gcon.m  
  Risolve un sistema lineare Ax=b utilizzando il metodo del gradiente coniugato.
  - gcont.m  
  Risolve un sistema lineare Ax=b utilizzando il metodo del gradiente coniugato.
  - gseidel.m  
  Risolve un sistema lineare Ax=b con il metodo di Gauss-Seidel.
  - gstest.m  
  Stabilisce se il metodo di Gauss-Seidel converge alla soluzione esatta del sistema lineare Ax = b di cui &egrave; data la matrice A
  - jacobi.m  
  Risolve un sistema lineare Ax=b con il metodo di Jacobi.
  - jtest.m  
  Stabilisce se il metodo di Jacobi converge alla soluzione esatta del sistema lineare Ax = b di cui &egrave; data la matrice A
  - maxpend.m  
  Risolve un sistema lineare Ax = b la cui matrice dei coefficienti A &egrave; simmetrica definita positiva. Per la risoluzione &egrave; utilizzato il metodo della massima pendenza.
  - maxpendt.m  
  Risolve un sistema lineare Ax = b la cui matrice dei coefficienti A &egrave; simmetrica definita positiva. Per la risoluzione &egrave; utilizzato il metodo della massima pendenza.
  - plu.m  
  Determina la fattorizzazione PA = LU della matrice A.
  - sgseidel.m  
  Risolve un sistema lineare Ax = b con il metodo di Gauss-Seidel, dove A &egrave; una matrice sparsa.
  - sjacobi.m  
  Risolve un sistema lineare Ax = b la cui matrice dei coefficienti &egrave; sparsa.  
  Per la risoluzione &egrave; uilizzato il metodo iterativo di Jacobi per le matrici sparse.
  - sor.m  
  Risolve un sistema lineare Ax = b con il metodo di sovrarilassamento (SOR).
  - sortest.m  
  Stabilisce se il metodo SOR converge alla soluzione esatta del problema  quando &egrave; usato il parametro w per risolvere un sistema lineare Ax = b  di cui &egrave; data la matrice A.
  - ssor.m  
  Calcola la soluzione di un sistema lineare Ax = b, dove A &egrave; una matrice sparsa, utilizzando il metodo di sovrarilassamento (SOR)
  - sylvester.m  
  Controlla se una matrice simmetrica &egrave; definita positiva o meno utilizzando il Criterio di Sylvester.
  - thomas.m  
  Risolve un sistema lineare Ax = b, dove A &egrave; una matrice tridiagonale, applicando il metodo di Thomas.
  - trilow.m  
  Risolve un sistema triangolare inferiore con sostituzione in avanti.
  - triup.m  
  Risolve un sistema triangolare superiore con sostituzione all'indietro.
  - wopt.m  
  Stabilisce sperimentalmente un valore del parametro w ottimale per l'accelerazione della convergenza della successione {x(k)}.
  - wopt_brute.m  
  Stabilisce sperimentalmente un valore del parametro w ottimale per l'accelerazione della convergenza della successione {x(k)}.

Autovalori di matrice

  - avqr.m  
    Calcola gli autovalori della matrice A con il metodo QR 
  
  - bisezav2.m 
  - bisezav.m  
  Calcola gli autovalori di una matrice tridiagonale simmetrica
  - gersch_abs.m  
  Stabilisce un intervallo [a,b] contenente tutti gli autovalori della matrice A.
  - gershgorin.m  
  Permette di stabilire gli estremi degli intervalli [a,b] contenenti tutti gli autovalori della matrice A
  - howmanyav.m  
  Stabilisce il numero di autovalori alla destra dell'autovalore lamb. 
  - invpow.m  
  Calcola l'autovalore della matrice A pi&ugrave; vicino all'approssimazione p  data in input alla funzione.
  - maxpow.m  
  Calcola l'autovalore di max modulo (metodo delle potenze)
  - minpow.m  
  Calcola l'autovalore di minimo modulo della matrice data in input
  - tds_pc.m  
  Calcola il polinomio caratteristico di una matrice B tridiagonale simmetrica  

 Approssimazione di dati e funzioni 

  - ddder.m  
  Calcola la diagonale della tavola delle differenze divise conoscendo oltre  al vettore dei punti in cui si conosce il valore della funzione e il vettore  dei valori della funzione in tali punti, anche il vettore dei valori che la  derivata prima della funzione ha in certi punti.
  - difdiv.m  
  Calcola la diagonale della tavola delle differenze divise, dati i vettori x ed f.
  - newton.m  
  Calcola la tavola delle differenze divise, dati i vettori x ed f.
  - pieval.m  
  Valuta il polinomio di interpolazione p in un certo punto conoscendo i vettori  x ed f della tavola delle differenze divise.
  - pievalin.m  
  Valuta il polinomio di interpolazione p in un certo intervallo conoscendo i vettori  
  x ed f della tavola delle differenze divise.
  - retreg.m 
  - spl.m  
  L'algoritmo determina i coefficienti M1, M2, ..., Mn-1 necessari per rappresentare la spline cubica naturale passante per i punti (xi,yi), i = 0,1,...,n. Tali numeri vengono memorizzati nel vettore z. I vettori d e c vengono introdotti per memorizzare rispettivamente la diagonale e la codiagonale del sistema tridiagonale simmetrico la cui funzione fornisce i valori {Mi}. Il termine noto del sistema viene memorizzato nel vettore b.
  - splc.m 
  - splcoeff.m  
  L'algoritmo determina i coefficienti M1, M2, ..., Mn-1 necessari per rappresentare la spline cubica naturale passante per i punti (xi,yi), i = 0,1,...,n. Tali numeri vengono memorizzati nel vettore z. I vettori d e c vengono introdotti per memorizzare rispettivamente la diagonale e la codiagonale del sistema tridiagonale simmetrico la cui funzione fornisce i valori {Mi}. Il termine noto del sistema viene memorizzato nel vettore b.
  - valspl.m  
   Noti i coefficienti M1, M2, ..., Mn-1, contenuti nel vettore z, della spline cubica naturale passante per i punti (xi,yi), i=0,1,...,n valspl valuta il valore s che tale spline assume nel punto t, x0 &lt;= t &lt; xn. Se t app. [x0,xn] la variabile err assume il valore 0, altrimenti err = 1

 Equazioni non lineari 

  - bisez.m  
  Trova lo zero di un'equazione non lineare in un intervallo [a,b], applicando il metodo della bisezione.  
  - secant2.m  
  Trova lo zero di un'equazione non lineare in un intervallo [a,b], applicando il metodo delle secanti. Calcola l'ordine di convergenza in base allo zero dato in
   input.
  - secant.m  
  Trova lo zero di un'equazione non lineare in un intervallo [a,b], applicando il metodo delle secanti.
  - tang2.m  
  Trova lo zero di un'equazione non lineare, applicando il metodo delle tangenti (o di Newton-Raphson). Calcola l'ordine di convergenza in base allo zero dato in input.
  - tang.m  
  Trova lo zero di un'equazione non lineare, applicando il metodo delle tangenti  (o di Newton-Raphson).
  - tangm.m 
   Trova lo zero multiplo di un'equazione non lineare, applicando il metodo delle tangenti  (o di Newton-Raphson).
  - tangrm.m  
    Trova lo zero di un'equazione non lineare, applicando il metodo delle tangenti  (o di Newton-Raphson) modificato per mantenere ordine di convergenza 2 anche in caso di radici multiple.

Calcolo di integrali

  - coefcheb.m 
  - coeflege.m 
  - csa.m  
  Calcola l'integrale definito di una funzione con la formula composita di  Cavalieri-Simpson con schema adattivo.
  - csf.m  
  Calcola l'integrale definito di una funzione con la formula composita  di Cavalieri-Simpson a schema fisso.
  - gcheby2.m  
  Calcola l'integrale di una funzione nell'intervallo [-1,1] con  la formula di Gauss-Chebyshev.
  - gcheby.m  
  Calcola l'integrale di una funzione nell'intervallo [-1,1] con  la formula di Gauss-Chebyshev.
  - gchebyint2.m  
  Calcola l'integrale di una funzione nell'intervallo [a,b] con la formula di  Gauss-Chebyshev.
  - gchebyint.m  
  Calcola l'integrale di una funzione nell'intervallo [a,b] con la formula di  Gauss-Chebyshev.
  - gchebyintt.m  
  Calcola l'integrale di una funzione nell'intervallo di estremi a,b con  la formula di Gauss-Chebyshev.
  - gchebyt.m  
  Calcola l'integrale di una funzione nell'intervallo [-1,1] con la formula  di Gauss-Chebyshev.
  - glege.m  
  Calcola l'integrale di una funzione nell'intervallo [-1,1] con la formula  di Gauss-Legendre.
  - glegeint.m  
  Calcola l'integrale di una funzione nell'intervallo [a,b] con la  formula di Gauss-Legendre.
  - glegeintt.m  
  Calcola l'integrale di una funzione nell'intervallo [a,b] con la formula  di Gauss-Legendre. 
  - gleget.m  
  Calcola l'integrale di una funzione nell'intervallo [-1,1] con la formula  di Gauss Legendre.
  - trapeza.m  
  Calcola l'integrale definito di una funzione con la formula composita  dei Trapezi con schema adattivo.
  - trapezf.m  
  Calcola l'integrale definito di una funzione con la formula composita dei Trapezi  a schema fisso.
  - zpcheb.m  
  Calcola i nodi e i pesi per le formule di Gauss-Chebyshev  
  - zplege.m  
  Calcola i nodi e i pesi per le formule di Gauss-Legendre

 Generali 

  -  eeps.m  - Precisione di macchina
  - minrep.m  -	Minimo numero rappresentabile nella macchina

Varie  

  - Book 

      -bisezb.m
      -factor.m
      -solve.m
    
  
  - Esempi 
    
      - 38.m 
      - es2_test.m 
      - es2b_test.m 
      - esempio5_1.m 
      - esempio5_2.m 
      - hilb_cond.m 
      - hilbert.m 
    
  
  - Esercizi 
    
      -esercizio2.m - Fenomeno di Runge 
      -esercizio2a.m - Fenomeno di Runge 
      -esercizio2b.m - Fenomeno di Runge 
      -esercizio3.m - Equazioni non lineari 
      -esercizio3a.m - Polinomi di interpolazione 
      -esercizio3b.m - Polinomi di interpolazione 
      -esercizio4.m - Jacobi e Gauss-Seidel 
      -esercizio5.m - Spline cubica e polinomio di interpolazione
        
          - Approssimazioni
             
            
              -es3_1.m - Polinomi di interpolazione 
              -es3_2.m - Polinomi di interpolazione 
              -es6.m - Differenze divise 
              -es8_1.m - Polinomio osculatore 
              -es8_2.m - Polinomio osculatore 
              -es8_3.m - Polinomio osculatore 
              -es11.m 
              -es12_1.m - Polinomio di interpolazione 
            
          
          - I Prova Intercorso
             
            
              -es1_1.m
              -es1_2.m - Matrice di Hilbert 
              -es1_3.m - Sistema lineare (Gauss) 
              -es1_4_1.m - Convergenza (Jacobi/Gauss-Seidel)
              -es1_4_2.m - Convergenza (Jacobi/Gauss-Seidel)
              -es1_4_3.m - Convergenza (Jacobi/Gauss-Seidel)
              -es1_4_4.m - Convergenza (Jacobi/Gauss-Seidel)
              -es1_4_5.m - Convergenza (Jacobi/Gauss-Seidel)
              -es1_5.m - Convergenza e sovrarilassamento 
              -es1_6.m - Choleski 
              -es1_7.m - Matrice di Wilson 
              -es1_8.m - Metodo di Gauss-Seidel e del gradiente coniugato 
            
          
          - II Prova Intercorso 
            
              -es2_1.m - Autovalori 
              -es2_3_1.m - Equazioni non lineari con il metodo delle secanti e di Newton
              -es2_3_2.m - Equazioni non lineari con il metodo delle secanti e di Newton 
              -es2_4.m - Metodo di Newton 
              -es6.m
            
          
        
      
    
  
  - Tracce 
    
      -traccia01.m - Risoluzione di un sistema lineare Ax = b con il metodo di Gauss-Seidel e col metodo di sovrarilassamento