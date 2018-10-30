female(maja).
female(blenda).
female(karin).
female(ingrid).
male(krister).
male(julius).
male(hakan).
male(hubbe).
brother(julius,blenda).
brother(krister,hakan).
sister(blenda,julius).
sister(karin,maja).
parent_of(maja,julius).
parent_of(maja,blenda).
parent_of(krister,julius).
parent_of(krister,blenda).
parent_of(karin,ingrid).
parent_of(hubbe,maja).
parent_of(hubbe,karin).


father(X,Y) :- male(X), parent_of(X,Y).
mother(X,Y) :- female(X), parent_of(X,Y).
son(X,Y) :- male(X), parent_of(Y,X).
daughter(X,Y) :- female(X), parent_of(Y,X).
grandfather(X,Y) :- male(X), parent_of(X,P), parent_of(P,Y).
sibling(X,Y) :- sister(X,Y).
sibling(X,Y) :- sister(Y,X).
sibling(X,Y) :- brother(X,Y).
sibling(X,Y) :- brother(Y,X).
aunt(X,Y) :- female(X), sibling(X,P), parent_of(P,Y).
uncle(X,Y) :- male(X), sibling(X,P), parent_of(P,Y).
cousin(X,Y) :- parent_of(A,X), sibling(A,P), parent_of(P,Y).
spouse(X,Y) :- parent_of(X,C), parent_of(Y,C), X\=Y.
parent(X,Y) :- parent_of(X,S), sibling(S,Y).
parent(X,Y) :- parent_of(X,Y).