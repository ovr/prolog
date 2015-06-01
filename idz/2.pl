make_duplicates([], []).
make_duplicates([X|Xs], [X,X|Xs1]) :-
    make_duplicates(Xs, Xs1).

% make_duplicates([1, 2, 3], X).
