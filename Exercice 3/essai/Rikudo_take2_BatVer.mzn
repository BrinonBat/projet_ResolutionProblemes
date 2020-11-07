/* numerotation des cellules
       / \ / \ / \ / \ 
      | 1 | 2 | 3 | 4 |
     / \ / \ / \ / \ / \
    | 5 | 6 | 7 | 8 | 9 |
   / \ / \ / \ / \ / \ / \
  | 10| 11| 12| 13| 14| 15|
 / \ / \ / \ /X\ / \ / \ / \
| 16| 17| 18|XXX| 19| 20| 21|
 \ / \ / \ / \X/ \ / \ / \ / 
  | 22| 23| 24| 25| 26| 27|
   \ / \ / \ / \ / \ / \ /
    | 28| 29| 30| 31| 32|
     \ / \ / \ / \ / \ /
      | 33| 34| 35| 36| 
       \ / \ / \ / \ /       
*/
array [1..36] of var 1..36: cells;

%ajout de constantes pour une meilleure lisibilité du code
array [1..7] of 1..36:FinDeLigne=[4,9,15,21,27,32,36];
int : TailleL1et7=4;
int : TailleL2et6=5;
int : TailleL345=6;

%tableaux listant les liens forcés entre les cellules 

array[1..11] of bool: linksL1;
array[1..14] of bool: linksL2;
array[1..17] of bool: linksL3;
array[1..17] of bool: linksL4;
array[1..15] of bool: linksL5;
array[1..12] of bool: linksL6;
array[1..4] of bool: linksL7;

/* contraintes */

%chaque cellule est différente
include "alldifferent.mzn";
constraint alldifferent(cells);

%contraintes de liens forcés

%contraines de valeurs en fonction des voisins et des liens

%ligne 1
  %cas supérieur
  constraint forall(x in 1..FinDeLigne[1])( % chaque élément de la ligne doit avoir au moin un supérieur à côté
    %cas de liens obligatoires
    if(linksL1[(x-1)*3+1]) then (cells[x]=cells[x+TailleL1et7]+1 \/ cells[x]=cells[x+TailleL1et7]-1)else true endif /\ % en bas à gauche
    if(linksL1[(x-1)*3+2]) then (cells[x]=cells[x+TailleL1et7+1]+1 \/ cells[x]=cells[x+TailleL1et7]-1)else true endif /\ % en bas à droite
    if(x!=FinDeLigne[1] /\ linksL1[(x-1)*3+3]) then (cells[x]=cells[x+1]+1 \/ cells[x]=cells[x+1]-1)else true endif /\ 
    
    (%cas où il n'y a pas de liens obligatoires   
    if(cells[x]!=36) then( % cas du voisin supérieur
    cells[x]=cells[x+TailleL1et7]+1 \/
    cells[x]=cells[x+TailleL1et7+1]+1 \/
    if(x!=FinDeLigne[1]) then cells[x]=cells[x+1]+1 else false endif \/ % à droite
    if(x!=1) then cells[x]=cells[x-1]+1 else false endif) % à gauche
    else true endif 
    /\ 
    if (cells[x]!=1) then( % cas du voisin inférieur
    cells[x]=cells[x+TailleL1et7]-1 \/
    cells[x]=cells[x+TailleL1et7+1]-1 \/
    if(x!=FinDeLigne[1]) then cells[x]=cells[x+1]-1 else false endif \/ % à droite
    if(x!=1) then cells[x]=cells[x-1]-1 else false endif) % à gauche
    else true endif)
  );  
  
