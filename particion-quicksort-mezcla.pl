/* particion(X,Xs,Px,Gs) :- Ps contiene los elementos de Xs más pequeños 
que X y Gs los elementos de Xs más grandes o iguales que X. */

particion(X,[Y|Ys],[Y|Ps],Gs):- Y < X,
				particion(X,Ys,Ps,Gs).

particion(X,[Y|Ys],Ps,[Y|Gs]):- Y >= X,
				particion(X,Ys,Ps,Gs).

particion(X,[],[],[]).


/* quicksort(Xs,Ys):- Ys contiene los elementos de Xs en orden ascendente 
(algoritmo quicksort)  */

quicksort([],[]).

quicksort([X|Xs],Ys):-
			particion(X,Xs,Ps,Gs),
			quicksort(Ps,Ps0),
			quicksort(Gs,Gs0),
			append(Ps0,[X|Gs0],Ys).


/* mezcla(Xs,Ys,Zs):- Zs es una lista ordenada formada 
a partir de las listas ordenadas Xs e Ys  */


mezcla(Xs,[],Xs).
mezcla([],[Y|Ys],[Y|Ys]).

mezcla([X|Xs],[Y|Ys],[X|Zs]):-X < Y,
				mezcla(Xs,[Y|Ys],Zs).
				
mezcla([X|Xs],[Y|Ys],[Y|Zs]):-X >= Y,
				mezcla([X|Xs],Ys,Zs).

