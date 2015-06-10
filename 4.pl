point(1,2).
point(2,3).
point(3,4).
point(1,4).

point(5,6).
point(6,7).
point(5,7).

point(8,9).
point(9,10).
point(10,11).

%point(4,8).
%point(7,11).


connected(X,Y):- point(X,Y).
connected(X,Y):- point(Y,X).

vertex(V):- point(V,_).
vertex(V):- point(_,V).

node(N):- connected(A,N), connected(N,C), A\==C.
triade(N):- connected(A,N), connected(B,N), connected(C,N), A\==B, A\==C, B\==C.
finish(F):- vertex(F), not(node(F)).


path(A,B,Path) :-
       travel(A,B,[A],Q),
       reverse(Q,Path).

%3
travel(A,B,P,[B|P]) :-
       connected(A,B).
travel(A,B,Visited,Path) :-
       connected(A,C),
       C \== B,
       \+memberchk(C,Visited),
       travel(C,B,[C|Visited],Path).

%4
istriangle(A,B,C):-
		connected(A,B), connected(B,C), connected(C,A),
		C\==A, C\==B, B\==A.

%45
isquad(A,B,C,D):-
		connected(A,B), connected(B,C), connected(C,D), connected(D,A),
		C\==A, B\==A, D\==A, C\==B, D\==B, C\==D.


getLenList([],0).
getLenList([_|L],N):-
	getLenList(L,N1),
	N is N1+1.


pathLen(A,B,N):-
	path(A,B,Path),
	getLenList(Path, N).

opposite(A,B):-
		path(A,B,Path1),
		path(A,B,Path2),
		getLenList(Path1, N1),
		getLenList(Path2, N2),
		N1 == N2,
		Path1 \== Path2.

islocked(V):-
		node(V),
		pathLen(V,V,N),
		N > 3.

iscleartriangle(A,B,C):-
		istriangle(A,B,C),
		not(triade(A)), not(triade(B)), not(triade(C)).

isclearquad(A,B,C,D):-
		isquad(A,B,C,D),
		not(triade(A)), not(triade(B)), not(triade(C)), not(triade(D)).