%ligne 2
  constraint forall(x in (FinDeLigne[1]+1)..FinDeLigne[2])( %on traite chaque élément de la ligne
  
    %cas de liens obligatoires
    if(linksL2[(x-(FinDeLigne[1]+1))*3+1]) then (cells[x]=cells[x+TailleL2et6]+1 \/ cells[x]=cells[x+TailleL2et6]-1) else true endif /\ % en bas à gauche
    if(linksL2[(x-(FinDeLigne[1]+1))*3+2]) then (cells[x]=cells[x+TailleL2et6+1]+1 \/ cells[x]=cells[x+TailleL2et6+1]-1) else true endif /\ % en bas à droite
    if(linksL2[(x-(FinDeLigne[1]+1))*3+3] /\ x!=FinDeLigne[2]) then (cells[x]=cells[x+1]+1 \/ cells[x]=cells[x+1]-1) else true endif /\ % à droite
    
    (%cas où il n'y a pas de liens obligatoires   
    if(cells[x]!=36) then( % cas du voisin supérieur
    cells[x]=cells[x+TailleL2et6]+1 \/ cells[x]=cells[x-TailleL1et7]+1 \/
    cells[x]=cells[x+TailleL2et6+1]+1 \/ cells[x]=cells[x-(TailleL1et7+1)]+1 \/
    if(x!=FinDeLigne[2]) then cells[x]=cells[x+1]+1 else false endif \/ % à droite
    if(x!=FinDeLigne[1]+1) then cells[x]=cells[x-1]+1 else false endif) % à gauche
    else true endif 
    /\ 
    if (cells[x]!=1) then( % cas du voisin inférieur
    cells[x]=cells[x+TailleL2et6]-1 \/ cells[x]=cells[x-TailleL1et7]-1 \/
    cells[x]=cells[x+TailleL2et6+1]-1 \/ cells[x]=cells[x-(TailleL1et7+1)]-1 \/
    if(x!=FinDeLigne[2]) then cells[x]=cells[x+1]-1 else false endif \/ % à droite
    if(x!=FinDeLigne[1]+1) then cells[x]=cells[x-1]-1 else false endif) % à gauche
    else true endif)
  );
  
%ligne 3
  %on traite la première moitié de la ligne
  constraint forall(x in FinDeLigne[2]+1..12)(
    %cas de liens obligatoires
    if(linksL3[(x-(FinDeLigne[2]+1))*3+1]) then (cells[x]=cells[x+TailleL345]+1 \/ cells[x]=cells[x+TailleL345]-1) else true endif /\ % en bas à gauche
    if(linksL3[(x-(FinDeLigne[2]+1))*3+2] /\ x!=12) then (cells[x]=cells[x+TailleL345+1]+1 \/ cells[x]=cells[x+TailleL345+1]-1) else true endif /\ % en bas à droite
    if(linksL3[(x-(FinDeLigne[2]+1))*3+3]) then (cells[x]=cells[x+1]+1 \/ cells[x]=cells[x+1]-1) else true endif /\ % à droite
    
    (%cas où il n'y a pas de liens obligatoires
    cells[x]=cells[x+TailleL345]+1 \/ cells[x]=cells[x+TailleL345]-1 \/ % en bas à gauche
    if(x!=12) then cells[x]=cells[x+TailleL345+1]+1 \/ cells[x]=cells[x+TailleL345+1]-1 else false endif \/ % en bas à droite
    cells[x]=cells[x+1]+1 \/ cells[x]=cells[x+1]-1)% à droite
  );
  %on traite la deuxieme moitié de la ligne
  constraint forall(x in 13..FinDeLigne[3])(
    %cas de liens obligatoires
    if(linksL3[(x-(FinDeLigne[2]+1))*3+1]) then (cells[x]=cells[x+TailleL345]+1 \/ cells[x]=cells[x+TailleL345]-1) else true endif /\ % en bas à droite
    if(linksL3[(x-(FinDeLigne[2]+1))*3+2] /\ x!=13) then (cells[x]=cells[x+TailleL345-1]+1 \/ cells[x]=cells[x+TailleL345-1]-1) else true endif /\ % en bas à gauche
    if(linksL3[(x-(FinDeLigne[2]+1))*3+3]) then (cells[x]=cells[x+1]+1 \/ cells[x]=cells[x+1]-1) else true endif /\ % à droite
    (%cas où il n'y a pas de liens obligatoires
    cells[x]=cells[x+TailleL345]+1 \/ cells[x]=cells[x+TailleL345-1]-1 \/ % en bas à gauche
    if(x!=12) then cells[x]=cells[x+TailleL345-1]+1 \/ cells[x]=cells[x+TailleL345]-1 else false endif \/ % en bas à droite
    if(x!=FinDeLigne[3]) then cells[x]=cells[x+1]+1 \/ cells[x]=cells[x+1]-1 else false endif) % à droite
  );

