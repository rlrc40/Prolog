libros_por_devolver(c_perez, libro10089).
libros_por_devolver(a_ramos, libro29907).
cliente(a_ramos).
cliente(c_perez).
cliente(p_gonzalez).

servicio(Pers, Serv) :- cliente(Pers),
libros_por_devolver(Pers, Libro),
!,
servicio_basico(Serv).
servicio(Pers, Serv) :- servicio_general(Serv).
servicio_basico(referencia).
servicio_basico(consulta).
servicio_adicional(prestamo).
servicio_adicional(pres_inter_biblio).
servicio_general(X) :- servicio_basico(X).
servicio_general(X) :- servicio_adicional(X).



/*Sumar los n primer numeros naturales*/
sumar_n(1, 1) :- !.
sumar_n(N, X):- N1 is N-1, 
				sumar_n(N1, Res), 
				X is Res+N.
				

/*‘A Elena le gustan los animales, salvo las serpientes’*/
animal(snoopy).
animal(lamia).
serpiente(lamia).
gusta(elena, X):- serpiente(X), !, fail.
gusta(elena, X):- animal(X).