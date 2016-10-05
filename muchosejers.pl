/*1-Determina si lo que recibe es una lista*/

lista([]):-!.
lista([X|Y]):-lista(Y).
/*------------------------------------------------------------------*/

/*2-Concatena dos listas*/

concatenar([],L,L).
concatenar([X|M],L,[X|Z]):-concatenar(M,L,Z).
/*------------------------------------------------------------------*/

/*3-Invierte la lista que recibe en el primer nivel*/

invertir([X],[X]).
invertir([X|M],Z):-invertir(M,S), concatenar(S,[X],Z).
/*------------------------------------------------------------------*/

/*4-Calcula la longitud de la lista*/

long([],0):-!.
long([X|Y],S):-long(Y,T),!, S is T + 1.
/*------------------------------------------------------------------*/

/*5-Suma los elementos de la lista*/

suma_elem([X],X):-!.
suma_elem([X|Y],S):-suma_elem(Y,T), S is T + X.
/*------------------------------------------------------------------*/

/*6-Devuelve el elemento que se encuentra en la enesima posicion*/

posicion_n([],N,[]):-!.
posicion_n([X|N],1,X):-!.
posicion_n([X|R],N,S):-M is N - 1,posicion_n(R,M,S).
/*------------------------------------------------------------------*/

/*7-Dan como resultado el primer y el ultimo elemento de la lista*/

primer_elem([X|Y],X):-!.

ultimo_elem(L,S):-invertir(L,T),primer_elem(T,S).
/*------------------------------------------------------------------*/

/*8-Calcula la primer posicion donde aparece el elemento X en la lista*/

prim_pos(X,[],0):-!.
prim_pos(X,[X|M],1):-!.
prim_pos(X,[Y|M],S):-prim_pos(X,M,T),S is T + 1.
/*------------------------------------------------------------------*/

/*9-Elimina el elemento x de la lista en todos los niveles*/

elimina_x([],X,[]):-!.
elimina_x([X],X,[]):-!.
elimina_x([X|M],X,S):-elimina_x(M,X,S),!.
elimina_x([R|M],X,S):-lista(R), elimina_x(R,X,T), elimina_x(M,X,P), concatenar([T],P,S).
elimina_x([R|M],X,S):-elimina_x(M,X,T), concatenar([R],T,S).
/*------------------------------------------------------------------*/

/*10-Invierte una lista en todos sus niveles*/

invertir_tot([],[]):-!.
invertir_tot([X|M],S):-lista(X),invertir_tot(X,P),invertir_tot(M,T),concatenar(T,[P],S).
invertir_tot([X|M],S):-invertir_tot(M,T),concatenar(T,[X],S),!.
/*------------------------------------------------------------------*/

/*11-Saca los n primeros elementos de una lista y devuelve el resto*/

sac_n_pri([],N,[]):-!.
sac_n_pri([X|M],1,M):-!.
sac_n_pri([X|M],N,S):-N1 is N-1,sac_n_pri(M,N1,S).
/*------------------------------------------------------------------*/

/*12-Da como resultado los n primeros elementos de una lista*/

da_n_pri(L,0,[]):-!.
da_n_pri([],N,[]):-!.
da_n_pri([X|M],1,[X]):-!.
da_n_pri([X|M],N,S):-N1 is N - 1,da_n_pri(M,N1,T),concatenar([X],T,S).
/*------------------------------------------------------------------*/

/*13-Muestra los ultimos n elementos de la lista*/

da_n_ultim(L,N,S):-invertir_tot(L,T),da_n_pri(T,N,R),invertir_tot(R,S).
/*------------------------------------------------------------------*/

/*14-Determina si dos listas son iguales en todos los niveles*/

lista_igual([],[]):-!.
lista_igual([X|M],[X|R]):-lista_igual(M,R).
lista_igual([X|M],[T|R]):-lista(X), lista(T), lista_igual(X,T),lista_igual(M,R).
/*------------------------------------------------------------------*/

/*15-Determina si la primer lista es prefijo de la segunda*/

