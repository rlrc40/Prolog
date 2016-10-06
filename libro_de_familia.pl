libro_de_familia(
esposo(nombre(antonio,garcia,fernandez), profesion(arquitecto), salario(30000)),
esposa(nombre(ana,ruiz,lopez), profesion(docente), salario(12000)),
domicilio(sevilla)).

libro_de_familia(
esposo(nombre(luis,alvarez,garcia), profesion(arquitecto), salario(40000)),
esposa(nombre(ana,romero,soler), profesion(sus_labores), salario(0)),
domicilio(sevilla)).

libro_de_familia(
esposo(nombre(bernardo,bueno,martinez), profesion(docente), salario(12000)),
esposa(nombre(laura,rodriguez,millan), profesion(medico), salario(25000)),
domicilio(cuenca)).

libro_de_familia(
esposo(nombre(miguel,gonzalez,ruiz), profesion(empresario), salario(40000)),
esposa(nombre(belen,salguero,cuevas), profesion(sus_labores), salario(0)),
domicilio(dos_hermanas)).

trabaja_en(X, Y):-
	libro_de_familia(
	esposo(X, profesion(Y), _),
	_,
	_);
	
	libro_de_familia(
	_,
	esposa(X, profesion(Y), _),
	_).
	
ingresos_totales(S1,S2,Ing):-
	libro_de_familia(
	esposo(_, _, salario(S1)),
	esposa(_,_, salario(S2)),
	_),
	Ing is S1+S2.
	
ganan_mas_de(X, Y):-
	libro_de_familia(
	esposo(X, _, salario(C)),
	_,
	_),
	Y<C;
	libro_de_familia(
	_,
	esposa(X, _, salario(C)),
	_),
	Y<C.
	
ganan_menos_de(X, Y):-
	libro_de_familia(
	esposo(X, _, salario(C)),
	_,
	_),
	Y>C;
	libro_de_familia(
	_,
	esposa(X, _, salario(C)),
	_),
	Y>C.
	
