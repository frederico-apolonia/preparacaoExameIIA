:- use_module(library(clpfd)).

/* Exemplo do problema das entradas */
entradas(Sol) :-
    L = [Alice,Bob,Carol,Donald],
    L ins 1..4,
    Alice #\= 4,
    Alice #\= Bob,
    (Bob #= 1 #\/ Bob #= 3),
    Carol #\= Bob,
    Carol #\= Donald,
    Carol #= Alice,
    Donald #\= 2,
    label(L),
    Lp = [alice-Alice,bob-Bob,carol-Carol,donald-Donald],
    findall((Var-V),(member(Var-Val,Lp),member(Val-V,[1-pasta,2-quesadilla, 3-risotto,4-sushi])),Sol).

/* Colorir um mapa (mapa1.jpg) usando 4 cores */
% formulação do problema:
coloracao(Sol) :-
    L = [A, B, C, D, E],
    L ins 1 ..5,
    A #\= B,
    A #\= C,
    A #\= D,
    B #\= C,
    B #\= D,
    C #\= D,
    D #\= E,
    label(L),
    Lp = [a-A, b-B, c-C, d-D, e-E],
    findall((Var-V), (member(Var-Val, Lp),member(Val-V, [1-vermelho, 2-verde, 3-amarelo, 4-azul])), Sol).
    % uma solução: [a-vermelho, b-verde, c-amarelo, d-azul, e-vermelho]

% encontrar o número de soluções:
num_sol_coloracao(X) :-
    findall(Sol, coloracao(Sol), L), length(L, X).
    % resultado: 480

/* Exemplo do problema dos jogadores de golf */
golfe :-
    L = [Bob,Fred,Joe,Tom,Azuis,Vermelhas,Pretas,Laranjas],
    [Joe,Bob,Fred,Tom] ins 1..4,
    [Azuis,Vermelhas,Pretas,Laranjas] ins 1..4,
    all_different([Joe,Fred,Bob,Tom]),
    all_different([Azuis,Vermelhas,Pretas,Laranjas]),
    Fred + 1 #= Azuis,
    Joe #= 2,
    Bob #= Pretas,
    Tom #\= 4,
    Tom #\= Laranjas,
    label(L),
    sort([Bob-bob, Joe-joe, Fred-fred, Tom-tom],Eles),
    sort([Vermelhas-vermelhas,Azuis-azuis,
    Laranjas-laranjas,Pretas-pretas],Cores),
    Fmt = '~w~16|~w~32|~w~48|~w~n',
    format(Fmt, Eles),
    format(Fmt, Cores).

casas :-
    L = [Cinzento, Verde, Castanho, Italiano, Ingles, Grego, Limonada, Cafe, Icetea],
    [Cinzento, Verde, Castanho] ins 1..3,
    [Italiano, Ingles, Grego] ins 1..3,
    [Limonada, Cafe, Icetea] ins 1..3,
    all_different([Cinzento, Verde, Castanho]),
    all_different([Italiano, Ingles, Grego]),
    all_different([Limonada, Cafe, Icetea]),
    Verde + 1 #= Italiano,
    Cafe #= 2,
    Limonada #= Cinzento,
    Grego #= 3,
    label(L),
    sort([Cinzento-cinzento, Verde-verde, Castanho-castanho], Cores),
    sort([Italiano-italiano, Ingles-ingles, Grego-grego], Nacionalidades),
    sort([Limonada-limonada, Cafe-cafe, Icetea-icetea], Bebidas),
    Fmt = '~w~16|~w~32|~w~n',
    format(Fmt, Nacionalidades),
    format(Fmt, Cores),
    format(Fmt, Bebidas).