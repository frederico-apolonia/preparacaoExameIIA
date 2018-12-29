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

/* Predicado caminho(E1, E2) para encontrar o caminho entre duas 
 * estacoes
 */
