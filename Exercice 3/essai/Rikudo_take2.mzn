
array [1..36] of var 1..36: cells;%values of each cell

include "alldifferent.mzn";
constraint alldifferent(cells);

constraint cells[1] = cells[2]-1 \/ cells[1] = cells[2]+1 \/ 
cells[1] = cells[18]-1 \/ cells[1] = cells[18]+1 \/ 
cells[1] = cells[19]-1 \/ cells[1] = cells[19]+1; 
 
constraint cells[2] = cells[1]-1 \/ cells[2] = cells[1]+1 \/ 
cells[2] = cells[3]-1 \/ cells[2] = cells[3]+1 \/ 
cells[2] = cells[19]-1 \/ cells[2] = cells[19]+1 \/ 
cells[2] = cells[20]-1 \/ cells[2] = cells[20]+1; 
 
constraint cells[3] = cells[2]-1 \/ cells[3] = cells[2]+1 \/ 
cells[3] = cells[4]-1 \/ cells[3] = cells[4]+1 \/ 
cells[3] = cells[20]-1 \/ cells[3] = cells[20]+1 \/ 
cells[3] = cells[21]-1 \/ cells[3] = cells[21]+1; 
 
constraint cells[4] = cells[3]-1 \/ cells[4] = cells[3]+1 \/ 
cells[4] = cells[21]-1 \/ cells[4] = cells[21]+1 \/ 
cells[4] = cells[5]-1 \/ cells[4] = cells[5]+1; 
 
constraint cells[5] = cells[4]-1 \/ cells[5] = cells[4]+1 \/ 
cells[5] = cells[21]-1 \/ cells[5] = cells[21]+1 \/ 
cells[5] = cells[22]-1 \/ cells[5] = cells[22]+1 \/ 
cells[5] = cells[6]-1 \/ cells[5] = cells[6]+1; 
 
constraint cells[6] = cells[5]-1 \/ cells[6] = cells[5]+1 \/ 
cells[6] = cells[22]-1 \/ cells[6] = cells[22]+1 \/ 
cells[6] = cells[23]-1 \/ cells[6] = cells[23]+1 \/ 
cells[6] = cells[7]-1 \/ cells[6] = cells[7]+1; 
 
constraint cells[7] = cells[6]-1 \/ cells[7] = cells[6]+1 \/ 
cells[7] = cells[23]-1 \/ cells[7] = cells[23]+1 \/ 
cells[7] = cells[8]-1 \/ cells[7] = cells[8]+1; 
 
constraint cells[8] = cells[7]-1 \/ cells[8] = cells[7]+1 \/ 
cells[8] = cells[23]-1 \/ cells[8] = cells[23]+1 \/ 
cells[8] = cells[24]-1 \/ cells[8] = cells[24]+1 \/ 
cells[8] = cells[9]-1 \/ cells[8] = cells[9]+1; 
 
constraint cells[9] = cells[8]-1 \/ cells[9] = cells[8]+1 \/ 
cells[9] = cells[24]-1 \/ cells[9] = cells[24]+1 \/ 
cells[9] = cells[25]-1 \/ cells[9] = cells[25]+1 \/ 
cells[9] = cells[10]-1 \/ cells[9] = cells[10]+1; 
 
constraint cells[10] = cells[9]-1 \/ cells[10] = cells[9]+1 \/ 
cells[10] = cells[25]-1 \/ cells[10] = cells[25]+1 \/ 
cells[10] = cells[11]-1 \/ cells[10] = cells[11]+1; 
 
constraint cells[11] = cells[10]-1 \/ cells[11] = cells[10]+1 \/ 
cells[11] = cells[25]-1 \/ cells[11] = cells[25]+1 \/ 
cells[11] = cells[26]-1 \/ cells[11] = cells[26]+1 \/ 
cells[11] = cells[12]-1 \/ cells[11] = cells[12]+1; 
 
