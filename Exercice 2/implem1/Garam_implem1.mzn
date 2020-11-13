% test de la 1ere modelisation (cf. notes.txt)

/*************************
 mise en forme du garam :
|-----------|   |-----------|
|     a     |   |     f     |
|   |---|   |---|   |---|   |
| b |   | c   e   g |   | h |
|   |   |   |---|   |   |   |
|   |---|   |   |   |---|   |
|     d     |   |     i     |
|---|   |---|   |---|   |---|
    | j |           | k |
|---|   |---|   |---|   |---|
|     l     |   |     q     |
|   |---|   |---|   |---|   |
| m |   | n   p   r |   | s |
|   |   |   |---|   |   |   |
|   |---|   |   |   |---|   |
|     o     |   |     t     |
|-----------|   |-----------|
**************************/

% déclarations
/* haut-gauche */
array[1..3] of var 0..9: a;
array[1..4] of var 0..9: b;
array[1..4] of var 0..9: c;
array[1..3] of var 0..9: d;
array[1..3] of var 0..9: e;

/* haut-droit */
array[1..3] of var 0..9: f;
array[1..4] of var 0..9: g;
array[1..4] of var 0..9: h;
array[1..3] of var 0..9: i;
array[1..3] of var 0..9: j;

/* bas-gauche */
array[1..3] of var 0..9: k;
array[1..3] of var 0..9: l;
array[1..4] of var 0..9: m;
array[1..4] of var 0..9: n;
array[1..3] of var 0..9: o;

/* bas-droit */
array[1..3] of var 0..9: p;
array[1..3] of var 0..9: q;
array[1..4] of var 0..9: r;
array[1..4] of var 0..9: s;
array[1..3] of var 0..9: t;

enum operator={add,sou,mul};
array[1..20] of operator: tabOp;

% contraintes de croisements de tableaux
/* haut-gauche */
constraint a[1]=b[1];
constraint a[3]=c[1];
constraint d[1]=b[4];
constraint d[2]=j[1];
constraint d[3]=c[4];
constraint e[1]=c[2];

/* haut-droit */
constraint f[1]=g[1];
constraint f[3]=h[1];
constraint i[1]=g[4];
constraint i[2]=k[1];
constraint i[3]=h[4];
constraint e[3]=g[2];

/* bas-gauche */
constraint l[1]=m[1];
constraint l[2]=j[3];
constraint l[3]=n[1];
constraint o[1]=m[4];
constraint o[3]=n[4];
constraint p[1]=n[2];

/* bas-droit */
constraint q[1]=r[1];
constraint q[2]=k[3];
constraint q[3]=s[1];
constraint t[1]=r[4];
constraint t[3]=s[4];
constraint p[3]=r[2];

%contraintes de dizaines positives
constraint b[3]>0;
constraint c[3]>0;

constraint g[3]>0;
constraint h[3]>0;

constraint m[3]>0;
constraint n[3]>0;

constraint r[3]>0;
constraint s[3]>0;

% contraintes d'operation
constraint if(tabOp[1]==add) then a[1]+a[2]=a[3] 
  else (if(tabOp[1]==sou) then a[1]-a[2]=a[3] else a[1]*a[2]=a[3]endif)
  endif;

constraint if(tabOp[2]==add) then f[1]+f[2]=f[3] 
  else (if(tabOp[2]==sou) then f[1]-f[2]=f[3] else f[1]*f[2]=f[3]endif)
  endif;

constraint if(tabOp[3]==add) then b[1]+b[2]=(b[3]*10+b[4]) 
  else (if(tabOp[3]==sou) then b[1]-b[2]=(b[3]*10+b[4]) else b[1]*b[2]=(b[3]*10+b[4])endif)
  endif;

constraint if(tabOp[4]==add) then c[1]+c[2]=(c[3]*10+c[4]) 
  else (if(tabOp[4]==sou) then c[1]-c[2]=(c[3]*10+c[4]) else c[1]*c[2]=(c[3]*10+c[4])endif)
  endif;

constraint if(tabOp[5]==add) then g[1]+g[2]=(g[3]*10+g[4]) 
  else (if(tabOp[5]==sou) then g[1]-g[2]=(g[3]*10+g[4]) else g[1]*g[2]=(g[3]*10+g[4])endif)
  endif;
  
constraint if(tabOp[6]==add) then h[1]+h[2]=(h[3]*10+h[4]) 
  else (if(tabOp[6]==sou) then h[1]-h[2]=(h[3]*10+h[4]) else h[1]*h[2]=(h[3]*10+h[4])endif)
  endif;  
  
constraint if(tabOp[7]==add) then e[1]+e[2]=e[3] 
  else (if(tabOp[7]==sou) then e[1]-e[2]=e[3] else e[1]*e[2]=e[3]endif)
  endif;
  
