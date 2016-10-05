encima(bombilla, coche).
encima(coche,tortuga).
derecha_de(llave,tortuga).
derecha_de(semaforo,llave).
encima(cafe,semaforo).
encima(lupa,cafe).
derecha_de(martillo,semaforo).
encima(balanza,martillo).

% Caso basico: Momento en que se detiene la computacion.
derecha(X,Y):-derecha_de(X,Y).

% Caso recursivo: Suponiendo que ya se ha solucionado un caso mas simple,
% como descompone el caso actual hasta llegar al caso simple.
derecha(X,Y):-derecha_de(X,Z), derecha(Z,Y).
