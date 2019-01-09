/* Example 1: Eating */
just_ate(mosquito,blood(john)). 
just_ate(frog,mosquito). 
just_ate(stork,frog).

is_digesting(X,Y)  :-  just_ate(X,Y). 
is_digesting(X,Y)  :- 
    % se X comeu Z e Z comeu Y então X comeu Y
    just_ate(X,Z), % parte em que X comeu Z
    is_digesting(Z,Y). % parte em que Z comeu Y