%ligne 4
  %on traite la première moitié de la ligne
  constraint forall(x in FinDeLigne[3]+1..18)(
    %cas de liens obligatoires
    if(linksL4[(x-(FinDeLigne[3]+1))*3+1]) then (cells[x]=cells[x+TailleL345]+1 \/ cells[x]=cells[x+TailleL345]-1) else true endif /\ % en bas à droite
    if(linksL4[(x-(FinDeLigne[3]+1))*3+2]) then (cells[x]=cells[x+TailleL345-1]+1 \/ cells[x]=cells[x+TailleL345-1]-1) else true endif /\ % en bas à gauche
    if(linksL4[(x-(FinDeLigne[3]+1))*3+3] /\ x!=18) then (cells[x]=cells[x+1]+1 \/ cells[x]=cells[x+1]-1) else true endif /\ % à droite
    (%cas où il n'y a pas de liens obligatoires
    cells[x]=cells[x+TailleL345]+1 \/ cells[x]=cells[x+TailleL345]-1 \/ % en bas à droite
    if(x!=18) then cells[x]=cells[x+TailleL345-1]+1 \/ cells[x]=cells[x+TailleL345-1]-1 else false endif \/ % en bas à gauche
    if(x!=18) then cells[x]=cells[x+1]+1 \/ cells[x]=cells[x+1]-1 else false endif)% à droite
  );
  %on traite la deuxieme moitié de la ligne
  constraint forall(x in 19..FinDeLigne[4])(
    %cas de liens obligatoires
    if(linksL4[(x-(FinDeLigne[3]+1))*3+1]) then (cells[x]=cells[x+TailleL345]+1 \/ cells[x]=cells[x+TailleL345]-1) else true endif /\ % en bas à gauche
    if(linksL4[(x-(FinDeLigne[3]+1))*3+2] /\ x!=FinDeLigne[4]) then (cells[x]=cells[x+TailleL345+1]+1 \/ cells[x]=cells[x+TailleL345+1]-1) else true endif /\ % en bas à droite
    if(linksL4[(x-(FinDeLigne[3]+1))*3+3] /\ x!=FinDeLigne[4]) then (cells[x]=cells[x+1]+1 \/ cells[x]=cells[x+1]-1) else true endif /\ % à droite
    (%cas où il n'y a pas de liens obligatoires
    cells[x]=cells[x+TailleL345]+1 \/ cells[x]=cells[x+TailleL345]-1 \/ % en bas à gauche
    if(x!=FinDeLigne[4]) then cells[x]=cells[x+TailleL345+1]+1 \/ cells[x]=cells[x+TailleL345+1]-1 else false endif \/ % en bas à droite
    if(x!=FinDeLigne[4]) then cells[x]=cells[x+1]+1 \/ cells[x]=cells[x+1]-1 else false endif) % à droite
  );



%ligne 5
  constraint forall(x in (FinDeLigne[4]+1)..FinDeLigne[5])( %on traite chaque élément de la ligne
    %cas de liens obligatoires
    if(linksL5[(x-(FinDeLigne[4]+1))*3+1]) then (cells[x]=cells[x+TailleL2et6]+1 \/ cells[x]=cells[x+TailleL2et6]-1) else true endif /\ % en bas à gauche
    if(linksL5[(x-(FinDeLigne[4]+1))*3+2] /\ x!=FinDeLigne[5]) then (cells[x]=cells[x+TailleL2et6+1]+1 \/ cells[x]=cells[x+TailleL2et6+1]-1) else true endif /\ % en bas à droite
    if(linksL5[(x-(FinDeLigne[4]+1))*3+3] /\ x!=FinDeLigne[5]) then (cells[x]=cells[x+1]+1 \/ cells[x]=cells[x+1]-1) else true endif /\ % à droite
    (%cas où il n'y a pas de liens obligatoires
    cells[x]=cells[x+TailleL2et6]+1 \/ cells[x]=cells[x+TailleL2et6]-1 \/ % en bas à gauche
    if(x!=FinDeLigne[5]) then cells[x]=cells[x+TailleL2et6+1]+1 \/ cells[x]=cells[x+TailleL2et6+1]-1 else false endif \/ % en bas à droite
    if(x!=FinDeLigne[5]) then cells[x]=cells[x+1]+1 \/ cells[x]=cells[x+1]-1 else false endif) % à droite
  );
  
