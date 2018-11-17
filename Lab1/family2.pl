brother(peter,warren).
brother(jerry,kather).
brother(jerry,stuart).
male(stuart).
male(peter).
male(warren).
male(jerry).
female(kather).
female(ann).
female(maryalice).
sister(kather,jerry).
sister(ann,maryalice).
parent_of(maryalice,jerry).
parent_of(warren,jerry).



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