constraint cells[12] = cells[11]-1 \/ cells[12] = cells[11]+1 \/ 
cells[12] = cells[26]-1 \/ cells[12] = cells[26]+1 \/ 
cells[12] = cells[27]-1 \/ cells[12] = cells[27]+1 \/ 
cells[12] = cells[13]-1 \/ cells[12] = cells[13]+1; 
 
constraint cells[13] = cells[12]-1 \/ cells[13] = cells[12]+1 \/ 
cells[13] = cells[27]-1 \/ cells[13] = cells[27]+1 \/ 
cells[13] = cells[14]-1 \/ cells[13] = cells[14]+1; 
 
constraint cells[14] = cells[13]-1 \/ cells[14] = cells[13]+1 \/ 
cells[14] = cells[27]-1 \/ cells[14] = cells[27]+1 \/ 
cells[14] = cells[28]-1 \/ cells[14] = cells[28]+1 \/ 
cells[14] = cells[15]-1 \/ cells[14] = cells[15]+1; 
 
constraint cells[15] = cells[14]-1 \/ cells[15] = cells[14]+1 \/ 
cells[15] = cells[28]-1 \/ cells[15] = cells[28]+1 \/ 
cells[15] = cells[29]-1 \/ cells[15] = cells[29]+1 \/ 
cells[15] = cells[16]-1 \/ cells[15] = cells[16]+1; 
 
constraint cells[16] = cells[15]-1 \/ cells[16] = cells[15]+1 \/ 
cells[16] = cells[29]-1 \/ cells[16] = cells[29]+1 \/ 
cells[16] = cells[17]-1 \/ cells[16] = cells[17]+1; 
 
constraint cells[17] = cells[16]-1 \/ cells[17] = cells[16]+1 \/ 
cells[17] = cells[29]-1 \/ cells[17] = cells[29]+1 \/ 
cells[17] = cells[30]-1 \/ cells[17] = cells[30]+1 \/ 
cells[17] = cells[18]-1 \/ cells[17] = cells[18]+1; 
 
constraint cells[18] = cells[17]-1 \/ cells[18] = cells[17]+1 \/ 
cells[18] = cells[30]-1 \/ cells[18] = cells[30]+1 \/ 
cells[18] = cells[19]-1 \/ cells[18] = cells[19]+1 \/ 
cells[18] = cells[1]-1 \/ cells[18] = cells[1]+1; 
 
constraint cells[19] = cells[1]-1 \/ cells[19] = cells[1]+1 \/ 
cells[19] = cells[2]-1 \/ cells[19] = cells[2]+1 \/ 
cells[19] = cells[20]-1 \/ cells[19] = cells[20]+1 \/ 
cells[19] = cells[31]-1 \/ cells[19] = cells[31]+1 \/ 
cells[19] = cells[30]-1 \/ cells[19] = cells[30]+1 \/ 
cells[19] = cells[18]-1 \/ cells[19] = cells[18]+1; 
 
constraint cells[20] = cells[2]-1 \/ cells[20] = cells[2]+1 \/ 
cells[20] = cells[3]-1 \/ cells[20] = cells[3]+1 \/ 
cells[20] = cells[21]-1 \/ cells[20] = cells[21]+1 \/ 
cells[20] = cells[32]-1 \/ cells[20] = cells[32]+1 \/ 
cells[20] = cells[31]-1 \/ cells[20] = cells[31]+1 \/ 
cells[20] = cells[19]-1 \/ cells[20] = cells[19]+1; 
 
constraint cells[21] = cells[3]-1 \/ cells[21] = cells[3]+1 \/ 
cells[21] = cells[4]-1 \/ cells[21] = cells[4]+1 \/ 
cells[21] = cells[5]-1 \/ cells[21] = cells[5]+1 \/ 
cells[21] = cells[22]-1 \/ cells[21] = cells[22]+1 \/ 
cells[21] = cells[32]-1 \/ cells[21] = cells[32]+1 \/ 
cells[21] = cells[20]-1 \/ cells[21] = cells[20]+1; 
 
