accede_a(pag_principal, formacion).
accede_a(pag_principal, integrar_sistemas).
accede_a(formacion, creatividad).
accede_a(formacion, innovacion).
accede_a(integrar_sistemas, calidad).
accede_a(integrar_sistemas, medio_ambiente).
accede_a(creatividad, que_es).
accede_a(creatividad, guia).
accede_a(guia, que_es_una_idea).
accede_a(guia, como_tener_ideas).
accede_a(calidad, iso_9004).
accede_a(iso_9004, sistema_gestion).
accede_a(iso_9004, recursos).


lleva_a(P1, P2, 1) :- accede_a(P1, P2).
lleva_a(P1, Pn, Clicks) :- 
	accede_a(P1, P2),
	lleva_a(P2, Pn, Clicks2),
	Clicks is Clicks2 + 1;
				 
