increment_List([L],[L1]) :-
	L1 is L+1.
increment_List([Head|Tail],[H|T]) :-
	H is Head+1,increment_List(Tail,T).
