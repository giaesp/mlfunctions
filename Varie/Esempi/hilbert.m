% Esercizio
% ---------
% Data la matrice di Hilbert
% Hn = (hij), hij = (i+y-1)^-1, i,j=1,2,...,n
% calcolarne il numero di condizionamento per n=1,...15

for dim=1:15
   H = zeros(dim,dim);
   for i=1:dim
      for j=1:dim
         H(i,j) = power((i+j-1),-1);
      end
   end
   dim
   H
   disp(' Numero di condizionamento spettrale:');
   cond(H)
end


      

         