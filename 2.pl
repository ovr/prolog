woman(pame).
woman(lize).
woman(pate).
woman(anna).
woman(susan).
woman(natalie).
woman(june).

man(tom).
man(bob).
man(jhim).
man(tyler).
man(sam).
man(jack).
man(samuel).
man(lucius).
man(nathan).
man(luke).

parent(pame,bob).
parent(tom,bob).
parent(tom,lize).
parent(bob,anna).
parent(bob,pate).
parent(pate,jhim).
parent(susan,jack).
parent(lucius,natalie).
parent(natalie,korvin).
parent(jack,samuel).
parent(jack, luke).
parent(luke,nathan).
parent(samuel,june).
parent(june,tom).
parent(nathan,tyler).
parent(tyler,sam).

married(tom,pame).
married(samuel,natalie).

%внучка (granddaughter)
grandchild(GC,X)         :-    parent(X,C),   parent(C,GC).
granddaughter(GD,X)      :- grandchild(GD,X), female(GD).

%Правнучка (great_granddaughter)
greatgranddaughter(X, Z) :-  female(X),     greatgrandchild(X, Z).

%родной брат
sibling(X, Y)            :-  father(Z, X),  father(Z, Y), mother(W, X),  mother(W, Y),    not(X = Y).

%тетя или дядя
auntoruncle(X, W)        :-  sibling(X, Y), parent(Y, W).
auntoruncle(X, Z)        :-  married(X,Y),  sibling(Y,W),    parent(W,Z).

%Кузин
cousin(X, Y)             :-  parent(Z, X),  auntoruncle(Z, Y).

%деверь [брат мужа] (husbands_brother)
siblinginlaw(X, Y)       :-  married(Y, Z), sibling(X, Z).
husbands_brother(X, Y)       :-  male(X),       siblinginlaw(X, Y).
