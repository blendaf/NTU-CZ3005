female(ann).
male(charles).
male(andrew).
male(edward).

older_than(charles,ann).
older_than(charles,andrew).
older_than(charles,edward).
older_than(ann,andrew).
older_than(ann,edward).
older_than(andrew,edward).

beforeOld(X,Y) :- male(X), male(Y), older_than(X,Y).
beforeOld(X,Y) :- male(X), female(Y).

beforeNew(X,Y) :- older_than(X,Y).

getSuccession(SortedList) :- 
findall(X, female(X);male(X), List),bubble_sort(List, SortedList).


%% General bubble sort borrowed from:
%% "http://kti.ms.mff.cuni.cz/~bartak/prolog/sorting.html"

bubble_sort(List,SortedList):-b_sort(List,[],SortedList).
b_sort([],Acc,Acc).
b_sort([H|T],Acc,SortedList):-bubble(H,T,NT,Max),b_sort(NT,[Max|Acc],SortedList).
   
bubble(X,[],[],X).

%% For old succession order
%% bubble(X,[Y|T],[Y|NT],Max):- beforeOld(Y,X),bubble(X,T,NT,Max).
%% bubble(X,[Y|T],[X|NT],Max):- beforeOld(X,Y),bubble(Y,T,NT,Max).

%% For new succesion order
bubble(X,[Y|T],[Y|NT],Max):- beforeNew(Y,X),bubble(X,T,NT,Max).
bubble(X,[Y|T],[X|NT],Max):- beforeNew(X,Y),bubble(Y,T,NT,Max).