prefijo([],M):-!.
prefijo([X],[X|M]):-!.
prefijo([X|L],[X|M]):-prefijo(L,M).
prefijo([X|T],[L|M]):-lista(X),prefijo(X,L),prefijo(T,M).
/*------------------------------------------------------------------*/

/*16-Determina si la primer lista es sublista de la segunda*/
sublista([],L):-!.
sublista(L,[X|M]):-prefijo(L,[X|M]).
sublista(L,[X|M]):-lista(X), sublista(L,X).
sublista(L,[X|M]):-sublista(L,M).
/*------------------------------------------------------------------*/

/*17-Elimina todos los elementos de la lista 1 que est n en la 2*/

elim_l1_de_l2([],L,L):-!.
elim_l1_de_l2([X|M],L,S):-elimina_x(L,X,T),elim_l1_de_l2(M,T,S).
/*------------------------------------------------------------------*/

/*18-Elimina los elementos repetidos que est n en una lista*/

elim_repet([],[]):-!.
elim_repet([X|M],S):-not lista(X), elimina_x(M,X,T),elim_repet(T,Y),
             concatenar([X],Y,S).
elim_repet([X|M],S):-lista(X), elim_l1_de_l2(X,M,T),elim_repet(X,Y),    
             elim_repet(T,J),concatenar([Y],J,S).
/*------------------------------------------------------------------*/

/*19-Arma una lista con todos los elementos que se encuentran antes */
/*de elemento x en la lista*/

hasta_x([X|M],X,[]):-!.
hasta_x([Y|M],X,[Y|S]):-hasta_x(M,X,S).
/*------------------------------------------------------------------*/

/*20-Arma una lista con todos los elementos que se encuentran despues*/
/*del elemento x*/

desde_x([Y|M],X,S):-X=\=Y,desde_x(M,X,S),!.
desde_x([X,Y|M],X,[Y|M]):-X=\=Y,!.
desde_x([Y|M],X,S):-desde_x(M,X,S),!.
/*------------------------------------------------------------------*/

/*21-Determina si una lista se encuentra en orden creciente o decreciente*/


creciente([X,Y|Z]):- X
             creciente([Y|Z]).
creciente([X]).

decreciente([X,Y|Z]):- X>Y,
               decreciente([Y|Z]).
decreciente([X]).
/*------------------------------------------------------------------*/

/*22-Cuenta la ocurrencia de una lista at¢mica en otra lista*/

secuencia([],L,L):-!.
secuencia([X|Y],[X|L],[X|L]):-secuencia(Y,L,L).

cta_ocurr(L,[],0):-!.
cta_ocurr([X|Y],[X|M],N):-secuencia(Y,M,L1), cta_ocurr([X|Y],L1,T), N is T + 1.
cta_ocurr([X|Y],[R|M],N):-cta_ocurr([X|Y],M,N),!.
/*------------------------------------------------------------------*/

/*23-Determina si una lista puede analizarse del derecho o del rev‚s*/

reversible([]):-!.
reversible(L):-invertir(L,R),lista_igual(L,R).
/*------------------------------------------------------------------*/


/*24-Calcula la cantidad de elementos que se encuentran en la misma*/
/*posicion en dos listas*/

orden(L,[],0):-!.
orden([],L,0):-!.
orden([X],[X],1):-!.
orden([X|Y],[X|Z],S):-orden(Y,Z,T),!, S is T+1.
orden([X|Y],[R|Z],S):-orden(Y,Z,S).
/*------------------------------------------------------------------*/
/*25-Arma una lista con todas las posiciones del elemento X en la lista*/

list_posic(X,[],N,[]):-!.
list_posic(X,[X|M],N,L):-N1 is N + 1,list_posic(X,M,N1,G),P is N + 1,
            concatenar([P],G,L).
list_posic(X,[Y|M],N,L):-N1 is N + 1,list_posic(X,M,N1,L).

concatenar([],L,L):-!.
concatenar([X|Y],L,[X|Z]):-concatenar(Y,L,Z).
/*------------------------------------------------------------------*/

