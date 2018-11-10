ask(0):- print("What bread would you like?"), options(breads).
ask(X):- nextChoice().

options(L) :- printList(L), print('choose bread'). /*. read(Choice), selected(Choice) */


selected() :- 

printList([H]) :- print(H).
printList([H|T]) :- printList(T), print(H). 


breads([parmesan, honeywheat, oats]).
main([chicken, tuna]).
veggies([lettuce, tomato, cucumber]).
sauce([mustard, chipotle, mayo]).
sides([soup, soda, water]).

selected(nothing).
choices(breads, main, veggies, sauce, sides).