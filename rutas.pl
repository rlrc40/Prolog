enlace(a,b,3). 
enlace(a,c,2). 
enlace(c,d,4). 
enlace(c,e,5). 

ruta(X,Y,N):-enlace(X,Y,N).
ruta(X,Z,Dis):-
	enlace(X,Y,N),
	ruta(Y,Z,M),
	sumar(M,N,Dis).

sumar(M,N,Dis):-
	Dis is M+N.