append_list([],L2,L2).
append_list([Head1|Tail1],L3,[Head1|T2]) :-
	append_list(Tail1,L3,T2).

reverse_list([],[]).
reverse_list([Head|Tail],L) :-
	reverse_list(Tail,L1),
	append_list(L1,[Head],L).
