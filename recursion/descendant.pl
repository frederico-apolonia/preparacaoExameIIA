/* Example 2: Descendant */
child(anne,bridget). 
child(bridget,caroline). 
child(caroline,donna).
child(donna,emily).

descend(X,Y) :- child(X,Y).     
descend(X,Y) :-  
    child(X,Z), 
    descend(Z,Y).

/*
    child(Bridget, Z).
    child(Z, Y).
    child(Y, Donna).
*/