/*26-Arma una lista con la primera posicion de cada elemento de l1 en l2*/

posic_l1_l2([],L,[]):-!.
posic_l1_l2([X|Y],L,F):-posic_l1_l2(Y,L,L2),prim_pos(X,L,S),concatenar([S],L2,F).
/*------------------------------------------------------------------*/

/*27-Arma una lista con todos los elementos en secuencia creciente a partir */
/*de X*/

mayores(X,[],[]).
mayores(X,[Y|M],[Y|S]):-X=
mayores(X,[Y|M],S):-mayores(X,M,S).
/*------------------------------------------------------------------*/

/*28-Arma una lista en orden decreciente a partir del elemento  X*/

menores(X,[],[]).
menores(X,[Y|Z],[Y|R]):-X>=Y,menores(Y,Z,R).
menores(X,[Y|Z],R):-menores(X,Z,R).
/*------------------------------------------------------------------*/
/*29-Arma una lista con todos los elementos menores que el elemento X*/

menores_x(X,[],[]):-!.
menores_x(X,[Y|W],[Y|Z]):-X>Y,menores_x(X,W,Z),!.
menores_x(X,[Y|W],Z):-menores_x(X,W,Z),!.
/*------------------------------------------------------------------*/

/*30-Arma una lista con todos los elementos mayores que el elemento X*/

mayores_x(X,[],[]):-!.
mayores_x(X,[Y|W],[Y|Z]):-X
mayores_x(X,[Y|W],Z):-mayores_x(X,W,Z),!.
/*------------------------------------------------------------------*/



/*31-Obtener una lista de los elementos menores que X y otra con los */
/* elementos mayores que X*/

obtenerlista(X,L,Men,May):-menores_x(X,L,Men),mayores_x(X,L,May).
/*------------------------------------------------------------------*/
/*32-Arma una lista con las posiciones de la subsecuencia creciente en la*/
/*lista de longitud n*/

long([],0):-!.
long([X|M],S):-long(M,T), S is T+1.

subsec([X|Y],N,L):-mayores(X,[X|Y],S),long(S,N),posic_l1_l2(S,[X|Y],L).
subsec([X|Y],N,L):-subsec(Y,N,L).
/*------------------------------------------------------------------*/

/*33-Calcula el cociente y el resto entre dos números positivos*/

cociente(0,N,0,0):-!.
cociente(N1,N,C,R):-C is N1//N,T is C*N,R is N1-T.
/*------------------------------------------------------------------*/
/*34-Transforma un número decimal a binario en forma de lista*/

dec_bin(1,[1]):-!.
dec_bin(0,[]):-!.
dec_bin(N,S):-cociente(N,2,C,R),dec_bin(C,T),concatenar(T,[R],S),!.
/*------------------------------------------------------------------*/
/*35-Calcula la potencia de un número, N elevado a la N1*/

potencia(0,0,'No se puede calcular'):-!.
potencia(N,0,1):-N=\=0.
potencia(N,N1,S):-N2 is N1 -1,potencia(N,N2,R),!, S is R*N.
/*------------------------------------------------------------------*/
/*36-Transforma un número de binario a decimal*/

bin_dec([],0):-!.
bin_dec([0|Y],S):-bin_dec(Y,S).
bin_dec([1|Y],S):-long(Y,N), potencia(2,N,T),bin_dec(Y,R),!, S is T+R.

/*------------------------------------------------------------------*/

/*37-Cuenta la cantidad de veces que ocurre un elemento en una lista en*/
/*todos los niveles*/

ocurre(X,[],0):-!.
ocurre(X,[X|L],S):-ocurre(X,L,T),!,S is T+1.
ocurre(X,[Z|L],S):-lista(Z),ocurre(X,Z,T),ocurre(X,L,R),!,S is R+T.
ocurre(X,[Z|L],S):-X=\=Z,ocurre(X,L,S),!.
/*------------------------------------------------------------------*/
/*38-Elimina elementos que se encuentran en la misma posici¢n en dos */
/*lista, inclusive sublistas y devuelve las dos sublistas*/

