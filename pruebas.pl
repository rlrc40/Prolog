/*familia*/
familia(persona(juan,perez,5000),
		persona(maria,alonso,10000),
		[persona(carlos,perez,0),persona(andres,perez,0),persona(elena,perez,200)]).

familia(persona(pedro,lopez,25000),
		persona(carmen,ruiz,15000),
		[persona(carlos,lopez,1000),persona(teresa,lopez,0)]).					
		
sueldo(persona(_,_,S),S).

total([persona(_,_,S)],S).
total([persona(_,_,S),M|H],Ing) :-
	total([M|H],Ing2),
	Ing is Ing2+S.

/*familia(persona(pedro,lopez,Sueldo),Esposa,Hijos),
		total([persona(pedro,lopez,Sueldo),Esposa|Hijos],Ingresos).*/
		
		
		
		
elemento_n(1, [X|_], X).
elemento_n(N, [_|Ys], X) :-
	N2 is N-1,
	elemento_n(N2, Ys, X).
	
elemento_en(1,[X|_],X).
elemento_en(K,[_|L],X) :-
	K > 1,
	K1 is K-1,
	elemento_en(K1,L,X).
	
max([], _).

max([X|Xs], Y) :- 
	max(Xs, X),
	X>Y.
max([X|Xs], Y) :-
	max(Xs, Y),
	Y>X.
	
maximo([X],X):-!.
maximo([X,Y|M],X) :- maximo([Y|M],Z),X >= Z.
maximo([X|M],Z) :- maximo(M,Z), Z > X.

							
