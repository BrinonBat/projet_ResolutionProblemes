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

/* type de ope: ['add','sous','mul','divs'] 
******************************************
 mise en forme du garam :
    b     c
    v     v 
a > *******
    **   **
    **   **
d > *******
******************************************/

array[3] of var 0..9: a;
array[4] of var 0..9: b;
array[4] of var 0..9: c;
array[3] of var 0..9: d;


enum operator={add,sous,mul};
array[4] of operator: tabOp;

/*
array[4] of int: tabOp; % liste des operateurs dans l'ordre de lecture (haut en bas, gauche à droite)
1: add;
2: sous;
3: mul;
*/
/* remplissage */
constraint tabOp=[add,mul,add,sous];
constraint a[1]=2;
constraint a[3]=5;
constraint c[2]=7;
constraint b[3]=1;
constraint b[4]=6;

/* contraintes de croisements de tableaux*/
constraint a[1]=b[1];
constraint a[3]=c[1];
constraint b[4]=d[1];
constraint c[4]=d[3];

/* contraintes d'operation */
constraint if(tabOp[1]==add) then a[1]+a[2]=a[3] 
  else (if(tabOp[1]==sous) then a[1]-a[2]=a[3] else a[1]*a[2]=a[3]endif)
  endif;

constraint if(tabOp[2]==add) then b[1]+b[2]=(b[3]*10+b[4]) 
  else (if(tabOp[2]==sous) then b[1]-b[2]=(b[3]*10+b[4]) else b[1]*b[2]=(b[3]*10+b[4])endif)
  endif;
   
constraint if(tabOp[3]==add) then c[1]+c[2]=(c[3]*10+c[4]) 
  else (if(tabOp[3]==sous) then c[1]-c[2]=(c[3]*10+c[4]) else c[1]*c[2]=(c[3]*10+c[4])endif)
  endif;
     
constraint if(tabOp[4]==add) then d[1]+d[2]=d[3] 
  else (if(tabOp[4]==sous) then d[1]-d[2]=d[3] else d[1]*d[2]=d[3]endif)
  endif;   
      
solve satisfy;