elim_igual_posic([],L,[],L):-!.
elim_igual_posic(L,[],L,[]):-!.
elim_igual_posic([X|M],[X|L],S1,S2):-elim_igual_posic(M,L,S1,S2).
elim_igual_posic([X|M],[Z|L],[X|S1],[Z|S2]):-not lista(Z), not lista(X)
                   ,X=\=Z,elim_igual_posic(M,L,S1,S2).
elim_igual_posic([X|M],[Z|L],[X|S1],[Z|S2]):-elim_igual_posic(M,L,S1,S2),!.
/*------------------------------------------------------------------*/

/*39-Elimina el elemento que se encuentra en la en‚sima posici¢n*/

sacapos([X|Y],1,Y):-!.
sacapos([X|Y],N,[X|R]):-N1 is N-1, sacapos(Y,N1,R).
/*------------------------------------------------------------------*/

/*40-Cuenta los elementos que se encuentran en dos listas en diferente */
/*posiciones*/

desord([],L,N,0).
desord([X|Y],L,P,S):-sacapos(L,P,L1), ocurre(X,L1,S1), P1 is P+1,
             desord(Y,L,P1,R), S is S1 + R.

examina(L1,L2,D,S):-desord(L1,L2,1,D),orden(L1,L2,S).
/*------------------------------------------------------------------*/
/*41-Reemplaza la aparici¢n de un elemento x en una lista, en todos los*/
/*niveles, por otro elemento y*/

reemplazar(X,Y,[],[]):-!.
reemplazar(X,Y,[X|M],[Y|Z]):-reemplazar(X,Y,M,Z),!.
reemplazar(X,Y,[L|M],Z):-reemplazar(X,Y,L,T),reemplazar(X,Y,M,R),!,
                 concatenar([T],R,Z).
reemplazar(X,Y,[L|M],[L|Z]):-reemplazar(X,Y,M,Z),!.
/*------------------------------------------------------------------*/
/*42-Da como resultado una lista, que es la intersecci¢n de las dos*/

interseccion(L,[],[]):-!.
interseccion([],L,[]):-!.
interseccion([X|L],[X|H],[X|Z]):-interseccion(L,H,Z),!.
interseccion([X|L],[R|H],[X|Z]):-pert(X,H),elim_prim_pos(X,[R|H],L2),
                 interseccion(L,L2,Z),!.
interseccion([X|L],[R|H],Z):-interseccion(L,[R|H],Z),!.
/*------------------------------------------------------------------*/
/*43-Elimina el primer elemento X que aparece en la lista*/

elim_prim_pos(X,[],[]):-!.
elim_prim_pos(X,[X|M],M):-!.
elim_prim_pos(X,[R|M],[R|L]):-elim_prim_pos(X,M,L).
/*------------------------------------------------------------------*/
/*44-Determina si un elemento X pertenece a una lista*/

pert(X,[X|M]):-!.
pert(X,[R|M]):-pert(X,M).
/*------------------------------------------------------------------*/
/*45-Genera una  lista de  tomos a partir de una lista anidada*/

lista_atomos([],[]):-!.
lista_atomos([X|M],[X|Z]):-not lista(X), lista_atomos(M,Z),!.
lista_atomos([X|M],Z):-lista(X),lista_atomos(X,L),lista_atomos(M,M1),!,
               concatenar(L,M1,Z).
/*------------------------------------------------------------------*/


/*46-Arma dos listas con los elementos que se encuentran a la izquierda*/
/* y a la derecha del elemento x */

izq_der_x(X,[],[],[]):-!.
izq_der_x(X,[X|M],[],M):-!.
izq_der_x(X,[R|M],[R|L],F):-R=\=X,izq_der_x(X,M,L,F).
/*------------------------------------------------------------------*/
/*47-Ordena una lista en orden ascendente*/

ord_ascend([],[]):-!.
ord_ascend(L,R):-maximo(L,X),elim_prim_pos(X,L,L1),ord_ascend(L1,L2),!,
         concatenar(L2,[X],R).
