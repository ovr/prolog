sep(46).%"."
sep(47).%"/"
sep(94).%"^"
sep(42).%"*"
sep(32).%" "

%основная fronttoken
fronttoken(X,Y,Z):-(nonvar(Y),front(X,Y,Z),!);front1(X,Z),!.
%когда переменная Y не задана
front1([X|Y],Y):-sep(X),!.
front1([X|Y],Z):-not(sep(X)),front1(Y,Z).
%когда переменная Y задана
front([X|Y],[X],Y):-!.
front([X|U],Y,Z):-X\=Y,front(U,Y,Z).
front([],_,[])

wordsFr(C,S,[A|B]):- fronttoken(S,A,R), sub_str(A,C,_), !, wordsFr(C,R,B).
wordsFr(C,S,A):- fronttoken(S,_,R), !, wordsFr(C,R,A).
wordsFr(_,_,[]).

gtwrd(S,W,E,T):-
	substring(S,0, S1, C),                %выделяю символ
        NOT(C=' '),                        %если это не пробел
        str_char(SS,C),                    %преобразую символ в строку
        concat(W,SS,R),                    %прикрепляю символ к результату
        gtwrd(S1,R,E,T),!.
    gtwrd(S,W,W,R):-                    %иначе(если это был пробел) возвраю результат
		substring(S, 0, R, _),
    gtwrd(S,W,W,S).
