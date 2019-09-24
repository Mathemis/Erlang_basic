-module(cau13).
-export([nearMax/1]).

nearMax(L) -> 
	Len = length(L),
	if (Len < 2) -> io:fwrite("khong co so lon thu hai~n")
		;true ->
			L1 = lists:reverse(lists:usort(L)),
			lists:nth(2,L1)
	end.