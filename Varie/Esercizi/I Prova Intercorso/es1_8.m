C = [  7   0   0   2   0   1   0 ;
       0   3  -1   0   0   1   0 ; 
       0  -1   5   0   1   0   2 ;
       2   0   0   6  -2   0   0 ;
       0   0   1  -2   4   0   0 ;
       1   1   0   0   0   5  -1 ;
       0   0   2   0   0  -1   4 ];
    
d = [  3  -2  16  -2   6  12   9 ]';
    
fprintf('Utilizzo del metodo di Gauss-Seidel per matrici sparse\n');
[xgss4,itergss4,errgss4] = sgseidel(C,d,[0 0 0 0 0 0 0]',10^-4,1000,0,0);
[xgss7,itergss7,errgss7] = sgseidel(C,d,[0 0 0 0 0 0 0]',10^-7,1000,0,0);

fprintf('Utilizzo del metodo del gradiente coniugato\n');
[xgc4,itergc4,errgc4] = gcont(C,d,10^-4,1000,0);
[xgc7,itergc7,errgc7] = gcont(C,d,10^-7,1000,0);

xgss4
itergss4
xgss7
itergss7

xgc4
itergc4
xgc7
itergc7

