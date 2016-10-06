e(pedro).
not e(juan),o(juan).
f(X) :- a(X,ia),l(X).
a(X,Y) :- e(X) ; o(X).
l(X) :- o(X).