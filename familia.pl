/*familia*/
familia(persona(juan,perez,5000),
		persona(maria,alonso,10000),
		[persona(carlos,perez,0),persona(andres,perez,0),persona(elena,perez,200)]).

familia(persona(pedro,lopez,25000),
		persona(carmen,ruiz,15000),
		[persona(carlos,lopez,1000),persona(teresa,lopez,0)]).					
		
sueldo(persona(_,_,S),S).

total([persona(_,_,Z)],Z).
total([persona(_,_,Z),E|H],I):-total([E|H],I1),I is Z+I1.	  
		  
/*familia(persona(pedro,lopez,Sueldo),Esposa,Hijos),
		total([persona(pedro,lopez,Sueldo),Esposa|Hijos],Ingresos).*/

