proizved(nil,1).
proizved(tree(K,L,R),P):-proizved(L,PL),proizved(R,PR),(K>3,P is K*PL*PR;K=<3,P is PL*PR),!.
proizved(K,P):-K>3,P is K;K=<3,P is 1.

%proizved(tree(1, 5, 5), X).
%proizved(tree(1, 2, 2), X).

%?- proizved(tree(4, 5, 5), X).
%X = 100.

%?- proizved(tree(4, 5, 2), X).
%X = 20.
