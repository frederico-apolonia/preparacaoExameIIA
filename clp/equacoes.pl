:- use_module(library(clpfd)).

/* Verificar se as equações têm soluções no intervalo [-10,10] */
% a) x+y=5, xy=6
equacao1([x-X, y-Y]) :-
    L = [X, Y],
    L ins -10..10,
    X + Y #= 5,
    X * Y #= 6,
    label(L).
    % solução: [x-2, y-3]

% b) 7x+4y=1, -x-2y=7
equacao2([x-X, y-Y]) :-
    L = [X, Y],
    L ins -10..10,
    7 * X + 4 * Y #= 1,
    -X - 2 * Y #= 7,
    label(L).
    % solução: [x-3, y- -5]

% c) 2x+2y+3z = -7, x +2y+4 = -4, y-3z = -6
equacao3([x-X, y-Y, z-Z]) :-
    L = [X, Y, Z],
    L ins -10..10,
    2 * X + 2 * Y + 3 * Z #= -7,
    X + 2 * Y + 4 #= -4,
    Y - 3 * Z #= -6,
    label(L).
    % solução: [x- -2, y- -3, z-1]