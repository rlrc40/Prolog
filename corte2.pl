/*Cortes Ejercicio 1 Suma*/
suma([],0) :- !.

suma([X|Xs],S) :- 
	suma(Xs,Sc),
	S is Sc+X.
	
suma2([],0).

suma2([X|Xs],S) :- 
	suma(Xs,Sc),
	S is Sc+X.
	
	
/*2. Construye una lista con todos los elementos que se encuentran antes de un 
cierto elemento en una lista dada.*/
siete(X, [X|_], Zs) :- !.
siete(X, [Y|Ys], [Y|Zs]) :- siete(X,Ys,Zs).

/*3. Eliminar el enesimo elemento.*/  
my_remove_element_n(1, [_|Xs], Xs).

my_remove_element_n(I, [X|Xs], [X|Ys]):-
          I2 is I - 1,
          my_remove_element_n(I2, Xs, Ys).
		  
my_remove_element_n2(1, [_|Xs], Xs) :- !.

my_remove_element_n2(I, [X|Xs], [X|Ys]):-
          I3 is I - 1,
		  !,
          my_remove_element_n2(I3, Xs, Ys).
		  
		  
/*4. Calcula el máximo elemento de una lista numérica.*/
list_max(M, [X|Xs]):-
          list_max2(M, X, Xs).

list_max2(M, M, []):- !.

list_max2(X, Y, [Z|Zs]):-
          Z >= Y,
          !,
          list_max2(X, Z, Zs).

list_max2(X, Y, [Z|Zs]):-
          Z =< Y,
          list_max2(X, Y, Zs).		

		  
		  
list_max3(M, [X|Xs]):-
          list_max4(M, X, Xs).
		  
list_max4(M, M, []).

list_max4(X, Y, [Z|Zs]):-
          Z >= Y,
          list_max4(X, Z, Zs).

list_max4(X, Y, [Z|Zs]):-
          Z =< Y,
          list_max4(X, Y, Zs).			  
		  
		  
		  
		  
/* número decimal a binario en forma de lista. 

Cociente y el resto entre dos números positivos*/

cociente(0,N,0,0):-!.
cociente(Dividendo,Divisor,Cociente,Resto):- Cociente is Dividendo//Divisor,
												T is Cociente * Divisor,
												Resto is Dividendo - T.

/*Concatena dos listas*/

concatenar([],L,L).
concatenar([X|Xs],L,[X|Zs]):-concatenar(Xs,L,Zs).


dec_bin(1,[1]):- !.
dec_bin(0,[]):- !.
dec_bin(N,S):-cociente(N,2,C,R),dec_bin(C,T),concatenar(T,[R],S),!.


/*familia*/
familia(persona(juan,perez,5000),
		persona(maria,alonso,10000),
		[persona(carlos,perez,0),persona(andres,perez,0),persona(elena,perez,200)]).

familia(persona(pedro,lopez,25000),
		persona(carmen,ruiz,15000),
		[persona(carlos,lopez,1000),persona(teresa,lopez,0)]).

persona(Nom, Ape, Suel) :- 
						familia(persona(Nom, Ape, Suel),_,_);
						familia(_,persona(Nom, Ape, Suel),_);
						familia(_, _, [persona(Nom, Ape, Suel)|Xs]);
						familia(_, _, [X,persona(Nom, Ape, Suel)|Xs]);
						familia(_, _, [X,Y,persona(Nom, Ape, Suel)|Xs]);
						familia(_, _, [X,Y,Z,persona(Nom, Ape, Suel)|Xs]).
						
						/*familia(_, _, [X|Xs]) :- familia(_, _, [Xs]).*/
											
						

						
						
		
sueldo(persona(Nom,Ape,S),S) :- persona(Nom,Ape,S).

total([],0).
total([H,M|S],I) :- sueldo(H,Y1),
					total(L,Y2),
					I is Y1 + Y2.	  
		  
/*familia(persona(pedro,lopez,Sueldo),
		Esposa,Hijos),
		total([persona(pedro,lopez,Sueldo),Esposa|Hijos],Ingresos).*/

familia(persona(Nom,Ape,Sue),Esposa,Hijos),
		total([persona(Nom,Ape,Sue),Esposa|Hijos],Ingresos) :- 
			familia(persona(Nom, Ape, Sue), Esposa, Hijos),
			total([persona(Nom,Ape,Sue),Esposa|Hijos],Ingresos).
			
total([persona(Nom,Ape,Sue),Esposa|Hijos],Ingresos) :- 
	
		  
		  
		  
		  