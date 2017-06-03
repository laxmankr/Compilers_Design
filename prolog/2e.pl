check_member_of_list(Member,[Member|_]).

check_member_of_list(Member1,[_|List1]) :-
	check_member_of_list(Member1,List1).
