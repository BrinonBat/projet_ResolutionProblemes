%Gecode 6.1.1
%to be used with data.dzn

int: num_rempli;%nombre de cases deja rempli
array[1..num_rempli, 1..2] of int: rempli;


int: num_liens;%nombre de liens obligatoire
array[1..num_liens, 1..2] of int: liens;


array [1..36] of var 1..36: cells; %position de chaque valeur: example: cells[18] = position dans la grille du numero 18
% cad si cells[18] = 5 alors le 18 se trouve a la case 5


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

include "alldifferent.mzn";
constraint alldifferent(cells);

%liste d'adjacence du 'graphe' de rikudo
array [1..36] of set of int: neighbors = [
{2, 5, 6},
{1, 3, 6, 7},
{2, 4, 7, 8},
{3, 8, 9},
{10, 11, 6, 1},
{1, 2, 7, 12, 11, 5},
{2, 3, 8, 13, 12, 6},
{3, 4, 9, 14, 13, 7},
{4, 8, 14, 15},
{16, 17, 11, 5},
{5, 6, 12, 18, 17, 10},
{6, 7, 13, 18, 11},
{7, 8, 14, 19, 12},
{8, 9, 15, 20, 19, 13},
{9, 14, 20, 21},
{22, 17, 10},
{10, 11, 18, 23, 22, 16},
{11, 12, 24, 23, 17},
{13, 14, 20, 26, 25},
{14, 15, 21, 27, 26, 19},
{15, 20, 27},
{28, 23, 17, 16},
{17, 18, 24, 29, 28, 22},
{18, 25, 30, 29, 23},
{19, 26, 31, 30, 24},
{19, 20, 27, 32, 31, 25},
{21, 20, 26 ,32},
{33, 29, 23, 22},
{23, 24, 30, 34, 33, 28},
{24, 25, 31, 35, 34, 29},
{25, 26, 32, 36, 35, 30},
{27, 26, 31, 36},
{34, 29, 28},
{35, 30, 29, 33},
{36, 31, 30, 34},
{32, 31, 35},
];

%chaque cellule doit etre le voisin de son supérieur (sauf 36 mais si 35 est voisin de 36 alors c'est bon)
constraint forall(x in 1..35)(
  cells[x] in neighbors[cells[x+1]]
);

%definir les cellules deja remplis
constraint forall(r in 1..num_rempli)(
  cells[rempli[r, 1]] = rempli[r, 2]
);


%definir les liens obligatoire
%lien obligatoire entre liens[lien, 1] et liens[lien, 2]
constraint forall(lien in 1..num_liens)(
  forall(x in 1..36 where cells[x]=liens[lien, 1])(
    forall(y in 1..36 where cells[y]=liens[lien, 2])(
      (x = y+1) \/ (x = y-1)
    )
  )
);



%display[x] = l'indice de x dans 'cells'; pour faciliter l'affichage
array [1..36] of var 1..36: display;

constraint forall(x in 1..36)(
  forall(y in 1..36 where cells[y] = x)(
    display[x] = y
  )
);

solve satisfy;

%affichage
output["       / \\ / \\ / \\ / \\ \n"]++
      ["      | "++show_int(2,display[1])++"| "++show_int(2,display[2])++"| "++show_int(2,display[3])++"| "++show_int(2,display[4])++"| \n"]++
      ["     / \\ / \\ / \\ / \\ / \\ \n"]++
      ["    | "++show_int(2,display[5])++"| "++show_int(2,display[6])++"| "++show_int(2,display[7])++"| "++show_int(2,display[8])++"| "++show_int(2,display[9])++"| \n"]++
      ["   / \\ / \\ / \\ / \\ / \\ / \\ \n"]++
      ["  | "++show_int(2,display[10])++"| "++show_int(2,display[11])++"| "++show_int(2,display[12])++"| "++show_int(2,display[13])++"| "++show_int(2,display[14])++"| "++show_int(2,display[15])++"| \n"]++
      [" / \\ / \\ / \\ / \\ / \\ / \\ / \\ \n"]++
      ["| "++show_int(2,display[16])++"| "++show_int(2,display[17])++"| "++show_int(2,display[18])++"|   | "++show_int(2,display[19])++"| "++show_int(2,display[20])++"| "++show_int(2,display[21])++"| \n"]++
      [" \\ / \\ / \\ / \\ / \\ / \\ / \\ / \n"]++
      ["  | "++show_int(2,display[22])++"| "++show_int(2,display[23])++"| "++show_int(2,display[24])++"| "++show_int(2,display[25])++"| "++show_int(2,display[26])++"| "++show_int(2,display[27])++"| \n"]++
      ["   \\ / \\ / \\ / \\ / \\ / \\ / \n"]++
      ["    | "++show_int(2,display[28])++"| "++show_int(2,display[29])++"| "++show_int(2,display[30])++"| "++show_int(2,display[31])++"| "++show_int(2,display[32])++"| \n"]++
      ["     \\ / \\ / \\ / \\ / \\ / \n"]++
      ["      | "++show_int(2,display[33])++"| "++show_int(2,display[34])++"| "++show_int(2,display[35])++"| "++show_int(2,display[36])++"| \n"]++
      ["       \\ / \\ / \\ / \\ / \n"]
;





















