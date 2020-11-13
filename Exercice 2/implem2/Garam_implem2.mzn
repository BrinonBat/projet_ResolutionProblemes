% déclarations
int: n = 9; 
int: m = 7;
array[1..n,1..m] of var 0..9: garam;

enum operator={add,sou,mul};
array[1..20] of operator: tabOp;


/* contraintes d'operations */

/* grille 1 ( haut à gauche) */
constraint if(tabOp[1]==add) then garam[1,1]+garam[1,2]=garam[1,3] 
  else (if(tabOp[1]==sou) then garam[1,1]-garam[1,2]=garam[1,3] else garam[1,1]*garam[1,2]=garam[1,3]endif)
  endif;
  
constraint if(tabOp[2]==add) then garam[1,1]+garam[2,1]=(garam[3,1]*10 + garam[4,1] )
  else (if(tabOp[2]==sou) then garam[1,1]-garam[2,1]=(garam[3,1]*10 + garam[4,1] )else garam[1,1]*garam[2,1]=(garam[3,1]*10 + garam[4,1] )endif)
  endif;
  
constraint if(tabOp[3]==add) then garam[1,3]+garam[2,3]=(garam[3,3]*10 + garam[4,3] )
  else (if(tabOp[3]==sou) then garam[1,3]-garam[2,3]=(garam[3,3]*10 + garam[4,3] )else garam[1,3]*garam[2,3]=(garam[3,3]*10 + garam[4,3] )endif)
  endif;

constraint if(tabOp[4]==add) then garam[4,1]+garam[4,2]=garam[4,3] 
  else (if(tabOp[4]==sou) then garam[4,1]-garam[4,2]=garam[4,3] else garam[4,1]*garam[4,2]=garam[4,3]endif)
  endif;  
    
 /*grille 2 (haut à droite)*/

constraint if(tabOp[5]==add) then garam[1,5]+garam[1,6]=garam[1,7] 
  else (if(tabOp[5]==sou) then garam[1,5]-garam[1,6]=garam[1,7] else garam[1,5]*garam[1,6]=garam[1,7]endif)
  endif;
  
constraint if(tabOp[6]==add) then garam[1,5]+garam[2,5]=(garam[3,5]*10 + garam[4,5] )
  else (if(tabOp[6]==sou) then garam[1,5]-garam[2,5]=(garam[3,5]*10 + garam[4,5] )else garam[1,5]*garam[2,5]=(garam[3,5]*10 + garam[4,5] )endif)
  endif;
  
constraint if(tabOp[7]==add) then garam[1,7]+garam[2,7]=(garam[3,7]*10 + garam[4,7] )
  else (if(tabOp[7]==sou) then garam[1,7]-garam[2,7]=(garam[3,7]*10 + garam[4,7] )else garam[1,7]*garam[2,7]=(garam[3,7]*10 + garam[4,7] )endif)
  endif;

constraint if(tabOp[8]==add) then garam[4,5]+garam[4,6]=garam[4,7] 
  else (if(tabOp[8]==sou) then garam[4,5]-garam[4,6]=garam[4,7] else garam[4,5]*garam[4,6]=garam[4,7]endif)
  endif;    
 
 /* grille 3 ( bas à gauche) */
constraint if(tabOp[9]==add) then garam[6,1]+garam[6,2]=garam[6,3] 
  else (if(tabOp[9]==sou) then garam[6,1]-garam[6,2]=garam[6,3] else garam[6,1]*garam[6,2]=garam[6,3]endif)
  endif;
  
constraint if(tabOp[10]==add) then garam[6,1]+garam[7,1]=(garam[8,1]*10 + garam[9,1] )
  else (if(tabOp[10]==sou) then garam[6,1]-garam[7,1]=(garam[8,1]*10 + garam[9,1] )else garam[6,1]*garam[7,1]=(garam[8,1]*10 + garam[9,1] )endif)
  endif;
  
constraint if(tabOp[11]==add) then garam[6,3]+garam[7,3]=(garam[8,3]*10 + garam[9,3] )
  else (if(tabOp[11]==sou) then garam[6,3]-garam[7,3]=(garam[8,3]*10 + garam[9,3] )else garam[6,3]*garam[7,3]=(garam[8,3]*10 + garam[9,3] )endif)
  endif;

constraint if(tabOp[12]==add) then garam[9,1]+garam[9,2]=garam[9,3] 
  else (if(tabOp[12]==sou) then garam[9,1]-garam[9,2]=garam[9,3] else garam[9,1]*garam[9,2]=garam[9,3]endif)
  endif;    
  
 /*Grille 4 (bas à droite)*/