%ligne 6
  constraint forall(x in (FinDeLigne[5]+1)..FinDeLigne[6])( %on traite chaque élément de la ligne
    %cas de liens obligatoires
    if(linksL6[(x-(FinDeLigne[5]+1))*3+1]) then (cells[x]=cells[x+TailleL1et7]+1 \/ cells[x]=cells[x+TailleL1et7]-1) else true endif /\ % en bas à gauche
    if(linksL6[(x-(FinDeLigne[5]+1))*3+2] /\ x!=FinDeLigne[6]) then (cells[x]=cells[x+TailleL1et7+1]+1 \/ cells[x]=cells[x+TailleL1et7+1]-1) else true endif /\ % en bas à droite
    if(linksL6[(x-(FinDeLigne[5]+1))*3+3] /\ x!=FinDeLigne[6]) then (cells[x]=cells[x+1]+1 \/ cells[x]=cells[x+1]-1) else true endif /\ % à droite
    (%cas où il n'y a pas de liens obligatoires
    cells[x]=cells[x+TailleL1et7]+1 \/ cells[x]=cells[x+TailleL1et7]-1 \/ % en bas à gauche
    if(x!=FinDeLigne[6]) then cells[x]=cells[x+TailleL1et7+1]+1 \/ cells[x]=cells[x+TailleL1et7+1]-1 else false endif \/ % en bas à droite
    if(x!=FinDeLigne[6]) then cells[x]=cells[x+1]+1 \/ cells[x]=cells[x+1]-1 else false endif) % à droite
  );
/*
%ligne 7
  constraint forall(x in (FinDeLigne[6]+1)..FinDeLigne[7])( %on traite chaque élément de la ligne
    %cas de liens obligatoires
    if(linksL7[(x-(FinDeLigne[6]+1))+1] /\ x!=FinDeLigne[7]) then (cells[x]=cells[x+1]+1 \/ cells[x]=cells[x+1]-1) else true endif /\ % à droite
    (%cas où il n'y a pas de liens obligatoires
    if(x!=FinDeLigne[7]) then cells[x]=cells[x+1]+1 \/ cells[x]=cells[x+1]-1 else true endif) % à droite
  );
*/
%ligne 7 bis
  constraint forall(x in (FinDeLigne[6]+1)..FinDeLigne[7])( %on traite chaque élément de la ligne
    cells[x]=cells[x-TailleL1et7]+1 \/ cells[x]=cells[x-TailleL1et7]-1\/ % en bas à gauche
    cells[x]=cells[x-TailleL1et7-1]+1 \/ cells[x]=cells[x-TailleL1et7]-1\/ % en bas à droite
    if(x!=FinDeLigne[6]+1) then (cells[x]=cells[x-1]+1 \/ cells[x]=cells[x-1]-1) else false endif % à droite     
  );

solve satisfy;

output["       / \\ / \\ / \\ / \\ \n"]++
      ["      | "++show_int(2,cells[1])++"| "++show_int(2,cells[2])++"| "++show_int(2,cells[3])++"| "++show_int(2,cells[4])++"| \n"]++
      ["     / \\ / \\ / \\ / \\ / \\ \n"]++
      ["    | "++show_int(2,cells[5])++"| "++show_int(2,cells[6])++"| "++show_int(2,cells[7])++"| "++show_int(2,cells[8])++"| "++show_int(2,cells[9])++"| \n"]++
      ["   / \\ / \\ / \\ / \\ / \\ / \\ \n"]++
      ["  | "++show_int(2,cells[10])++"| "++show_int(2,cells[11])++"| "++show_int(2,cells[12])++"| "++show_int(2,cells[13])++"| "++show_int(2,cells[14])++"| "++show_int(2,cells[15])++"| \n"]++
      [" / \\ / \\ / \\ / \\ / \\ / \\ / \\ \n"]++
      ["| "++show_int(2,cells[16])++"| "++show_int(2,cells[17])++"| "++show_int(2,cells[18])++"|   | "++show_int(2,cells[19])++"| "++show_int(2,cells[20])++"| "++show_int(2,cells[21])++"| \n"]++
      [" \\ / \\ / \\ / \\ / \\ / \\ / \\ / \n"]++
      ["  | "++show_int(2,cells[22])++"| "++show_int(2,cells[23])++"| "++show_int(2,cells[24])++"| "++show_int(2,cells[25])++"| "++show_int(2,cells[26])++"| "++show_int(2,cells[27])++"| \n"]++
      ["   \\ / \\ / \\ / \\ / \\ / \\ / \n"]++
      ["    | "++show_int(2,cells[28])++"| "++show_int(2,cells[29])++"| "++show_int(2,cells[30])++"| "++show_int(2,cells[31])++"| "++show_int(2,cells[32])++"| \n"]++
      ["     \\ / \\ / \\ / \\ / \\ / \n"]++
      ["      | "++show_int(2,cells[33])++"| "++show_int(2,cells[34])++"| "++show_int(2,cells[35])++"| "++show_int(2,cells[36])++"| \n"]++
      ["       \\ / \\ / \\ / \\ / \n"]
;


