
bread(a,b,c,d).

printList([H]) :- print(H).
printList([H|T]) :- printList(T), print(H). 

printLists(0) :- printList([bread]).