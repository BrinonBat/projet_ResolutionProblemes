%Gecode 6.1.1

array [1..36] of var 1..36: cells; %position de chaque valeur: example: cells[18] = position dans la grille du numero 18
% cad si cells[18] = 5 alors le 18 ce trouve a la case 5

/* numerotation des cellules
       / \ / \ / \ / \ 
      | 1 | 2 | 3 | 4 |
     / \ / \ / \ / \ / \
    | 18| 19| 20| 21| 5 |
   / \ / \ / \ / \ / \ / \
  | 17| 30| 31| 32| 22| 6 |
 / \ / \ / \ /X\ / \ / \ / \
| 16| 29| 36|XXX| 33| 23| 7 |
 \ / \ / \ / \X/ \ / \ / \ / 
  | 15| 28| 35| 34| 24| 8 |
   \ / \ / \ / \ / \ / \ /
    | 14| 27| 26| 25| 9 |
     \ / \ / \ / \ / \ /
      | 13| 12| 11| 10| 
       \ / \ / \ / \ /       
*/

include "alldifferent.mzn";
constraint alldifferent(cells);


array [1..36] of set of int: neighbors = [
{2, 18, 19},
{1, 3, 19, 20},
{2, 4, 20, 21},
{3, 21, 5},
{4, 21, 22, 6},
{5, 22, 23, 7},
{6, 23, 8},
{7, 23, 24 ,9},
{8, 24, 25, 10},
{9, 25, 11},
{10, 25, 26, 12},
{11, 26, 27, 13},
{12, 27, 14},
{13, 27, 28, 15},
{14, 28, 29, 16},
{15, 29, 17},
{16, 29, 30, 18},
{17, 30, 19, 1},
{1, 2, 20, 31, 30, 18},
{2, 3, 21, 32, 31, 19},
{3, 4, 5, 22, 32, 20},
{21, 5, 6, 23, 33, 32},
{22, 6, 7, 8, 24, 33},
{33, 23, 8, 9, 25, 34},
{34, 24, 9, 10, 11, 26},
{35, 34, 25, 11, 12, 27},
{28, 35, 26, 12, 13, 14},
{29, 36, 35, 27, 14, 15},
{17, 30, 36, 28, 15, 16},
{18, 19, 31, 36, 29, 17},
{19, 20, 32, 36, 30},
{20, 21, 22, 33, 31},
{32, 22, 23, 24, 34},
{33, 24, 25, 26, 35},
{36, 34, 26, 27, 28},
{30, 31, 35, 28, 29},
];


%les valeurs deja rempli dans la grille
%constraint cells[numero] = sa position dans la grille
constraint cells[36] = 2;
constraint cells[1] = 4;
constraint cells[22] = 19;
constraint cells[5] = 22;
constraint cells[25] = 36;
constraint cells[19] = 33;
constraint cells[8] = 7;
constraint cells[11] = 8;
constraint cells[14] = 25;
constraint cells[28] = 12;

constraint forall(x in 1..35)(
  cells[x] in neighbors[cells[x+1]]
);