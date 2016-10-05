%Mono y banana.
%Raul Rodriguez.


% Se pueden dar 13 estados diferentes.
estado(enlapuerta,sobreelpiso,ventana,noletiene).
estado(enlapuerta,sobreelpiso,enmedio,noletiene).
estado(enlapuerta,sobreelpiso,enlapuerta,noletiene).

estado(enlapuerta,sobrelacaja,enlapuerta,noletiene).

estado(enmedio,sobreelpiso,ventana,noletiene).
estado(enmedio,sobreelpiso,enlapuerta,noletiene).
estado(enmedio,sobreelpiso,enmedio,noletiene).

estado(enmedio,sobrelacaja,enmedio,noletiene).
estado(enmedio,sobrelacaja,enmedio,siletiene).

estado(ventana,sobreelpiso,ventana,noletiene).
estado(ventana,sobreelpiso,enlapuerta,noletiene).
estado(ventana,sobreelpiso,enmedio,noletiene).

estado(ventana,sobrelacaja,ventana,noletiene).

%Movimientos.

% Agarrar el platano.
mover(estado(enmedio, sobrelacaja, enmedio, noletiene),
agarrarplatano,
estado(enmedio, sobrelacaja, enmedio, siletiene)).

% Subir a la caja.
mover(estado(P, sobreelpiso, P, H),
subiralacaja,
estado(P, sobrelacaja, P, H)).

% Empujar la caja de P1 a P2.
mover(estado(P1, sobreelpiso, P1, H), 
empujar(P1, P2), 
estado(P2, sobreelpiso, P2, H)).

% Caminar de P1 a P2.
mover(estado(P1, sobreelpiso, B, H),
caminar(P1, P2), 
estado(P2, sobreelpiso, B, H)).



% Resolver si el mono no tiene el plantano.

% Caso_1 : El mono ya tiene el platano.
puedetener(estado(_, _, _, siletiene)).

% Caso_2 : El mono debe realizar alguna actividad para tener el platano.
puedetener(S1) :- mover(S1, M, S2), 
puedetener(S2).

