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


t2(X,Y):- point(X,Y).
t2(X,Y):- point(Y,X).

t3(V):- point(V,_).
t3(V):- point(_,V).


triade(N):- t2(A,N), t2(B,N), t2(C,N), A\==B, A\==C, B\==C.