/*------------------------------------------------------------------*/
/*48-Ordena una lista en orden descendente*/

ord_descend(L,L2):-ord_ascend(L,L3),invertir(L3,L2).

/*------------------------------------------------------------------*/
/*49-Calcula el maximo elemento de una lista*/

maximo([X],X):-!.
maximo([X,Y|M],X):-maximo([Y|M],Z),X>=Z.
maximo([X|M],Z):-maximo(M,Z),Z>X.
/*------------------------------------------------------------------*/
/*50-Elimina las apariciones de X en el primer nivel*/

elimina_x([],X,[]):-!.
elimina_x([X|M],X,Z):-elimina_x(M,X,Z),!.
elimina_x([R|M],X,[R|Z]):-elimina_x(M,X,Z),!.
/*------------------------------------------------------------------*/
/*51-Elimina una sublista L de la lista L1 */

elim_subl([],L,[]):-!.
elim_subl(L1,L,Z):-long(L,N),da_n_pri(L1,N,L2),L2=L,sac_n_pri(L1,N,L3),
           elim_subl(L3,L,Z),!.
elim_subl([X|Y],L,[X|Z]):-elim_subl(Y,L,Z),!.
/*------------------------------------------------------------------*/
/*52-Determina si dos conjuntos son iguales*/

conj_igual([],[]):-!.
conj_igual([X|Y],L):-pert(X,L),elim_prim_pos(X,L,L1), conj_igual(Y,L1).
conj_igual([X|Y],L):-lista(X), sublista(X,L),elim_subl(X,L,L1),conj_igual(Y,L1).
/*------------------------------------------------------------------*/
/*53-Arma una lista de n elementos, los mayores de la lista*/

n_mayores(L1,N,L):-ord_descend(L1,L2),da_n_pri(L2,N,L). 
/*------------------------------------------------------------------*/
/*54-Devuelve una lista con la diferencia entre dos conjuntos*/

dif_conj(L,[],L):-!.
dif_conj([],L,L):-!.
dif_conj([X|Y],L,[X|P]):-not pert(X,L), dif_conj(Y,L,P),!.
dif_conj([X|Y],L,P):-pert(X,L),elim_prim_pos(X,L,L1),dif_conj(Y,L1,P),!.
/*------------------------------------------------------------------*/


/*55-Inserta un elemento en la posicion en‚sima*/

insertar(L,1,X,[X|L]):-!.
insertar([X|Y],N,R,[X|L]):-N1 is N-1, insertar(Y,N1,R,L).
/*------------------------------------------------------------------*/
/*56-Calcula la posicion del último elemento n*/

posult(L,X,N):-invertir(L,L1), prim_pos(X,L1,T), long(L1,M),N is M-T.
/*------------------------------------------------------------------*/
/*57-Reemplaza el elemento en‚simo*/

reemp_n([X|Y],1,L,[L|Y]):-!.
reemp_n([X|Y],N,L,[X|Y1]):-N1 is N-1, reemp_n(Y,N1,L,Y1).
/*------------------------------------------------------------------*/
/*58-Arma una lista de N elementos a partir de la posici¢n P*/

tomarN_desd_P(L,0,N,L1):-da_n_pri(L,N,L1).
tomarN_desd_P([X|Y],P,N,L1):-P1 is P-1,tomarN_desd_P(Y,P1,N,L1).
/*------------------------------------------------------------------*/
/*59-Determina si un par de elementos son consecutivos*/

consecut([X,Y|M],X,Y):-!.
consecut([R|M],X,Y):-consecut(M,X,Y).
/*------------------------------------------------------------------*/
/*60-Arma una lista con los elementos duplicados que se encuentran en */
/*una lista*/

lista_dup([],[]):-!.
lista_dup([X|L],[X|Y]):-pert(X,L),elim_prim_pos(X,L,L1),lista_dup(L1,Y),!.
lista_dup([X|L],Y):-lista_dup(L,Y),!.
/*------------------------------------------------------------------*/
/*61-Arma una lista con todos los elementos que se encuentran dentro del*/
/*intervalo*/

