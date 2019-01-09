% X é o segundo elemento da lista?
second(X, [_,X|_]).

% L1 é identico a L2 excepto os 2 primeiros elems que estão trocados?
swap12([X,Y|L1], [Y,X|L2]) :- L1 == L2.

% twice([1,2,3], X).
% X = [1, 1, 2, 2, 3, 3].
twice([], []).
twice([X | Xs], [X,X|L]) :- twice(Xs, L).