% test de la 1ere modelisation (cf. notes.txt)

/*************************
 mise en forme du garam :
||----------------||    ||----------------||
|| a1 a2 a3 == a5 ||    || f1 f2 f3 == f5 ||
|| b2 ||----|| c2 ||----|| g2 ||----|| h2 ||
|| b3 ||    || c3 e2 e3 e4 e5 ||    || h3 ||
|| == ||    || == ||----|| == ||    || == ||
|| b5 ||----|| c5 ||    || g5 ||----|| h5 ||
|| b6 d2 d3 == c6 ||    || g6 i2 i3 == h6 ||
||----|| j2 ||----||    ||----|| k2 ||----||
      || j3 ||                || k3 ||
||----|| == ||----||    ||----|| == ||----||
|| l1 l2 j5 == l5 ||    || q1 q2 k5 == q5 ||
|| m2 ||----|| n2 ||----|| r2 ||----|| s2 ||
|| m3 ||    || n3 p2 p3 == p5 ||    || s3 ||
|| == ||    || == ||----|| == ||    || == ||
|| m5 ||----|| n5 ||    || r5 ||----|| s5 ||
|| m6 o2 o3 == n6 ||    || r6 t2 t3 == s6 ||
||----------------||    ||----------------||
**************************/

% déclarations

/* haut-gauche */
var 0..9: a1;
var 0..9: a3;
var 0..9: a5;
var 0..9: b1;
var 0..9: b3;
var 1..9: b5;
var 0..9: b6;
var 0..9: c1;
var 0..9: c3;
var 1..9: c5;
var 0..9: c6;
var 0..9: d1;
var 0..9: d3;
var 0..9: d4;
var 0..9: d5;
var 0..9: e1;
var 0..9: e3;
var 0..9: e5;

/* haut-droit */
var 0..9: f1;
var 0..9: f3;
var 0..9: f5;
var 0..9: g1;
var 0..9: g3;
var 1..9: g5;
var 0..9: g6;
var 0..9: h1;
var 0..9: h3;
var 1..9: h5;
var 0..9: h6;
var 0..9: i1;
var 0..9: i3;
var 0..9: i5;
var 0..9: j1;
var 0..9: j3;
var 0..9: j5;

/* bas-gauche */
var 0..9: k1;
var 0..9: k3;
var 0..9: k5;
var 0..9: l1;
var 0..9: l3;
var 0..9: l5;
var 0..9: m1;
var 0..9: m3;
var 1..9: m5;
var 0..9: m6;
var 0..9: n1;
var 0..9: n3;
var 1..9: n5;
var 0..9: n6;
var 0..9: o1;
var 0..9: o3;
var 0..9: o5;
var 0..9: o6;

/* bas-droit */
var 0..9: p1;
var 0..9: p3;
var 0..9: p5;
var 0..9: q1;
var 0..9: q3;
var 0..9: q5;
var 0..9: r1;
var 0..9: r3;
var 1..9: r5;
var 0..9: r6;
var 0..9: s1;
var 0..9: s3;
var 1..9: s5;
var 0..9: s6;
var 0..9: t1;
var 0..9: t3;
var 0..9: t5;

/* operator */
enum operator={add,sou,mul};
operator: a2;
operator: b2;
operator: c2;
operator: d2;
operator: e2;
operator: f2;
operator: g2;
operator: h2;
operator: i2;
operator: j2;
operator: k2;
operator: l2;
operator: m2;
operator: n2;
operator: o2;
operator: p2;
operator: q2;
operator: r2;
operator: s2;
operator: t2;

% contraintes de croisements
/* haut-gauche */
constraint a1=b1;
constraint a5=c1;
constraint d1=b6;
constraint d3=j1;
constraint d5=c6;
constraint e1=c3;

/* haut-droit */
constraint f1=g1;
constraint f5=h1;
constraint i1=g6;
constraint i3=k1;
constraint i5=h6;
constraint e5=g3;

/* bas-gauche */
constraint l1=m1;
constraint l3=j5;
constraint l5=n1;
constraint o1=m6;
constraint o5=n6;
constraint p1=n3;

/* bas-droit */
constraint q1=r1;
constraint q3=k5;
constraint q5=s1;
constraint t1=r6;
constraint t5=s6;
constraint p5=r3;


% contraintes d'operation
constraint if(a2==add) then a1+a3=a5
  else (if(a2==sou) then a1-a3=a5 else a1*a3=a5 endif)
  endif;
  
constraint if(f2==add) then f1+f3=f5
  else (if(f2==sou) then f1-f3=f5 else f1*f3=f5 endif)
  endif;