interval([],N1,N2,[]):-!.
interval([X|Y],N1,N2,[X|L]):-X>=N1,X=
interval([X|Y],N1,N2,L):-interval(Y,N1,N2,L),!.
/*------------------------------------------------------------------*/

/*62-Determina si una lista se encuentra ordenada segun, m ximo, m¡nimo,*/
/*meseta o sin orden*/

identif(X,maximo):- esmaximo(X),!.
identif(X,minimo):- esminimo(X),!.
identif(X,meseta):- esmeseta(X),!.
identif(X,sinorden):-!.

esmaximo([X,Y|Z]):- X
            esmaximo([Y|Z]).
esmaximo([X,Y|Z]):- X>Y,
            decreciente([Y|Z]).

esminimo([X,Y|Z]):- X>Y,    
            esminimo([Y|Z]).
esminimo([X,Y|Z]):- X
            creciente([Y|Z]).

esmeseta([X,Y,Z|W]):- X
              esmeseta([Y,Z|W]).
esmeseta([X,Y,Z|W]):- X=Y,Y=Z,
              esmeseta([Y,Z|W]).
esmeseta([X,Y,Z|W]):- X=Y,Y>Z,
              decreciente([Z|W]).
/*------------------------------------------------------------------*/

/*63-Calcula una dieta, ejercicio que est  en un examen*/

alimento(a,posillo_zucaritas,110).
alimento(b,vegetal,155).
alimento(c,posillo_de_leche,660).
alimento(c,huevo_frito,110).
alimento(c,bife_de_vaca,185).
alimento(c,pechuga_de_pollo,185).
alimento(d,helado,330).

plato([1,B,C]):-alimento(A,B,C).

calorias([A,B,C],C):-!.

pertenece(B,[X|L]):- pertenece1(B,X).
pertenece(B,[X|L]):-pertenece(B,L).

pertenece1([V,B,M],[A,B,C]):-!.

suma([],0):-!.
suma([X|L],S):- suma(L,T), calorias(X,R), S is R+T.

insertar(X,[],[X]):-!.
insertar(X,L,[X|L]):-not pertenece(X,L),!.
insertar(X,L,R):-suma_c(X,L,R).

suma_c(X,[R|L],T):-pertenece1(X,R),suma_caloria(X,R,U),concatenar([U],L,T).
suma_c(X,[R|L],[R|T]):-suma_c(X,L,T).

suma_caloria([A,B,C],[R,B,V],[X,B,N]):-N is V+C, X is R+A.

concatenar([],L,L):-!.
concatenar([X|R],L,[X|T]):-concatenar(R,L,T).

arma_dieta(L,L):-suma(L,T),T>2400,T<2800,!.
arma_dieta(L,L1):-suma(L,T),T<2400,plato(X),insertar(X,L,L2),arma_dieta(L2,L1).

arma_dieta1(L,N):-arma_dieta([],L),suma(L,N).
/*------------------------------------------------------------------*/

/*64-Arma una lista con las funciones que son invocadas por una funci¢n*/

invoca(a,[b,c,d]):-!.
invoca(b,[e]):-!.
invoca(d,[f,g,h]):-!.
invoca(X,[]):-!.

invocar([],[]):-!.
invocar([X|Y],S):-invoca(X,T), invocar(Y,N), concatenar([X],[T],D),
                  concatenar([D],N,S).

invoca-a([],[]):-!.
invoca-a(X,S):-invoca(X,P), invocar(P,T), concatenar([X],T,S).
/*------------------------------------------------------------------*/

/*65-Planifica las actividades para la semana, ejercicio de examen*/

genera_univ([universidad,[19,24],lunes]).
genera_univ([universidad,[19,24],miercoles]).
genera_dep([tennis,[10,12],lunes]).
genera_dep([tennis,[10,12],jueves]).
genera_dep([jogging,[12.3,13],lunes]).
genera_idio([ingles,[10.3,12],lunes]).
genera_idio([ingles,[10.3,12],miercoles]).
genera_idio([frances,[8,10],lunes]).
genera_idio([frances,[8,10],miercoles]).

