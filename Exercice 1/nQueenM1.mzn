include "alldifferent.mzn";

%Paramètre
int : n;
%Variable
set of int : m = 1..n;
array[m] of var int : PosLigne;
array[m] of var int : PosColonne;


%Contrainte
constraint forall(i in m)(PosLigne[i] > 0 /\ PosLigne[i] <= n);
constraint forall(i in m)(PosColonne[i] > 0 /\ PosColonne[i] <= n);

%constraint PosColonne[1] <= (n+1) div 2 ;
constraint forall(i in m)(PosLigne[i] = i );


constraint alldifferent(PosColonne);
constraint forall(i,j in m where i!= j)(PosLigne[i]+PosColonne[i] != PosLigne[j]+PosColonne[j]);
constraint forall(i,j in m where i!= j)(PosColonne[i]-PosLigne[i] != PosColonne[j]-PosLigne[j]);

solve satisfy ;
