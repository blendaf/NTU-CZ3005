/* Start query with first activity as eat */
ask(0):-	print("Did you"), valandquery_first([eat]).

/* Check if activity, Y, is in list did. If yes, execute answerYes. If no execute answerNo */ 
check(Y) :- 
	did(Y), answerYes(Y); answerNo(0).


/* If chosen activity not performed by child, get list L of activities. Ask question based upon list L */ 
answerNo(0) :- options_first(L), valandquery_first(L).
/* Find activity based upon random */ 
options_first(L) :- print("Okey, did you"), findnsols(100,X,random(X),L), print(L).
/* Ask about activity, L, and add activity to either 'did' or 'didNot' based upon answer */
valandquery_first(L) :-
	member(X,L), print(X), print('? y/n/q: '), read(Like), (Like==q -> abort;Like==y -> assert(did(X));assert(didNot(X))), check(X).
	

/* If chosen activity performed by child, get list of related follow up questions (L) corresponding to activity Y */ 
/* Ask follow up question based upon list L */
answerYes(Y) :- options_firstfollowup(Y, L), valandquery_followup(L).
/* Finds list L of related follow up questions corresponding to activty Y */
options_firstfollowup(Y, L) :- findnsols(100, X, related(Y,X), L).


/* Finds list of follow up questions, L, related to the previous follow up question Y */
/* Ask follow up questin based upon list L */ 
askFollow(Y) :- options_followup(Y, L), valandquery_followup(L).
/* Find list of related follow up questions, L, based upon previous follow up question, Y, using relatedFollow*/
options_followup(Y, L) :- findnsols(100, X, relatedFollow(Y,X), L).


/* Finds all objects in list 'asked', convert to set as to be able to remove all objects 'asked' from list L. */ 
/* I.e all questions already asked are removed from the list of related follow up questions L */ 
/* member(X,Remaining) chooses an object (follow up question) of the list Remaining (list of related follow up questions NOT already asked), and asks the follow up question */
/* The follow up question asked is added to the list 'asked' */
valandquery_followup(L) :- 
	print("all related topics: "), print(L), findnsols(100,X,asked(X),History), list_to_set(L,S), list_to_set(History,H), subtract(S,H,Remaining), print("list minus already asked questions: "), print(Remaining), member(X,Remaining), print(X), print('? y/n/q: '), read(Like), (Like==q -> abort;Like==y -> assert(asked(X));assert(asked(X))), askFollow(X).


/* Finds rule to execute based upon pattern match of first input variable */ 
/* Returns object X which is a random member of the list corresponding to first input variable. */
related(eat, X):- eat(L),random_member(X, L).
related(play, X):- play(L),random_member(X, L).
related(sing, X):- sing(L),random_member(X, L).
related('play games', X):- game(L),random_member(X, L).
related(behave, X):- behave(L),random_member(X, L).
related(talk, X):- talk(L),random_member(X, L).
related(learn, X):- learn(L),random_member(X, L).
related('ride a bike', X):- learn(L),random_member(X, L).
related('skip ropes', X):- learn(L),random_member(X, L).


/* Finds object X, which is a member of the same list as object Y  */ 
relatedFollow(Y, X) :- 
	eat(L),member(X,L),member(Y,L);
	play(L),member(X,L),member(Y,L);
	sing(L),member(X,L),member(Y,L);
	game(L),member(X,L),member(Y,L);
	behave(L),member(X,L),member(Y,L);
	talk(L),member(X,L),member(Y,L);
	learn(L),member(X,L),member(Y,L);
	bike(L),member(X,L),member(Y,L);
	rope(L),member(X,L),member(Y,L).

/* Removes already asked about activities from list activity. */
/* Returns random activity from Remaining objects i.e from list Remaining */
random(Y) :- activity(A), findnsols(100,X,did(X),Likelist), findnsols(100,X,didNot(X),Dislikelist), append(Likelist,Dislikelist,History), list_to_set(A,S), list_to_set(History,H), subtract(S,H,Remaining), random_member(Y, Remaining).



/* List of activities */ 
activity([eat, play, sing, 'play games', behave, talk, learn, 'ride a bike', 'skip ropes']).


/* Lists of follow up questions based upon activity */
eat(['was it spicy', 'did you use a spoon', 'was it sweet', 'was it salty', 'was it yummy']).
play([football, basketball, pirates, floorball]).
sing([lullaby,song1, song2]).
game([hungryhippos, cards, monopoly]).
behave([thankyou, please, hello]).
talk([pokemon, something, something2]).
learn([math, reading]).
bike([]).
rope([]).

/* lists of activities done, not done */
did(nothing).
didNot(nothing).
/* List of follow up questions asked */
asked(nothing).
