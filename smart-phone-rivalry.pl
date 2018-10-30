company(sumsum).
company(appy).
competitor(sumsum,appy).
boss(steven).
buisness(galactica).
invented(sumsum, galactica).
stolen(steven,galactica,sumsum).
works_for(steven,appy).

rival(X) :- competitor(X,appy).
unethical(X) :- boss(X), buisness(Y), rival(Z), company(Z), stolen(X,Y,Z).
