app([],L,L).
app([H|T],L,[H|T1]):-app(T,L,T1).

srg([],[]).
srg([H|T],X):-sredgeom(H,P),length(H,N),Y is P/N,srg(T,XT),app([Y],XT,X).

sredgeom([H|[]],H).
sredgeom([H|T],P):-sredgeom(T,Y),P is Y*H.

%?- srg([[1,2,3], [1,2,3], [1,2,3]], X).
%X = [2, 2, 2] .
