person(5).
person(1).
person(7).
person(2).
person(1).

insertionsort([],[]).
insertionsort([A],[A]).
insertionsort([H|T], Out):-
  insertionsort(T,Z),
  insert(H,Z,Out).

insert(X, [], [X]).
insert(X, [H|T], [X,H|T]):- X =< H.
insert(X, [H|T], [H|Z]):- X > H,insert(X,T,Z).

getList(List) :- findall(X, person(X), List).
getSorted(SortedList) :- findall(X, person(X), List), insertionsort(SortedList, List).