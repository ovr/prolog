%A: Работа с одноуровневыми списками

%1
app([], L, L).
app(L, [], L).
app([H|T], B, [H|NewT]):- app(T, B, NewT).

%app([1,2,3,4], [1,2,3,4], A).

%2
rem([], _, []).
rem([X|Tail], X, Ans):- !, rem(Tail, X, Ans).
rem([H|Tail], X, [H|NewTail]):- rem(Tail, X, NewTail).

%3
remf([X|T], X, T):-!.
remf([Y|T], X, [Y|T1]):- remf(T, X, T1)

%4
subs(A, B, [A|L], [B|L1]):- !, subs(A, B, L, L1).
subs(A, B, [M|L], [M|L1]):- subs(A, B, L, L1).

%5
revers([],[]).
revers([X|T], Z):- revers(T, S), app(S, X, Z).

%6
addl([],E,[E]).
addl([L1|H1],E,[L1|H2]):-
addl(H1,E,H2).

%9 no k 7
len([],0).
len([_|L],N):- len(L,N1), N is N1+1.

%7
parity(L):- len(L,N), N1 is N mod 2, N1 == 0.

%8
shift(List,[End|Begin]):- app(Begin,[End],List).

%B:			Работа с многоуровневыми списками

linear([],[]).
linear([H|Tail],[H|NewTail]):-
	atomic(H),H\=[],
	!,
	linear(Tail,NewTail).

linear([H|Tail],Ans):-
	linear(H,NewH),
	linear(Tail,NewTail),
	app(NewH,NewTail,Ans).


devlev1([H|[]], [H]).
devlev1([H|T], [H|[T1]]):- devlev1(T, T1).


devlev2([A], [A]).
devlev2(L, [L2, A]):- app(L1, [A], L), devlev2(L1, L2).

destlev1(A, B):- linear(A,B).
destlev2(A, B):- linear(A,B).


depth(X,0):- not(isList(X)), !.
depth([X|L],N):- depth(X,DX), depth(L,DL),

maxDepth(DX, DL, N).
maxDepth(DX, DL, DL):- DX < DL, !.

maxDepth(DX, _, N):- N is DX + 1.

isList([_|_]).

%7
devpair([H1, H2], [H1, H2]).
devpair([H|[]], [H]).
devpair([H1, H2|T], [[H1,H2]|X]):-
devpair(T, X).


%8
first(X, H):-linear(X, [H|_]).

%9
lengthfull(X, N):- linear(X, Y), len(Y, N).
