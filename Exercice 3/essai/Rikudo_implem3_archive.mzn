/* numerotation des cellules
       / \ / \ / \ / \ 
      |1,0|1,1|1,2|1,3|
     / \ / \ / \ / \ / \
    |2,0|2,1|2,2|2,3|2,4|
   / \ / \ / \ / \ / \ / \
  |3,0|3,1|3,2|3,3|3,4|3,5|
 / \ / \ / \ /X\ / \ / \ / \
|4,0|4,1|4,2|XXX|4,3|4,4|4,5|
 \ / \ / \ / \X/ \ / \ / \ / 
  |5,0|5,1|5,2|5,3|5,4|5,5|
   \ / \ / \ / \ / \ / \ /
    |6,0|6,1|6,2|6,3|6,4|
     \ / \ / \ / \ / \ /
      |7,0|7,1|7,2|7,3| 
       \ / \ / \ / \ /       
*/
array[1..7,0..5] of var 1..48: grille;

/* /!\ problème lors de la modélisation, car le alldifferent inclus les cases de la matrice qui sont ignorées dans le Garham */

/* tableaux listant les liens forcés entre les cellules  */
array[1..11] of bool: linksL1;
array[1..14] of bool: linksL2;
array[1..18] of bool: linksL3;
array[1..22] of bool: linksL4;
array[1..15] of bool: linksL5;
array[1..12] of bool: linksL6;
array[1..4] of bool: linksL7; 

/******************* contraintes **********************/

%chaque cellule est différente

include "alldifferent.mzn";
constraint alldifferent(grille[1..2,0..5]);

%contraintes de valeurs en fonction des voisins pour chaque ligne

%ligne 1
  constraint forall(x in 0..2)( %on traite chaque élément qui n'est pas la bordure droite
    %cas de liens obligatoires
    if(linksL1[x*3+1]) then grille[1,x]=grille[2,x]+1 \/ grille[1,x]=grille[2,x]-1
    else (if (linksL1[x*3+2]) then grille[1,x]=grille[2,x+1]+1 \/ grille[1,x]=grille[2,x+1]-1
    else (if (linksL1[x*3+3]) then grille[1,x]=grille[1,x+1]+1 \/ grille[1,x]=grille[1,x+1]-1
    %cas où il n'y a pas de liens obligatoires
    else (
    grille[1,x]=grille[2,x]+1 \/ grille[1,x]=grille[2,x]-1 \/
    grille[1,x]=grille[2,x+1]+1 \/ grille[1,x]=grille[2,x+1]-1 \/
    grille[1,x]=grille[1,x+1]+1 \/ grille[1,x]=grille[1,x+1]-1
    )endif)endif)endif
  );
  
  %traitement de la bordure droite
  constraint if(linksL1[10]) then grille[1,3]=grille[2,3]+1 \/ grille[1,3]=grille[2,3]-1
    else (if (linksL1[11]) then grille[1,3]=grille[2,3+1]+1 \/ grille[1,3]=grille[2,3+1]-1
    %cas où il n'y a pas de liens obligatoires
    else (
    grille[1,3]=grille[2,3]+1 \/ grille[1,3]=grille[2,3]-1 \/
    grille[1,3]=grille[2,3+1]+1 \/ grille[1,3]=grille[2,3+1]-1
    )endif
  )endif;
 
