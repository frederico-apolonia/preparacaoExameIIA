/* Exercise 3.2: Dolls
 * First, write a knowledge base using the predicate directlyIn/2 
 * which encodes which doll is directly contained in which other doll. 
 */

/* Knowledge base */
directlyIn(irina, natasga).
directlyIn(natasha, olga).
directlyIn(olga, katarina).
/* Then, define a recursive predicate in/2 , that tells us which doll
 * is (directly or indirectly) contained in which other dolls.
*/
in(X, Y) :- directlyIn(X, Y),!.
in(X, Y) :-
    directlyIn(X, Z),
    in(Z, Y).