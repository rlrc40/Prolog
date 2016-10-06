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
	
/*(1) Añadir lo conveniente para preguntar quien tiene una determinada profesión.*/
profesion(Pers, Prof) :- 
	libro_de_familia(esposo(Pers, profesion(Prof),_),_,_);
	libro_de_familia(_,esposa(Pers, profesion(Prof),_),_).
	
/*(2) Completar el programa para poder consultar cuáles son los ingresos totales de una familia.*/
ingresos(Nom, Ing_totales) :- 
	libro_de_familia(esposo(Nom,_,salario(S1)), esposa(_,_,salario(S2)),_),
	Ing_totales is S1 + S2.
		
/*(3) Hacer lo mismo de manera que sepamos qué personas ganan más de una determinada cantidad.*/
ingresos_mayor_que(Nom, Min_ing) :- 
	libro_de_familia(esposo(Nom,_,salario(S1)), esposa(_,_,salario(S2)),_),
	Ing_totales is S1 + S2,
	mayor(Ing_totales, Min_ing).
	
mayor(Ing_totales, Min_ing) :-
	Ing_totales > Min_ing.

/*(4) Y qué personas ganan menos de una determinada cantidad.*/
ingresos_menor_que(Nom, Min_ing) :- 
	libro_de_familia(esposo(Nom,_,salario(S1)), esposa(_,_,salario(S2)),_),
	Ing_totales is S1 + S2,
	menor(Ing_totales, Min_ing).
	
menor(Ing_totales, Min_ing) :-
	Ing_totales < Min_ing.






