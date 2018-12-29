/* Knowledge base */
directlyIn(irina, natasga).
directlyIn(natasha, olga).
directlyIn(olga, katarina).

in(X, Y) :- directlyIn(X, Y),!.
in(X, Y) :-
    directlyIn(X, Z),
    in(Z, Y).