tran(eins,one). 
tran(zwei,two). 
tran(drei,three). 
tran(vier,four). 
tran(fuenf,five). 
tran(sechs,six). 
tran(sieben,seven). 
tran(acht,eight). 
tran(neun,nine).

/* Write a predicate listtran(G,E) which 
 * translates a list of German number words 
 * to the corresponding list of English number words
 */
listtran([], []).
listtran([X | Xs], [Tran | Ys]) :-
    tran(Tran, X), listtran(Xs, Ys);
    tran(X, Tran), listtran(Xs, Ys).