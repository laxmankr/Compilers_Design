memberl(X,[X|_]).
memberl(X,[_|L]):- memberl(X,L).