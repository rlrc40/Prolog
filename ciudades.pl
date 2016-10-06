enlace(a,b,3).
enlace(a,c,2).
enlace(c,d,4).
enlace(c,e,5).
enlace(d,f,20).
enlace(f,g,40).
	
ruta(X,Y,D) :- enlace(X,Y,D).
	
ruta(X,Z,D) :- 
	enlace(X,Y,D2),
	ruta(Y,Z,D3),
	D is D2+D3.