% importar DB
:- [metro_lisboa].
/* Predicado estacoes_linha_ano/3 que permite obteras estacoes do metro
 * que perteçam a uma linha e cujo ano de inauguração seja posterior a um
 * ano dado
 * Exemplo: ?- estacoes_linha_ano(amarela, 2000, L).
 * L = ['Ameixoeira', 'Lumiar', ...]
 */
estacoes_linha_ano(Linha, Ano, Result) :-
    findall(Estacao, (estacao(Linha, Estacao, Ano1), Ano1 @> Ano), Lista),
    sort(Lista, Result).

/* Predicado lista_duas_linhas/1 que permite saber estaçoes de metro que
 * perteçam a mais do que uma linha. */
lista_duas_linhas(Res) :-
    bagof(Estacao, pertence_duas_linhas(Estacao), L),
    sort(L, Res).

/* Estacao pertence a duas linhas? */
pertence_duas_linhas(E) :-
    estacao(L1, E, _),
    estacao(L2, E, _),
    L1 \== L2.

/* Existe ligação direta entre a estação 1 e 2 */
ligacao_direta(E1, E2) :-
    liga(E1, E2); liga(E2, E1).

/* Predicado caminho(E1, E2, Caminho) para encontrar o caminho entre duas 
 * estacoes (caminho tem de ser devolvido numa lista)
 */
caminho(A, B, Caminho) :-
    once(caminho_aux(A, B, L)), 
    adiciona_lista(A, L, Caminho).

caminho_aux(E, E, []).
caminho_aux(E1, E2, [X|Xs]) :-
    caminho_aux(X, E2, Xs), ligacao_direta(X, E1).

adiciona_lista(E, L, Res) :-
    append([E], L, Res).