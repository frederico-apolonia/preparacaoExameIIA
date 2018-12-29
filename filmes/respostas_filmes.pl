% importar a base de dados dos filmes
:- [filmes_db].

/* PARTE 1 */
% a. In which year was the movie American Beauty released?
american_beauty_release(Year) :-
    movie(american_beauty, Year).
% b. Find the movies released in the year 2000.
movies_2000(Result) :-
    findall(X, movie(X, 2000), Result).
% c. Find the movies released before 2000.
movies_before_2000(Result) :-
    findall(X, (movie(X, Y), Y < 2000), Result).
% d. Find the movies released after 1990.
movies_after_1990(Result) :-
    findall(X, (movie(X, Y), Y > 1990), Result).
% e. Find an actor who has appeared in more than one movie.
% esta resolução apenas mostra o primeiro que apareceu
actor_more_one_movie(Actor) :-
    movie(M1, _), movie(M2, _),
    actor(M1, Actor, _), actor(M2, Actor, _),
    M1 \== M2, !.
% f. Find a director of a movie in which Scarlett Johansson appeared.
director_movie_scarlett(Director) :-
    % nesta resolução também se poderia por o ! para mostrar apenas o
    % primeiro director.
    movie(M, _),
    director(M, Director),
    actress(M, scarlett_johansson, _).
% g. Find an actor who has also directed a movie.
actor_is_director(Actor) :-
    actor(_, Actor, _), director(_, Actor).
% h. Find an actor or actress who has also directed a movie.
actor_ess_director(X) :-
    (actor(_, X, _); actress(_, X, _)),
    director(X).
% i. Find the movie in which John Goodman and Jeff Bridges were co-stars.
john_jeff_costars(Movie) :-
    actor(Movie, john_goodman, _),
    actor(Movie, jeff_bridges, _).

/* PARTE 2 */
% movie was released after the given year
released_after(M, Y) :-
    movie(M, Y2),
    Y2 @> Y.
% movie was released before the given year
released_before(M, Y) :-
    movie(M, Y2),
    Y2 @< Y.
% movies are released in the same year
same_year(M1, M2) :-
    movie(M1, Y1),
    movie(M2, Y2),
    M1 \== M2,
    Y1 == Y2.
    