constraint cells[22] = cells[21]-1 \/ cells[22] = cells[21]+1 \/ 
cells[22] = cells[5]-1 \/ cells[22] = cells[5]+1 \/ 
cells[22] = cells[6]-1 \/ cells[22] = cells[6]+1 \/ 
cells[22] = cells[23]-1 \/ cells[22] = cells[23]+1 \/ 
cells[22] = cells[33]-1 \/ cells[22] = cells[33]+1 \/ 
cells[22] = cells[32]-1 \/ cells[22] = cells[32]+1; 
 
constraint cells[23] = cells[22]-1 \/ cells[23] = cells[22]+1 \/ 
cells[23] = cells[6]-1 \/ cells[23] = cells[6]+1 \/ 
cells[23] = cells[7]-1 \/ cells[23] = cells[7]+1 \/ 
cells[23] = cells[8]-1 \/ cells[23] = cells[8]+1 \/ 
cells[23] = cells[24]-1 \/ cells[23] = cells[24]+1 \/ 
cells[23] = cells[33]-1 \/ cells[23] = cells[33]+1; 
 
constraint cells[24] = cells[33]-1 \/ cells[24] = cells[33]+1 \/ 
cells[24] = cells[23]-1 \/ cells[24] = cells[23]+1 \/ 
cells[24] = cells[8]-1 \/ cells[24] = cells[8]+1 \/ 
cells[24] = cells[9]-1 \/ cells[24] = cells[9]+1 \/ 
cells[24] = cells[25]-1 \/ cells[24] = cells[25]+1 \/ 
cells[24] = cells[34]-1 \/ cells[24] = cells[34]+1; 
 
constraint cells[25] = cells[34]-1 \/ cells[25] = cells[34]+1 \/ 
cells[25] = cells[24]-1 \/ cells[25] = cells[24]+1 \/ 
cells[25] = cells[9]-1 \/ cells[25] = cells[9]+1 \/ 
cells[25] = cells[10]-1 \/ cells[25] = cells[10]+1 \/ 
cells[25] = cells[11]-1 \/ cells[25] = cells[11]+1 \/ 
cells[25] = cells[26]-1 \/ cells[25] = cells[26]+1; 
 
constraint cells[26] = cells[35]-1 \/ cells[26] = cells[35]+1 \/ 
cells[26] = cells[34]-1 \/ cells[26] = cells[34]+1 \/ 
cells[26] = cells[25]-1 \/ cells[26] = cells[25]+1 \/ 
cells[26] = cells[11]-1 \/ cells[26] = cells[11]+1 \/ 
cells[26] = cells[12]-1 \/ cells[26] = cells[12]+1 \/ 
cells[26] = cells[27]-1 \/ cells[26] = cells[27]+1; 
 
constraint cells[27] = cells[28]-1 \/ cells[27] = cells[28]+1 \/ 
cells[27] = cells[35]-1 \/ cells[27] = cells[35]+1 \/ 
cells[27] = cells[26]-1 \/ cells[27] = cells[26]+1 \/ 
cells[27] = cells[12]-1 \/ cells[27] = cells[12]+1 \/ 
cells[27] = cells[13]-1 \/ cells[27] = cells[13]+1 \/ 
cells[27] = cells[14]-1 \/ cells[27] = cells[14]+1; 
 
constraint cells[28] = cells[29]-1 \/ cells[28] = cells[29]+1 \/ 
cells[28] = cells[36]-1 \/ cells[28] = cells[36]+1 \/ 
cells[28] = cells[35]-1 \/ cells[28] = cells[35]+1 \/ 
cells[28] = cells[27]-1 \/ cells[28] = cells[27]+1 \/ 
cells[28] = cells[14]-1 \/ cells[28] = cells[14]+1 \/ 
cells[28] = cells[15]-1 \/ cells[28] = cells[15]+1; 
 
