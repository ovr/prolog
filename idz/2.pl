fronttoken(S,T,STail):-atom_chars(S,SList),
    append(TList,[' '|STailList],SList),
    atom_chars(T,TList),atom_chars(STail,STailList).

wordsFr(C,S,[A|B]):- fronttoken(S,A,R), frontchar(A,C,_), !, wordsFr(C,R,B).
wordsFr(C,S,A):- fronttoken(S,_,R), !, wordsFr(C,R,A).
wordsFr(_,_,[]).
