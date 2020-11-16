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

constraint PosColonne[1] <= (n+1) div 2 ;
constraint forall(i in m)(PosLigne[i] = i );


constraint alldifferent(PosColonne);
constraint forall(i,j in m where i!= j)(PosLigne[i]+PosColonne[i] != PosLigne[j]+PosColonne[j]);
constraint forall(i,j in m where i!= j)(PosColonne[i]-PosLigne[i] != PosColonne[j]-PosLigne[j]);

include "lex_lesseq.mzn";


array[1..n,1..n] of var bool: damier;

constraint forall (i,j in 1..n where i != j) ( damier[i,j] <-> (PosLigne[i]=i /\ PosColonne[i]=j) );

constraint
    lex_lesseq(array1d(damier), [ damier[j,i] | i,j in 1..n ])
/\  lex_lesseq(array1d(damier), [ damier[i,j] | i in reverse(1..n), j in 1..n ])
/\  lex_lesseq(array1d(damier), [ damier[j,i] | i in 1..n, j in reverse(1..n) ])
/\  lex_lesseq(array1d(damier), [ damier[j,i] | i in reverse(1..n), j in 1..n ])
/\  lex_lesseq(array1d(damier), [ damier[i,j] | i,j in reverse(1..n) ])
;

% search
solve satisfy;
output [ if fix(damier[i,j]) == true then "Q" else "." endif ++
        if j == n then "\n" else "" endif | i,j in 1..n]