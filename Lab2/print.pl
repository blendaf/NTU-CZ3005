begin(0) :- findnsols(10, X, list(X), _), test(X).
	
test(a):- print("something").
test(X) :- print(X).

list([a, b, c, d, e]).

a([spicy, spoon]).
b([football, fun]).
c([lullaby]).
d([hungryhippos, cards]).
e([thankyou, please]).
