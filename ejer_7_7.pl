%transportes
transporte(roma,200).
transporte(londres,250).
transporte(tunez,150).

%alojamientos
alojamiento(hotel, roma, 250).
alojamiento(hotel, londres, 150).
alojamiento(hotel, tunez, 100).
alojamiento(hostal, roma, 150).
alojamiento(hostal, londres, 100).
alojamiento(hostal, tunez, 80).
alojamiento(camping, roma, 100).
alojamiento(camping, londres, 50).
alojamiento(camping, tunez, 50).

viaje(Ciudad, Alojamiento, Noches, Precio) :-
	transporte(Ciudad, DineroT),
	alojamiento(Alojamiento, Ciudad, DineroA),
	suma(DineroT, DineroA, Noches, Precio).
	
suma(DineroT, DineroA, Noches, Precio) :-
	Precio is ((DineroA*Noches)+DineroT).
	
viajes_desde(Ciudad, Alojamiento, Noches, Maxdinero) :-
	transporte(Ciudad, DineroT),
	alojamiento(Alojamiento, Ciudad, DineroA),
	suma(DineroT, DineroA, Noches, Precio),
	menor(Precio, Maxdinero).
	
menor(X, Y):- 
    X < Y.