act_posb([A,B,C]):-genera_dep(A),genera_univ(B),genera_idio(C).

posible([],N):-!.
posible([[A,[B,C],D]|M],[R,[F,G],D]):-F>=C,posible(M,[R,[F,G],D]).
posible([[A,[B,C],D]|M],[R,[F,G],D]):-G=
posible([[A,[B,C],D]|M],[R,[F,G],L]):-L\==D,posible(M,[R,[F,G],L]).

compara([A,B,C]):-posible([B,C],A), posible([A,C],B),posible([B,A],C).

plan(A):-act_posb(A),compara(A).
/*------------------------------------------------------------------*/

/*66-Transforma una lista en formato infijo a formato prefijo*/

transforma([Op,Op1,Op2],[A,Op,B]):-lista(Op1),lista(Op2), transforma(Op1,A),
                   transforma(Op2,B).
transforma([A,B,C],[B,A,C]):-not lista(B),not lista(C),!.
/*------------------------------------------------------------------*/

/*67-Ejercicio de examen, decodifica un c¢digo*/

diccionario([codigo([a,b,f],[0,1]),codigo([t,h],[1]),codigo([w,w,a],[1,1])]).

buscar_cod(L,[codigo(L,L2)|M],L2):-!.
buscar_cod(L,[X|M],L2):-buscar_cod(L,M,L2),!.

decodifica([],N,[]):-!.
decodifica(L,N,S):-da_n_pri(L,N,L1),diccionario(L5),buscar_cod(L1,L5,L2),
           sac_n_pri(L,N,L3),decodifica(L3,1,L4),!,concatenar(L2,L4,S).
decodifica(L,N,S):-N1 is N+1, decodifica(L,N1,S).
/*------------------------------------------------------------------*/
/*68-Ordenamiento quicksort de una lista*/

quicksort([],[]):-!.
quicksort([X|Y],L):-obtenerlista(X,Y,Lme,Lma),quicksort(Lme,T),
            quicksort(Lma,R), concatenar(T,[X|R],L).
/*------------------------------------------------------------------*/
/*69-Sumador de numeros binarios*/

and(0,0,0).
and(1,0,0).
and(0,1,0).
and(1,1,1).
or(0,0,0).
or(1,0,1).
or(0,1,1).
or(1,1,1).
xor(0,0,0).
xor(1,0,1).
xor(0,1,1).
xor(1,1,0).

semisum(A,B,Bs,Ba):-and(A,B,Ba),xor(A,B,Bs).

sumcomp(A,B,Ae,Bs,Ba):-semisum(A,B,Bs1,Ba1),semisum(Ae,Bs1,Bs,Ba2),
               or(Ba1,Ba2,Ba).

ultimo([],[]):-!.
ultimo(L,U):-invertir(L,[U|R]).

elim_ulti([X],[]):-!.
elim_ulti(L,L1):-invertir(L,[U|L2]),invertir(L2,L1).

sumador(B1,[],0,B1):-!.
sumador(B1,[],1,B2):-sumador(B1,[1],0,B2).
sumador([],B1,0,B1):-!.
sumador([],B1,1,B2):-sumador([1],B1,0,B2).
sumador(B1,B2,Ba,Bs):-ultimo(B1,Bs1),ultimo(B2,Bs2), sumcomp(Bs1,Bs2,Ba,X,Y),
             elim_ulti(B1,B3),elim_ulti(B2,B5), sumador(B3,B5,Y,BsAux),
             concatenar(BsAux,[X],Bs).

sumadorbinario(B1,B2,B3):-sumador(B1,B2,0,B3),!.
/*------------------------------------------------------------------*/
/*70-Sumador de números binarios (haci‚ndose el b...)*/

