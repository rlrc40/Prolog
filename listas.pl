/*miembro de una lista*/
miembro(X,[X|_]).
miembro(X,[_|Cola]):- miembro(X,Cola).


/*Ejercicio 2 Longitud*/
longitud([],0).
longitud([_|Cola],N) :- 
	longitud(Cola,N1),
	N is 1+N1.
	
	
/*Ejercicio 3 Suma*/
suma([],0).
suma([X|Xs],S) :- 
	suma(Xs,Sc),
	S is Sc+X.
	
	
/*Ejercicio 4 Eliminar un elemento*/
elimina(X,[X|Xs],Xs).
elimina(X,[Y|Ys],[Y|Zs]):-elimina(X,Ys,Zs).

/*Ejercicio 5 insertar un elemento*/
insertar(X, Xs, [X|Xs]).


/*Concatenar*/
concatena([], L, L).
concatena([X|L1], L2, [X|L3]) :- concatena(L1, L2, L3).

/*Ejercicio 6.a  descomponer una lista en dos*/
descomponer(L, [], L).
descomponer([X|L3], [X|L1], L2) :- descomponer(L3, L1, L2).


/*Ejercicio 6.b  borrar secuencia de elementos de una lista*/
elimina(A,B,C,[A,B,C|Xs],Xs).
elimina(A,B,C,[Y|Ys],[Y|Zs]):-elimina(A,B,C, Ys,Zs).

/*Ejercicio 6.b  borrar tres ultimos elementos de una lista*/
elimina([_, _, _], []).
elimina([Y|Ys],[Y|Zs]):-elimina(Ys,Zs).


/*Ejercicio 6.d  Extraer el ultimo elemento de la lista*/
ultimo([Y], Y).
ultimo([_|Xs], Y) :- ultimo(Xs, Y).


/*7. Construye una lista con todos los elementos que se encuentran antes de un 
cierto elemento en una lista dada.*/
siete(X,[X|_], []).
siete(X,[Y|Ys], [Y|Zs]) :- siete(X,Ys,Zs).

/*8. Determina si una lista numérica se encuentra en orden creciente*/
creciente([_]).
creciente([X,Y|Ys]):- X < Y, 
					creciente([Y|Ys]).

/*9. Determina si una lista numérica se encuentra en orden decreciente.*/
decreciente([_]).
decreciente([X,Y|Ys]):- X > Y, 
					decreciente([Y|Ys]).
					

/*10. Forma una lista con todos los elementos en secuencia creciente a partir de un cierto número. (Para
listas numéricas)	


12. Elimina el elemento que se encuentra en la enésima posición.*/
my_remove_element_n(1, [_|Xs], Xs) :- ! .

my_remove_element_n(I, [X|Xs], Resultado):-
          I2 is I - 1,
		  !,
          my_remove_element_n(I2, Xs, Resultado2),
		Resultado = [X|Resultado2].

		
/*13. Determina si un par de elementos son consecutivos.*/
consecut([X,Y|_],X,Y):-!.
consecut([_|Zs],X,Y):-consecut(Zs,X,Y).



/*15. Definir mediante append los predicados:*/
append([],L,L).
append([H|L1],L2,[H|L3])  :-  append(L1,L2,L3).

/*a) reverse(Xs,Ys):- Ys es Xs con los elementos en orden inverso.*/
inversa([],[]).
inversa([X|L1],L2) :-
				inversa(L1,L3),
				append(L3,[X],L2).


/*d) primeros(Xs,Ys):- Ys es el resultado de eliminar el último elemento a Xs.*/
primeros([X|Xs], Ys) :- primeros(Xs, Ys, X).            
primeros([], [], _).
primeros([X1|Xs], [X0|Ys], X0) :- primeros(Xs, Ys, X1).


/*16. Construir la definición del predicado maximo(Xs,M) 
que se cumple si M es el máximo de los elementos de Xs.*/           
maximo([X],X):-!.
maximo([X,Y|M],X) :- maximo([Y|M],Z),X >= Z.
maximo([X|M],Z) :- maximo(M,Z), Z > X.
 


