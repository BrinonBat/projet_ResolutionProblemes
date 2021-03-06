#input: n, output miniSat program for nQueens

import numpy as np
import os
import sys

constraints = []


n = int(input("Number of queens: "))



#miniSat clauses for exactly 1 true boolean among a list
def exactlyOne(array, constraints):
    
    constr = ""
    for i in range(len(array)): #minimum 1 boolean true
        constr += str(array[i]) + " "
    constraints.append(constr.strip())
    
    maxOne(array, constraints)
    

#miniSat clauses for maximum 1 true boolean among a list
def maxOne(array, constraints):
    
    for a in range(len(array)): #maximum 1 boolean true
        for b in range(len(array)):
            if(a != b):
                constr = str(array[a]*-1) + " " + str(array[b]*-1)
                if(not str(array[b]*-1) + " " + str(array[a]*-1) in constraints and not constr in constraints):
                    constraints.append(constr)





#break symetries between original array and mirror/flip of original array
def noSym(array1, array2, constraints):
    constr = str(array1[0]*-1) + " " + str(array2[0])
    constraints.append(constr)

"""
#comparing 2 arrays of booleans lexicographically:

example:
    array1 = [x1, x2, x3, ...]
    array2 = [y1, y2, y3, ...]
    
array1 <=(lex) array2

<===>

x1 <= y1 OR
x1 == y1 AND x2 <= y2 OR
x1 == y1 AND x2 == y2 AND x3 <= y3 OR
etc...

<===>

(~x1 | y1) | 
(~Y1 | X1) & (~X1 | Y1) & (~X2 | Y2) | 
(~Y1 | X1) & (~X1 | Y1) & (~Y2 | X2) & (~X2 | Y2) & (~X3 | Y3) |
etc...

convert to CNF ==> (~x1 | y1)

"""



 #for each line : exactly 1 queen
for i in range(n):
    
    line = []
    for j in range(1, n+1):
        line.append(i*n + j)
    
    exactlyOne(line, constraints)
    

#for each column : exactly 1 queen
for i in range(n): 
    
    column = []
    c = i+1
    for j in range(n):
        column.append(c)
        c += n

    exactlyOne(column, constraints)



#for each diagonal : max 1 queen
damier = np.ones(shape=(n,n))
damier = damier.astype(int)

for i in range(n):
    for j in range(n):
        damier[i, j] = i*n +j+1

diags = [damier[::-1,:].diagonal(i) for i in range(-n+1,n)]
diags.extend(damier.diagonal(i) for i in range(n-1,-n,-1))

for d in diags:
    maxOne(d, constraints)


#break symetries
damier90 = np.rot90(damier, 1, (0, 1))
noSym(damier.flatten(), damier90.flatten(), constraints)

damier180 = np.rot90(damier, 2, (0, 1))
noSym(damier.flatten(), damier180.flatten(), constraints)

damier270 = np.rot90(damier, 3, (0, 1))
noSym(damier.flatten(), damier270.flatten(), constraints)




#write instructions to file
filename = str(n) + "queens"

f = open(filename, "w")

f.write("p cnf "+ str(n*n) + " " + str(len(constraints)))
f.write("\n\r")

for i in range(len(constraints)):
    f.write(constraints[i] + " 0")
    f.write("\n\r")
f.close()





print("MiniSat instructions written to", filename)
print("Execute command: minisat", filename, "OUTPUT_FILE")




#read output file and print results
resultFileName = input("Results file name: ")
while(not os.path.isfile(resultFileName)):
    print("Couldn't find file")
    resultFileName = input("Results file name: ")


r = open(resultFileName, "r")
result = r.read()
e = len(result)-3
result = result[4:e]
result = result.split()

for i in range(len(result)):
    if(int(result[i]) < 0):
        result[i] = ""
    else:
        result[i] = "X"

result = np.reshape(result, (n, n))


np.set_printoptions(threshold=sys.maxsize)

print(result)




    
    
    
