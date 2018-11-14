/* Start query with first subject as eat */
ask(0):-	print("Did you"), valandquery_first([eat]).

/* check if chosen subject was indeed performed by the child  */ 
check(Y) :- 
	like(Y), answerYes(Y); answerNo(0).


/* If chosen subject not performed by child, ask about another, random, subject */ 
answerNo(0) :- options_first(L), valandquery_first(L).
options_first(L):- print("Okey, did you"), findnsols(100,X,random(X),L).
valandquery_first(L):-
	findnsols(100,X,like(X),Likelist), findnsols(100,X,dislike(X),Dislikelist), append(Likelist,Dislikelist,History), list_to_set(L,S), list_to_set(History,H), subtract(S,H,Valid), member(X,Valid), print(X), print('? y/n/q: '), read(Like), (Like==q -> abort;Like==y -> assert(like(X));assert(dislike(X))), check(X).
	

/* If chosen subject performed by child, find related follow up question */
answerYes(Y) :- options_firstfollowup(Y, L), valandquery_followup(L).
options_firstfollowup(Y, L) :- print("what more"), findnsols(100, X, related(Y,X), L).

/* Continue finding follow up questions related to the chosen subject */ 
askFollow(Y) :- options_followup(Y, L), valandquery_followup(L).
options_followup(Y, L) :- print("what more"), findnsols(100, X, relatedFollow(Y,X), L).



/* Ask follow up question and add to list asked as to not ask a question more than once */ 
valandquery_followup(L) :- 
	findnsols(100,X,asked(X),History), list_to_set(L,S), list_to_set(History,H), subtract(S,H,Valid), member(X,Valid), print(X), print('? y/n/q: '), read(Like), (Like==q -> abort;Like==y -> assert(asked(X));assert(asked(X))), askFollow(X).



/* If chosen subject performed by child, find related follow up question */

/* Based upon chosen activity, find a related follow up question */
related(eat, X):- eat(L),random_member(X, L).
related(play, X):- play(L),random_member(X, L).
related(sing, X):- sing(L),random_member(X, L).
related(game, X):- game(L),random_member(X, L).
related(behave, X):- behave(L),random_member(X, L).
related(talk, X):- talk(L),random_member(X, L).
related(learn, X):- learn(L),random_member(X, L).


/* Find a related question */ 
relatedFollow(Y, X) :- 
	eat(L),member(X,L),member(Y,L);
	play(L),member(X,L),member(Y,L);
	sing(L),member(X,L),member(Y,L);
	game(L),member(X,L),member(Y,L);
	behave(L),member(X,L),member(Y,L);
	talk(L),member(X,L),member(Y,L);
	learn(L),member(X,L),member(Y,L).


/* Choose random activity */
random(X):- activity(A), random_member(X,A).

/* List of subjects */ 
activity([eat, play, sing, game, behave, talk, learn, c]).

/* Lists of follow up questions based upon subject */
eat([spicy, spoon, salty]).
play([football, basketball, pirates, floorball]).
sing([lullaby,song1, song2]).
game([hungryhippos, cards, monopoly]).
behave([thankyou, please, hello]).
talk([pokemon, something, something2]).
learn([math, reading]).



like(nothing).
dislike(nothing).
asked(nothing).

