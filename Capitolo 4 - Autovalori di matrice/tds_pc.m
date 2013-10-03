% Funzione: tds_pc
% ----------------
% Calcola il polinomio caratteristico di una matrice B tridiagonale simmetrica
%
% Prototipo: [p] = tds_pc(B,v_mode)
% Input:     La matrice tridiagonale simmetrica B
%            v_mode = 1 <==> Stampa a video ulteriori informazioni
%            g_mode = 1 <==> Stampa a video il grafico del polinomio caratteristico
% Output:    Il polinomio caratteristico p (oggetto inline)
%
% Esposito Gianluca (N.Matr.056/100858)

function [p] = tds_pc(B,v_mode,g_mode)

% Controlla che la matrice B sia quadrata
[row,col] = size(B);
if (row ~= col)
   fprintf(' Impossibile proseguire: matrice non quadrata\n');
   return
end
n = row;
eps_value = eeps;

% Controlla che la matrice sia tridiagonale
for i = 1 : n
   for j = 1 : n
      if (abs(i-j) > 1)
         if (abs(B(i,j)) >= eps_value)
            fprintf(' Impossibile proseguire: matrice non tridiagonale\n');
            return
         end
      end
   end
end

% Controlla che la matrice sia simmetrica
for i = 1 : n-1
   j = i+1;
   if (abs(B(i,j)-B(j,i)) >= eps_value)
      fprintf(' Impossibile proseguire: matrice non simmetrica\n');
      return
   end
end

p0 = sprintf('1');
p1 = sprintf('(x - %.14f)', B(1,1));

if (v_mode == 1)
   fprintf('%5s %s\n','p0','1');
   fprintf('%5s %s\n','p1',p1);
end

f1_temp = inline(p1);

for i = 2 : n
   temp1 = sprintf('(x - %.14f)', B(i,i));
   temp1 = strcat(temp1, ' * ');
   temp1 = strcat(temp1, ' ( ');
   temp1 = strcat(temp1,p1);
   temp1 = strcat(temp1, ' ) ');
   
   temp2 = sprintf('(%.14f)',B(i-1,i)^2);
   temp2 = strcat(temp2, ' * ');
   temp2 = strcat(temp2, ' ( ');
   temp2 = strcat(temp2,p0);
   temp2 = strcat(temp2, ' ) ');
   p2 = strcat(temp1, ' - ');
   p2 = strcat(p2,temp2);
   
   if (v_mode == 1)
      tmp = sprintf('p%d',i);
      fprintf('%5s %s\n',tmp,p2);
   end

   f2_temp = inline(p2);
   
   p0 = p1;
   p1 = p2;
end
p = inline(p2);

if (g_mode == 1)
   hold on;
   grid on;
   title('Grafico del Polinomio Caratteristico');
   xlabel('x');
   ylabel('p(x)');
   [a0,b0] = gersch_abs(B);
   fplot(p, [a0-1 b0+1]);
end


