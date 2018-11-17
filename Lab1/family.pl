male(jerry).
male(stuart).
male(warren).
male(peter).
female(kather).
female(maryalice).
female(ann).
brother(jerry,stuart).
brother(jerry,kather).
brother(peter,warren).
sister(ann,mayalice).
sister(kather,jerry).
parent_of(warren,jerry).
parent_of(maryalice,jerry).

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