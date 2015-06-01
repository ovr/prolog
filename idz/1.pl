ifIn(X,Y):-sqrt(X*X+Y*Y)<=1,segm(X,Y).
segm(0,_):-!.
segm(_,0):-!.
segm(X,Y):-X*Y>0,!,abs(Y)>=abs(X).
segm(X,Y):-abs(Y)<=abs(X).
