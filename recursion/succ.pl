/* Example 3: succ */
numeral(0). 
numeral(succ(X))  :-  numeral(X).

add(0, Res, Res).
add(succ(X), Y, Res) :- add(X, Y, Res).
/* quando aparece 0 é como se fosse [] */

/* Exercise: Define a predicate greater_than/2 that
 * takes two numerals in the notation that we introduced
 * in the text (that is, 0, succ(0), succ(succ(0)), and so on)
 * as arguments and decides whether the first one is greater 
 * than the second one. 
 */
greater_than(succ(_), 0).
greater_than(succ(X), succ(Y)) :- greater_than(X, Y).