constraint if(tabOp[13]==add) then garam[6,5]+garam[6,6]=garam[6,7] 
  else (if(tabOp[13]==sou) then garam[6,5]-garam[6,6]=garam[6,7] else garam[6,5]*garam[6,6]=garam[6,7]endif)
  endif;
  
constraint if(tabOp[14]==add) then garam[6,5]+garam[7,5]=(garam[8,5]*10 + garam[9,5] )
  else (if(tabOp[14]==sou) then garam[6,5]-garam[7,5]=(garam[8,5]*10 + garam[9,5] )else garam[6,5]*garam[7,5]=(garam[8,5]*10 + garam[9,5] )endif)
  endif;
  
constraint if(tabOp[15]==add) then garam[6,7]+garam[7,7]=(garam[8,7]*10 + garam[9,7] )
  else (if(tabOp[15]==sou) then garam[6,7]-garam[7,7]=(garam[8,7]*10 + garam[9,7] )else garam[6,7]*garam[7,7]=(garam[8,7]*10 + garam[9,7] )endif)
  endif;

constraint if(tabOp[16]==add) then garam[9,5]+garam[9,6]=garam[9,7] 
  else (if(tabOp[16]==sou) then garam[9,5]-garam[9,6]=garam[9,7] else garam[9,5]*garam[9,6]=garam[9,7]endif)
  endif; 
     
 % contraintes de croisements
 
 /*grille 1 et grille 2 */
constraint if(tabOp[17]==add) then garam[2,3]+garam[2,4]=garam[2,5] 
  else (if(tabOp[17]==sou) then garam[2,3]-garam[2,4]=garam[2,5]  else garam[2,3]*garam[2,4]=garam[2,5] endif)
  endif;
  
  /* grille 3 et grille 4 */
constraint if(tabOp[18]==add) then garam[7,3]+garam[7,4]=garam[7,5] 
  else (if(tabOp[18]==sou) then garam[7,3]-garam[7,4]=garam[7,5]  else garam[7,3]*garam[7,4]=garam[7,5] endif)
  endif;
  
  /* grille 1 et grille 3 */
constraint if(tabOp[19]==add) then garam[4,2]+garam[5,2]=garam[6,2] 
  else (if(tabOp[19]==sou) then garam[4,2]-garam[5,2]=garam[6,2]   else garam[4,2]*garam[5,2]=garam[6,2]  endif)
  endif;
  
   /* grille 2 et grille 4 */
constraint if(tabOp[20]==add) then garam[4,6]+garam[5,6]=garam[6,6] 
  else (if(tabOp[20]==sou) then garam[4,6]-garam[5,6]=garam[6,6]   else garam[4,6]*garam[5,6]=garam[6,6]  endif)
  endif;
  

solve satisfy;

output [" \(garam[1,1]) \(tabOp[1]) \(garam[1,2]) = \(garam[1,3])         \(garam[1,5]) \(tabOp[5]) \(garam[1,6]) = \(garam[1,7])\n"]++
       [" \(tabOp[2])      \(tabOp[3])       \(tabOp[6])       \(tabOp[7])\n"]++
       [" \(garam[2,1])         \(garam[2,3]) \(tabOp[17]) \(garam[2,4]) = \(garam[2,5])         \(garam[2,7])\n"]++
       [" =         =         =         = \n"]++
       [" \(garam[3,1])         \(garam[3,3])         \(garam[3,5])         \(garam[3,7])\n"]++
       [" \(garam[4,1]) \(tabOp[4]) \(garam[4,2]) = \(garam[4,3])         \(garam[4,5]) \(tabOp[8]) \(garam[4,6]) = \(garam[4,7])\n"]++
       ["      \(tabOp[19])                 \(tabOp[20])\n"]++
       ["       \(garam[5,2])                   \(garam[5,6])\n"]++
       ["       =                   =\n"]++
       [" \(garam[6,1]) \(tabOp[9]) \(garam[6,2]) = \(garam[6,3])         \(garam[6,5]) \(tabOp[13]) \(garam[6,6]) = \(garam[6,7])\n"]++
       [" \(tabOp[10])       \(tabOp[11])       \(tabOp[14])       \(tabOp[15])\n"]++
       [" \(garam[7,1])         \(garam[7,3]) \(tabOp[18]) \(garam[7,4]) = \(garam[7,5])         \(garam[7,7])\n"]++
       [" =         =         =         = \n"]++
       [" \(garam[8,1])         \(garam[8,3])         \(garam[8,5])         \(garam[8,7])\n"]++
       [" \(garam[9,1]) \(tabOp[12]) \(garam[9,2]) = \(garam[9,3])         \(garam[9,5]) \(tabOp[16]) \(garam[9,6]) = \(garam[9,7])\n"];
   