constraint if(b2==add) then b1+b3=(b5*10+b6) 
  else (if(b2==sou) then b1-b3=(b5*10+b6) else b1*b3=(b5*10+b6) endif)
  endif;

constraint if(c2==add) then c1+c3=(c5*10+c6) 
  else (if(c2==sou) then c1-c3=(c5*10+c6) else c1*c3=(c5*10+c6) endif)
  endif;

constraint if(g2==add) then g1+g3=(g5*10+g6) 
  else (if(g2==sou) then g1-g3=(g5*10+g6) else g1*g3=(g5*10+g6) endif)
  endif;
  
constraint if(h2==add) then h1+h3=(h5*10+h6) 
  else (if(h2==sou) then h1-h3=(h5*10+h6) else h1*h3=(h5*10+h6) endif)
  endif;  
  
constraint if(e2==add) then e1+e3=e5
  else (if(e2==sou) then e1-e3=e5 else e1*e3=e5 endif)
  endif;
  
constraint if(d2==add) then d1+d3=d5
  else (if(d2==sou) then d1-d3=d5 else d1*d3=d5 endif)
  endif;   

constraint if(i2==add) then i1+i3=i5
  else (if(i2==sou) then i1-i3=i5 else i1*i3=i5 endif)
  endif;   

constraint if(j2==add) then j1+j3=j5
  else (if(j2==sou) then j1-j3=j5 else j1*j3=j5 endif)
  endif; 

constraint if(k2==add) then k1+k3=k5
  else (if(k2==sou) then k1-k3=k5 else k1*k3=k5 endif)
  endif; 

constraint if(l2==add) then l1+l3=l5
  else (if(l2==sou) then l1-l3=l5 else l1*l3=l5 endif)
  endif;

constraint if(q2==add) then q1+q3=q5
  else (if(q2==sou) then q1-q3=q5 else q1*q3=q5 endif)
  endif;

constraint if(m2==add) then m1+m3=(m5*10+m6) 
  else (if(m2==sou) then m1-m3=(m5*10+m6) else m1*m3=(m5*10+m6) endif)
  endif;

constraint if(n2==add) then n1+n3=(n5*10+n6) 
  else (if(n2==sou) then n1-n3=(n5*10+n6) else n1*n3=(n5*10+n6) endif)
  endif;

constraint if(r2==add) then r1+r3=(r5*10+r6) 
  else (if(r2==sou) then r1-r3=(r5*10+r6) else r1*r3=(r5*10+r6) endif)
  endif;
  
constraint if(s2==add) then s1+s3=(s5*10+s6) 
  else (if(s2==sou) then s1-s3=(s5*10+s6) else s1*s3=(s5*10+s6) endif)
  endif;  
  
constraint if(p2==add) then p1+p3=p5 
  else (if(p2==sou) then p1-p3=p5 else p1*p3=p5 endif)
  endif;
  
constraint if(o2==add) then o1+o3=o5 
  else (if(o2==sou) then o1-o3=o5 else o1*o3=o5 endif)
  endif;   

constraint if(t2==add) then t1+t3=t5
  else (if(t2==sou) then t1-t3=t5 else t1*t3=t5 endif)
  endif;  
  
solve satisfy;

output [" \(a1) \(a2) \(a3) = \(a5)         \(f1) \(f2) \(f3) = \(f5)\n"]++
       ["\(b2)       \(c2)       \(g2)       \(h2)\n"]++
       [" \(b3)         \(c3) \(e2) \(e3) = \(g3)         \(h3)\n"]++
       [" =         =         =         = \n"]++
       [" \(b5)         \(c5)         \(g5)         \(h5)\n"]++
       [" \(d1) \(d2) \(d3) = \(d5)         \(i1) \(i2) \(i3) = \(i5)\n"]++
       ["      \(j2)                 \(k2)\n"]++
       ["       \(j3)                   \(k3)\n"]++
       ["       =                   =\n"]++
       [" \(l1) \(l2) \(l3) = \(l5)         \(q1) \(q2) \(q3) = \(q5)\n"]++
       ["\(m2)       \(n2)       \(r2)       \(s2)\n"]++
       [" \(m3)         \(n3) \(p2) \(p3) = \(r3)         \(s3)\n"]++
       [" =         =         =         = \n"]++
       [" \(m5)         \(n5)         \(r5)         \(s5)\n"]++
       [" \(o1) \(o2) \(o3) = \(o5)         \(t1) \(t2) \(t3) = \(t5)\n"];