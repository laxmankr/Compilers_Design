memberl(X,[X|_]).
memberl(X,[_|L]):- memberl(X,L).
rem_duplicate([],[]).
rem_duplicate([H|T],L) :- memberl(H,T), !, rem_dup(T,L).
rem_duplicate([H|T],[H|L1]) :- rem_dup(T,L1).
