dir_general(raul,1).
res_calidad(pepe,2).
res_comercial(pedro,2).
res_tesoreria(jos,3).
res_ventas(luis,2).
asesor(paula,4).
contable(maria,5).
operario1(josue,4).
operario2(federico,5).
reparto1(mario,4).
reparto2(luisa,5).
vendedor1(peter,4).
vendedor2(poter,5).


precede(dir_general, res_calidad).
precede(res_calidad, res_tesoreria).
precede(res_tesoreria, asesor).
precede(asesor, contable).
precede(res_calidad, res_ventas).
precede(res_ventas, operario1).
precede(res_ventas, operario2).
precede(operario2, reparto2).
precede(operario1, reparto1).
precede(res_calidad, res_comercial).
precede(res_comercial, vendedor1).
precede(res_comercial, vendedor2).


jefe(X,Y,1):-precede(X,Y).
jefe(X,Z,N):-
	precede(X,Y),
	jefe(Y,Z,N2),
	N is 1+N2.
	