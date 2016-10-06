es_un(mamifero, animal).
es_un(vaca, mamifero).
es_un(rosenda, vaca).
es_un(oveja, mamifero).
es_un(catalina, oveja).

es_un(ave, animal).
es_un(gorrion, ave).
es_un(gorriolin2, gorrion).
es_un(gorriolin1, gorrion).
es_un(piolin, canario).
es_un(canario, ave).

color(rosenda, amarillo).
color(piolin, amarillo).
color(gorriolin1, marron).
color(Animal, Color) :- color(Animal, Color).

come(Animal, hierba) :- pertenece(Animal, vaca).

da(mamifero,leche). 
da(oveja, lana).
da(Animal, X) :- da(Animal, X).


canta(Animal, bien) :- pertenece(Animal, canario).


patas(Animal, cortas) :- pertenece(Animal, gorrion).


pone(Animal, huevos) :- pertenece(Animal, ave).


tiene(Animal, plumas) :- pertenece(Animal, ave).


vuela(Animal, bien) :- pertenece(Animal, ave).

puede(Animal, respirar) :- pertenece(Animal, animal).


pertenece(Animal, Animal2) :- es_un(Animal, Animal2).
pertenece(Animal, Animal3) :- 
	es_un(Animal, Animal2),
	pertenece(Animal2, Animal3).