constraint if(tabOp[8]==add) then d[1]+d[2]=d[3] 
  else (if(tabOp[8]==sou) then d[1]-d[2]=d[3] else d[1]*d[2]=d[3]endif)
  endif;   

constraint if(tabOp[9]==add) then i[1]+i[2]=i[3] 
  else (if(tabOp[9]==sou) then i[1]-i[2]=i[3] else i[1]*i[2]=i[3]endif)
  endif;   

constraint if(tabOp[10]==add) then j[1]+j[2]=j[3] 
  else (if(tabOp[9]==sou) then j[1]-j[2]=j[3] else j[1]*j[2]=j[3]endif)
  endif; 

constraint if(tabOp[11]==add) then k[1]+k[2]=k[3] 
  else (if(tabOp[9]==sou) then k[1]-k[2]=k[3] else k[1]*k[2]=k[3]endif)
  endif; 

constraint if(tabOp[12]==add) then l[1]+l[2]=l[3] 
  else (if(tabOp[12]==sou) then l[1]-l[2]=l[3] else l[1]*l[2]=l[3]endif)
  endif;

constraint if(tabOp[13]==add) then q[1]+q[2]=q[3] 
  else (if(tabOp[13]==sou) then q[1]-q[2]=q[3] else q[1]*q[2]=q[3]endif)
  endif;

constraint if(tabOp[14]==add) then m[1]+m[2]=(m[3]*10+m[4]) 
  else (if(tabOp[14]==sou) then m[1]-m[2]=(m[3]*10+m[4]) else m[1]*m[2]=(m[3]*10+m[4])endif)
  endif;

constraint if(tabOp[15]==add) then n[1]+n[2]=(n[3]*10+n[4]) 
  else (if(tabOp[15]==sou) then n[1]-n[2]=(n[3]*10+n[4]) else n[1]*n[2]=(n[3]*10+n[4])endif)
  endif;

constraint if(tabOp[16]==add) then r[1]+r[2]=(r[3]*10+r[4]) 
  else (if(tabOp[16]==sou) then r[1]-r[2]=(r[3]*10+r[4]) else r[1]*r[2]=(r[3]*10+r[4])endif)
  endif;
  
constraint if(tabOp[17]==add) then s[1]+s[2]=(s[3]*10+s[4]) 
  else (if(tabOp[17]==sou) then s[1]-s[2]=(s[3]*10+s[4]) else s[1]*s[2]=(s[3]*10+s[4])endif)
  endif;  
  
constraint if(tabOp[18]==add) then p[1]+p[2]=p[3] 
  else (if(tabOp[18]==sou) then p[1]-p[2]=p[3] else p[1]*p[2]=p[3]endif)
  endif;
  
constraint if(tabOp[19]==add) then o[1]+o[2]=o[3] 
  else (if(tabOp[19]==sou) then o[1]-o[2]=o[3] else o[1]*o[2]=o[3]endif)
  endif;   

constraint if(tabOp[20]==add) then t[1]+t[2]=t[3] 
  else (if(tabOp[20]==sou) then t[1]-t[2]=t[3] else t[1]*t[2]=t[3]endif)
  endif;                                       
                                                                                                            
solve satisfy;

output [" \(a[1]) \(tabOp[1]) \(a[2]) = \(a[3])         \(f[1]) \(tabOp[2]) \(f[2]) = \(f[3])\n"]++
       ["\(tabOp[3])       \(tabOp[4])       \(tabOp[5])       \(tabOp[6])\n"]++
       [" \(b[2])         \(c[2]) \(tabOp[7]) \(e[2]) = \(g[2])         \(h[2])\n"]++
       [" =         =         =         = \n"]++
       [" \(b[3])         \(c[3])         \(g[3])         \(h[3])\n"]++
       [" \(d[1]) \(tabOp[8]) \(d[2]) = \(d[3])         \(i[1]) \(tabOp[9]) \(i[2]) = \(i[3])\n"]++
       ["      \(tabOp[10])                 \(tabOp[11])\n"]++
       ["       \(j[2])                   \(k[2])\n"]++
       ["       =                   =\n"]++
       [" \(l[1]) \(tabOp[12]) \(l[2]) = \(l[3])         \(q[1]) \(tabOp[13]) \(q[2]) = \(q[3])\n"]++
       ["\(tabOp[14])       \(tabOp[15])       \(tabOp[16])       \(tabOp[17])\n"]++
       [" \(m[2])         \(n[2]) \(tabOp[18]) \(p[2]) = \(r[2])         \(s[2])\n"]++
       [" =         =         =         = \n"]++
       [" \(m[3])         \(n[3])         \(r[3])         \(s[3])\n"]++
       [" \(o[1]) \(tabOp[19]) \(o[2]) = \(o[3])         \(t[1]) \(tabOp[20]) \(t[2]) = \(t[3])\n"];
       