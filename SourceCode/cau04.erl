-module(cau04).
-export([dao/1, dao_list/1, gtri/1, doixung/1]).

dao(0) -> [];
dao(N) -> [N rem 10 | dao(N div 10)].

dao_list([]) -> [];
dao_list([H|T]) -> dao_list(T) ++ [H].

%tinh gia tri tu phai qua trai
gtri([]) -> 0;
gtri([H|T]) -> gtri(T) * 10 + H.

doixung(N) ->
	M = gtri(dao_list(dao(N))),
	if (N == M) -> io:fwrite("~p doi xung~n", [N]);
		true -> io:fwrite("~p ko doi xung~n", [N])
	end.