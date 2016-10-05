q(X):-p(X),X1 is X+1, p(X1).
p(X):-0 is X mod 2.

media(X, Y, Z) :- Z is ((X+Y)/2).

enlace(a,b,3).
enlace(a,c,2).
enlace(c,d,4).
enlace(c,e,5).
enlace(e,f,5).
enlace(f,g,5).
enlace(g,h,5).
enlace(h,i,5).
enlace(i,j,5).

ruta(Ciudad1, Ciudad2, Distanciatotal) :- 
	enlace(Ciudad1, Ciudad2, Distanciatotal).
	
ruta(X ,Z ,D) :- 
	enlace(X,Y,D1),	
	ruta(Y,Z,D2),
	D is (D1+D2).