sumadorbin(B1,B2,B3):-bin_dec(B1,S),bin_dec(B2,S1),R is S+S1,dec_bin(R,B3).
/*------------------------------------------------------------------*/
/*71-Determina si un  árbol es vacio*/
vacio(aárbol(nil)):-!.
/*------------------------------------------------------------------*/
/*72-Arma una lista con todos los elementos del  árbol*/

elem_aárbol(tree(A,nil,nil),[A]):-!.
elem_aárbol(tree(A,X,nil),S):-elem_aárbol(X,P), concatenar([A],P,S).
elem_aárbol(tree(A,nil,X),S):-elem_aárbol(X,P), concatenar([A],P,S).
elem_aárbol(tree(A,X,Y),S):-elem_aárbol(X,P),elem_aárbol(Y,R),concatenar([A],P,U),
               concatenar(U,R,S).
/*------------------------------------------------------------------*/
/*73-Cuenta la cantidad de elementos que posee el  árbol*/

cant_elem(tree(A,nil,nil),1):-!.
cant_elem(tree(A,X,nil),N):-cant_elem(X,K),N is 1 + K.
cant_elem(tree(A,nil,X),N):-cant_elem(X,K),N is 1 + K.
cant_elem(tree(A,X,Y),N):-cant_elem(X,K),cant_elem(Y,T), N is 1 + K + T.
/*------------------------------------------------------------------*/
/*74-Determina si un  árbol es completo*/

aárbol_comp(tree(A,nil,nil)):-!.
aárbol_comp(tree(A,X,Y)):-porfundidad(X,N),profundidad(Y,M),
             N=:=M,aárbol_comp(X),aárbol_comp(Y),!.
/*------------------------------------------------------------------*/
/*75-Calcula la profundidad del  árbol*/

profundidad(tree(A,nil,nil),0):-!.
profundidad(tree(A,Y,nil),N):-profundidad(Y,B),N is 1 + B.
profundidad(tree(A,nil,X),N):-profundidad(X,B),N is 1 + B.
profundidad(tree(A,Y,X),N):-profundidad(X,B),profundidad(Y,C), mayor(B,C,N).

mayor(B,C,C):-C>=B,!.
mayor(B,C,B).
/*------------------------------------------------------------------*/
/*76-Recorre un  árbol en preorden*/

preorden(aárbol(A,nil,nil),[A]):-!.
preorden(aárbol(A,X,nil),[A|S]):-preorden(X,S),!.
preorden(aárbol(A,nil,X),[A|S]):-preorden(X,S),!.
preorden(aárbol(A,X,Y),[A|S]):-preorden(X,T),preorden(Y,O),!,
                  concatenar(T,O,S).
/*------------------------------------------------------------------*/
/*77-Recorre un  árbol en inorden*/

inorden(aárbol(A,nil,nil),[A]):-!.
inorden(aárbol(A,X,nil),S):-inorden(X,C),concatenar(C,[A],S).
inorden(aárbol(A,nil,X),[A|S]):-inorden(X,S).
inorden(aárbol(A,X,Y),S):-inorden(X,C),inorden(Y,F),concatenar(C,[A],D),
             concatenar(D,F,S).
/*------------------------------------------------------------------*/
/*78-Recorre un  árbol en posorden*/

posorden(aárbol(A,nil,nil),[A]):-!.
posorden(aárbol(A,X,nil),S):-posorden(X,C),concatenar(C,[A],S).
posorden(aárbol(A,nil,X),S):-posorden(X,C),concatenar(C,[A],S).
posorden(aárbol(A,X,Y),S):-posorden(X,C),posorden(Y,F),concatenar(C,F,D),
              concatenar(D,[A],S).
/*------------------------------------------------------------------*/
/*79-Determina si un elemento pertenece a un  árbol*/

pert_aárbol(aárbol(A,X,Y),A):-!.
pert_aárbol(aárbol(A,X,Y),B):-pert_aárbol(X,B),!.
pert_aárbol(aárbol(A,X,Y),B):-pert_aárbol(Y,B),!.
/*------------------------------------------------------------------*/

