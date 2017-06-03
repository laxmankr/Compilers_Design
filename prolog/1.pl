male(ram).
male(shyam).
female(sita).
female(gita).
parents(shyam,gita,ram).
parents(sita,gita,ram).

sister_of(X,Y) :-
	female(X),
	parents(X,F,M),
	parents(Y,F,M).