constraint cells[29] = cells[17]-1 \/ cells[29] = cells[17]+1 \/ 
cells[29] = cells[30]-1 \/ cells[29] = cells[30]+1 \/ 
cells[29] = cells[36]-1 \/ cells[29] = cells[36]+1 \/ 
cells[29] = cells[28]-1 \/ cells[29] = cells[28]+1 \/ 
cells[29] = cells[15]-1 \/ cells[29] = cells[15]+1 \/ 
cells[29] = cells[16]-1 \/ cells[29] = cells[16]+1; 
 
constraint cells[30] = cells[18]-1 \/ cells[30] = cells[18]+1 \/ 
cells[30] = cells[19]-1 \/ cells[30] = cells[19]+1 \/ 
cells[30] = cells[31]-1 \/ cells[30] = cells[31]+1 \/ 
cells[30] = cells[36]-1 \/ cells[30] = cells[36]+1 \/ 
cells[30] = cells[29]-1 \/ cells[30] = cells[29]+1 \/ 
cells[30] = cells[17]-1 \/ cells[30] = cells[17]+1; 
 
constraint cells[31] = cells[19]-1 \/ cells[31] = cells[19]+1 \/ 
cells[31] = cells[20]-1 \/ cells[31] = cells[20]+1 \/ 
cells[31] = cells[32]-1 \/ cells[31] = cells[32]+1 \/ 
cells[31] = cells[36]-1 \/ cells[31] = cells[36]+1 \/ 
cells[31] = cells[30]-1 \/ cells[31] = cells[30]+1; 
 
constraint cells[32] = cells[20]-1 \/ cells[32] = cells[20]+1 \/ 
cells[32] = cells[21]-1 \/ cells[32] = cells[21]+1 \/ 
cells[32] = cells[22]-1 \/ cells[32] = cells[22]+1 \/ 
cells[32] = cells[33]-1 \/ cells[32] = cells[33]+1 \/ 
cells[32] = cells[31]-1 \/ cells[32] = cells[31]+1; 
 
constraint cells[33] = cells[32]-1 \/ cells[33] = cells[32]+1 \/ 
cells[33] = cells[22]-1 \/ cells[33] = cells[22]+1 \/ 
cells[33] = cells[23]-1 \/ cells[33] = cells[23]+1 \/ 
cells[33] = cells[24]-1 \/ cells[33] = cells[24]+1 \/ 
cells[33] = cells[34]-1 \/ cells[33] = cells[34]+1; 
 
constraint cells[34] = cells[33]-1 \/ cells[34] = cells[33]+1 \/ 
cells[34] = cells[24]-1 \/ cells[34] = cells[24]+1 \/ 
cells[34] = cells[25]-1 \/ cells[34] = cells[25]+1 \/ 
cells[34] = cells[26]-1 \/ cells[34] = cells[26]+1 \/ 
cells[34] = cells[35]-1 \/ cells[34] = cells[35]+1; 
 
constraint cells[35] = cells[36]-1 \/ cells[35] = cells[36]+1 \/ 
cells[35] = cells[34]-1 \/ cells[35] = cells[34]+1 \/ 
cells[35] = cells[26]-1 \/ cells[35] = cells[26]+1 \/ 
cells[35] = cells[27]-1 \/ cells[35] = cells[27]+1 \/ 
cells[35] = cells[28]-1 \/ cells[35] = cells[28]+1; 
 
constraint cells[36] = cells[30]-1 \/ cells[36] = cells[30]+1 \/ 
cells[36] = cells[31]-1 \/ cells[36] = cells[31]+1 \/ 
cells[36] = cells[35]-1 \/ cells[36] = cells[35]+1 \/ 
cells[36] = cells[28]-1 \/ cells[36] = cells[28]+1 \/ 
cells[36] = cells[29]-1 \/ cells[36] = cells[29]+1; 