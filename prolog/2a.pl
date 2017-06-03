compute_Length([],0).
compute_Length([Head|Tail],Length) :-
	compute_Length(Tail,Tail_Length),
	Length is Tail_Length+1.
