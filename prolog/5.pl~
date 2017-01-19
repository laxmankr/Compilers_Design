not(1,0).
not(0,1).

and1(0,0,0).
and1(0,1,0).
and1(11,0,0).
and1(1,1,1).

or1(0,0,0).
or1(0,1,1).
or1(1,0,1).
or1(1,1,1).

xor1(0,0,0).
xor1(0,1,1).
xor1(1,0,1).
xor1(1,1,0).


%signal(t) is 0;signal(t) is 1.

connected(t2,t1):-connected(t1,t2).
connected(t1,t2):-signal(t1)=signal(t2).

type(X,or1) :-out(X) is 1,(in(1,X)=1;in(2,X)=1).
type(X,and1):-out(X) is 1,(in(1,X)=1,in(2,X)=1).
type(X,xor1):-out(X) is 1,(in(1,X)=(\+in(2,X))).
type(X,not) :-out(X)=(\+in(1,X)),no_of_input(X) is 1.


fulladder(A, B, Carryin, Sum, Carryout):-
xor1(A, B, X),
and1(A, B, Y),
and1(X, Carryin, Z),
xor1(Carryin, X, Sum),
or1(Y, Z, Carryout).
