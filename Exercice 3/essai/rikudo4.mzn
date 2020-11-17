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

% 1  must be adjacent to 2
constraint cells[ 1 ] in neighbors[cells[ 2 ]];


% 2  must be adjacent to 3
constraint cells[ 2 ] in neighbors[cells[ 3 ]];


% 3  must be adjacent to 4
constraint cells[ 3 ] in neighbors[cells[ 4 ]];


% 4  must be adjacent to 5
constraint cells[ 4 ] in neighbors[cells[ 5 ]];


% 5  must be adjacent to 6
constraint cells[ 5 ] in neighbors[cells[ 6 ]];


% 6  must be adjacent to 7
constraint cells[ 6 ] in neighbors[cells[ 7 ]];


% 7  must be adjacent to 8
constraint cells[ 7 ] in neighbors[cells[ 8 ]];


% 8  must be adjacent to 9
constraint cells[ 8 ] in neighbors[cells[ 9 ]];


% 9  must be adjacent to 10
constraint cells[ 9 ] in neighbors[cells[ 10 ]];


% 10  must be adjacent to 11
constraint cells[ 10 ] in neighbors[cells[ 11 ]];


% 11  must be adjacent to 12
constraint cells[ 11 ] in neighbors[cells[ 12 ]];


% 12  must be adjacent to 13
constraint cells[ 12 ] in neighbors[cells[ 13 ]];


% 13  must be adjacent to 14
constraint cells[ 13 ] in neighbors[cells[ 14 ]];


% 14  must be adjacent to 15
constraint cells[ 14 ] in neighbors[cells[ 15 ]];


% 15  must be adjacent to 16
constraint cells[ 15 ] in neighbors[cells[ 16 ]];


% 16  must be adjacent to 17
constraint cells[ 16 ] in neighbors[cells[ 17 ]];


% 17  must be adjacent to 18
constraint cells[ 17 ] in neighbors[cells[ 18 ]];


% 18  must be adjacent to 19
constraint cells[ 18 ] in neighbors[cells[ 19 ]];


% 19  must be adjacent to 20
constraint cells[ 19 ] in neighbors[cells[ 20 ]];


% 20  must be adjacent to 21
constraint cells[ 20 ] in neighbors[cells[ 21 ]];


% 21  must be adjacent to 22
constraint cells[ 21 ] in neighbors[cells[ 22 ]];


% 22  must be adjacent to 23
constraint cells[ 22 ] in neighbors[cells[ 23 ]];


% 23  must be adjacent to 24
constraint cells[ 23 ] in neighbors[cells[ 24 ]];


% 24  must be adjacent to 25
constraint cells[ 24 ] in neighbors[cells[ 25 ]];


% 25  must be adjacent to 26
constraint cells[ 25 ] in neighbors[cells[ 26 ]];


% 26  must be adjacent to 27
constraint cells[ 26 ] in neighbors[cells[ 27 ]];


% 27  must be adjacent to 28
constraint cells[ 27 ] in neighbors[cells[ 28 ]];


% 28  must be adjacent to 29
constraint cells[ 28 ] in neighbors[cells[ 29 ]];


% 29  must be adjacent to 30
constraint cells[ 29 ] in neighbors[cells[ 30 ]];


% 30  must be adjacent to 31
constraint cells[ 30 ] in neighbors[cells[ 31 ]];


% 31  must be adjacent to 32
constraint cells[ 31 ] in neighbors[cells[ 32 ]];


% 32  must be adjacent to 33
constraint cells[ 32 ] in neighbors[cells[ 33 ]];


% 33  must be adjacent to 34
constraint cells[ 33 ] in neighbors[cells[ 34 ]];


% 34  must be adjacent to 35
constraint cells[ 34 ] in neighbors[cells[ 35 ]];


% 35  must be adjacent to 36
constraint cells[ 35 ] in neighbors[cells[ 36 ]];



