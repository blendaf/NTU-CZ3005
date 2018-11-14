start(0):- print("What would you like?"), allchoices(L), options(L). 
start(L):- 
	print("What would you like?"), options(L).
start([]) :- print("done").


options([H|T]) :- print(H), print('test1'), read(Choice), (Choice==y -> assert(selected('test'))), testSelected(0), start(T).

testSelected(0) :- selected(Y),printList(Y).



/*options([[H|T]|_]) :- printList(H), read(Choice), (Choice==y -> assert(selected(H))), start(T).*/ /*selected(Choice) */

printList([H]) :- print(H).
printList([H|T]) :- printList(T), print(H). 




allchoices([[parmesan, honeywheat, oats],[chicken, tuna]]).
choices([breads, main, veggies, sauce, sides]).


breads([parmesan, honeywheat, oats]).
main([chicken, tuna]).


selected(nothing).



/*findnsols(100,X,like(X),Likelist), findnsols(100,X,dislike(X),Dislikelist), append(Likelist,Dislikelist,History), list_to_set(L,S), list_to_set(History,H), subtract(S,H,Valid), member(X,Valid)*/