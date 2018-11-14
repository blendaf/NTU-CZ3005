ask(0):-	print("Did you"), validate_and_query_options([eat]).
ask(Y):-
	generate_options(Y,L), validate_and_query_options(L).


/* här blir det fel */ 
askFollow(Y) :- findnsols(100,X,related(Y,X),_), print(X), print("test45").




/* askFollow(Y) :- findnsols(100,X,asked(X),AskedList), list_to_set(L,S), list_to_set(AskedList,A), subtract(S,A,Valid), member(X,Valid), print(X), print('? y/n/q: '), read(Like), (Like==q -> abort;Like==y -> assert(asked(X))), askFollow(X). */
/* if s - a +== null, ask(Y) */ 


generate_options(Y,L):-
	like(Y), print("Great... Do you like "), askFollow(Y);
	print("Huh... May be you like "), findnsols(100,X,random(X),L).

	
validate_and_query_options(L):-
	findnsols(100,X,like(X),Likelist), findnsols(100,X,dislike(X),Dislikelist), append(Likelist,Dislikelist,History), list_to_set(L,S), list_to_set(History,H), subtract(S,H,Valid), member(X,Valid), print(X), print('? y/n/q: '), read(Like), (Like==q -> abort;Like==y -> assert(like(X));assert(dislike(X))), ask(X).
	


related(eat, X):- print("test2"), play(L),random_member(X, L).
related(play, X):- print("test1"), play(L),random_member(X, L).
related(sing, X):- print("test1"), sing(L),random_member(X, L).
related(game, X):- print("test1"), game(L),random_member(X, L).


random(X):- activity(A), random_member(X,A).

activity([eat, gifts,wine]).

eat([spicy, spoon,sweet, full, knife]).
play([football, basketball, pirates, floorball]).
sing([lullaby,song1,song2, song3]).
game([hungryhippos, cards, jenga, monopoly]).
behave([thankyou, please, washup, clean]).



like(nothing).
dislike(nothing).
asked(nothing).