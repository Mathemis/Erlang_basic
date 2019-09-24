-module(cau05).
-export([dao/1, dao_list/1, gtri/1, doixung/1, lietkedoixung/2]).

dao(0) -> [];
dao(N) -> [N rem 10 | dao(N div 10)].

dao_list([]) -> [];
dao_list([H|T]) -> dao_list(T) ++ [H].

%tinh gia tri tu phai qua trai
gtri([]) -> 0;
gtri([H|T]) -> gtri(T) * 10 + H.

doixung(N) ->
	M = gtri(dao_list(dao(N))),
	if (N == M) -> 1
	;true -> 0
end.

lietkedoixung(A, B) ->
	if A =< B ->
		Tm = doixung(A),
		if (Tm == 1) -> io:fwrite("~p~n", [A])
		;true -> Xam = 1
		end,
		lietkedoixung(A+1, B);
		true -> io:fwrite("")
	end.