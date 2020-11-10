%Gecode 6.1.1[built-in]

include "alldifferent.mzn";
include "lex_lesseq.mzn";

int: n;
array [1..n, 1..n] of var bool: damier; %Vrai s'il y a une reine sur la case

constraint forall (l in (1..n))(
  exists(damier[l, 1..n]) %minimum 1 reine par ligne //exists: disjonction cummulé sur un array
);

constraint forall (l in (1..n))(
  forall (i, j in 1..n where i != j ) (
    (damier[l, i] /\ damier[l, j]) = false %maximum 1 reine par ligne
  )
);


constraint forall (c in (1..n))(
  exists(damier[1..n, c]) %au moins 1 reine par colonne
);

constraint forall (c in (1..n))(
  forall (i, j in 1..n where i != j ) (
    (damier[i, c] /\ damier[j, c]) = false %maximum 1 reine par colonne
  )
);



constraint forall (x, y in (1..n) where damier[x, y] = true)( %pour chaque cellule avec une reine
  forall(p, q in (1..n) where ((p != x) \/ (q != y)))( %pour chaque autre cellue different de [x,y]
    ((abs(p-x) = abs(q-y)) -> (damier[p, q] = false)) %s'ils partagent un diagonale alors [p,q] faux
  )
);


% Lexicographic symmetry breaking constraints
constraint
    lex_lesseq(array1d(damier), [ damier[j,i] | i,j in 1..n ])
/\  lex_lesseq(array1d(damier), [ damier[i,j] | i in reverse(1..n), j in 1..n ]) % Enlevement des symétries horizontales par rapport à l'axe médian du damier .
/\  lex_lesseq(array1d(damier), [ damier[j,i] | i in 1..n, j in reverse(1..n) ]) % Rotation plateau et suppresion des symétries verticales par rapport à l'axe médian du damier .
/\  lex_lesseq(array1d(damier), [ damier[j,i] | i in reverse(1..n), j in 1..n ])% Rotation du plateau et suppresion des symétries verticales
/\  lex_lesseq(array1d(damier), [ damier[j,i] | i,j in reverse(1..n) ])%Rotation du plateau et suppresion des symétries horizontales

;



solve satisfy;

output [ if fix(damier[i, j]) then "Q " else ". " endif ++
         if j == n then "\n" else "" endif | i,j in 1..n]
