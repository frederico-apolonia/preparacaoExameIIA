/* Implementação do fatorial em prolog */
factorial(0, 1).
factorial(N, R) :-
    N1 is N - 1,
    factorial(N1, Res),
    R is Res * N,
    N > 0.