%ligne 2  
  constraint forall(x in 0..3)( %on traite chaque élément qui n'est pas la bordure droite
    %cas de liens obligatoires
    if(linksL2[x*3+1]) then grille[2,x]=grille[3,x]+1 \/ grille[2,x]=grille[3,x]-1
    else (if (linksL2[x*3+2]) then grille[2,x]=grille[3,x+1]+1 \/ grille[2,x]=grille[3,x+1]-1
    else (if (linksL2[x*3+3]) then grille[2,x]=grille[2,x+1]+1 \/ grille[2,x]=grille[2,x+1]-1
    %cas où il n'y a pas de liens obligatoires
    else (
    grille[2,x]=grille[3,x]+1 \/ grille[2,x]=grille[3,x]-1 \/
    grille[2,x]=grille[3,x+1]+1 \/ grille[2,x]=grille[3,x+1]-1 \/
    grille[2,x]=grille[2,x+1]+1 \/ grille[2,x]=grille[2,x+1]-1
    )endif)endif)endif
  );
  
  %traitement de la bordure droite
  constraint if(linksL2[13]) then grille[2,4]=grille[3,4]+1 \/ grille[2,4]=grille[3,4]-1
    else (if (linksL2[14]) then grille[2,4]=grille[3,4+1]+1 \/ grille[2,4]=grille[3,4+1]-1
    %cas où il n'y a pas de liens obligatoires
    else (
    grille[2,4]=grille[3,4]+1 \/ grille[2,4]=grille[3,4]-1 \/
    grille[2,4]=grille[3,4+1]+1 \/ grille[2,4]=grille[3,4+1]-1
    )endif
  )endif;
  
%ligne 3
  constraint forall(x in 0..4)( %on traite chaque élément qui n'est pas la bordure droite
    if(x<=2) then ( % gauche du creux central
      %cas de liens obligatoires 
      if(linksL3[x*3+1]) then grille[3,x]=grille[4,x]+1 \/ grille[3,x]=grille[4,x]-1 % bas gauche
      else (if (linksL3[x*3+2] /\ x!=2) then grille[3,x]=grille[4,x+1]+1 \/ grille[3,x]=grille[4,x+1]-1 % bas droit
      else (if (linksL3[x*3+3]) then grille[3,x]=grille[3,x+1]+1 \/ grille[3,x]=grille[3,x+1]-1 % droite
      %cas où il n'y a pas de liens obligatoires
      else (
      grille[3,x]=grille[4,x]+1 \/ grille[3,x]=grille[4,x]-1 \/ % bas gache
      if(x!=2) then (grille[3,x]=grille[4,x+1]+1 \/ grille[3,x]=grille[4,x+1]-1) endif \/ % bas droit
      grille[3,x]=grille[3,x+1]+1 \/ grille[3,x]=grille[3,x+1]-1 % droite
      )endif)endif)endif)
    else( % droite du creux central
      %cas de liens obligatoires 
      if(linksL3[x*3+1]) then grille[3,x]=grille[4,x]+1 \/ grille[3,x]=grille[4,x]-1 % bas droit
      else (if (linksL3[x*3+2] /\ x!=3) then grille[3,x]=grille[4,x-1]+1 \/ grille[3,x]=grille[4,x-1]-1 % bas gauche
      else (if (linksL3[x*3+3]) then grille[3,x]=grille[3,x+1]+1 \/ grille[3,x]=grille[3,x+1]-1 % droite
      %cas où il n'y a pas de liens obligatoires
      else (
      grille[3,x]=grille[4,x]+1 \/ grille[3,x]=grille[4,x]-1 \/
      if(x!=2) then (grille[3,x]=grille[4,x-1]+1 \/ grille[3,x]=grille[4,x-1]-1) endif \/
      if(x!=3) then (grille[3,x]=grille[3,x+1]+1 \/ grille[3,x]=grille[3,x+1]-1) endif
      )endif)endif)endif
    )endif
  );
  
  %traitement de la bordure droite
  constraint if(linksL3[17]) then grille[3,5]=grille[4,5]+1 \/ grille[3,5]=grille[4,5]-1
    else (if (linksL3[18]) then grille[3,5]=grille[4,5-1]+1 \/ grille[3,5]=grille[4,5-1]-1
    %cas où il n'y a pas de liens obligatoires
    else (
    grille[3,5]=grille[4,5]+1 \/ grille[3,5]=grille[4,5]-1 \/
    grille[3,5]=grille[4,5-1]+1 \/ grille[3,5]=grille[4,5-1]-1
    )endif
  )endif;

solve satisfy;