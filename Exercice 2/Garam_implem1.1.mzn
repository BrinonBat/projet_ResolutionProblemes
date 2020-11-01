% phase de tests sur le carré de Garam suivant
/************
* 2 + _ = 5 *
* x * * * + *
* _ * * * 7 *
* = * * * = *
* 1 * * * _ *
* 6 - _ = _ *
*************/

% test de la 1ere modelisation (cf. notes.txt)

/* type de ope: ['add','sou','mul','divs'] 
******************************************
 mise en forme du garam :
    b     c
    v     v 
a > *******
    **   **
    **   **
d > *******
******************************************/

array[1..3] of var 0..9: a;
array[1..4] of var 0..9: b;
array[1..4] of var 0..9: c;
array[1..3] of var 0..9: d;


enum operator={add,sou,mul};
array[1..4] of operator: tabOp;

/*
array[4] of int: tabOp; % liste des operateurs dans l'ordre de lecture (haut en bas, gauche à droite)
1: add;
2: sou;
3: mul;
*/

/* contraintes de croisements de tableaux*/
constraint a[1]=b[1];
constraint a[3]=c[1];
constraint b[4]=d[1];
constraint c[4]=d[3];

/* contraintes d'operation */
constraint if(tabOp[1]==add) then a[1]+a[2]=a[3] 
  else (if(tabOp[1]==sou) then a[1]-a[2]=a[3] else a[1]*a[2]=a[3]endif)
  endif;

constraint if(tabOp[2]==add) then b[1]+b[2]=(b[3]*10+b[4]) 
  else (if(tabOp[2]==sou) then b[1]-b[2]=(b[3]*10+b[4]) else b[1]*b[2]=(b[3]*10+b[4])endif)
  endif;

constraint if(tabOp[3]==add) then c[1]+c[2]=(c[3]*10+c[4]) 
  else (if(tabOp[3]==sou) then c[1]-c[2]=(c[3]*10+c[4]) else c[1]*c[2]=(c[3]*10+c[4])endif)
  endif;

constraint if(tabOp[4]==add) then d[1]+d[2]=d[3] 
  else (if(tabOp[4]==sou) then d[1]-d[2]=d[3] else d[1]*d[2]=d[3]endif)
  endif;   
      
solve satisfy;
/*
output  ["\n a :"]++["\(resa) "| resa in a]
      ++["\n b :"]++["\(resb) "| resb in b]
      ++["\n c :"]++["\(resc) "| resc in c]
      ++["\n d :"]++["\(resd) "| resd in d]
      ;
      */
output [" \(a[1]) \(tabOp[1]) \(a[2]) = \(a[3]) \n"]++
       ["\(tabOp[2])       \(tabOp[3]) \n"]++
       [" \(b[2])         \(c[2]) \n"]++
       [" =         = \n"]++
       [" \(b[3])         \(c[3]) \n"]++
       [" \(d[1]) \(tabOp[4]) \(d[2]) = \(d[3]) \n"];