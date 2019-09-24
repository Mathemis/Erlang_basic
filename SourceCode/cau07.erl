-module(cau07).
-export([list/1, kttoanchan/2, toanchan/1]).

list(0) -> [];
list(N) -> [N rem 10 | list(N div 10)].

kttoanchan([_|_], 0) -> 0;
kttoanchan([], 1) -> 1;
kttoanchan([H|T], 1) ->
	if (H rem 2 == 1) -> K = 0
		;true	 -> K = 1
	end,
	kttoanchan(T, K).

toanchan(N) ->
	Tm = kttoanchan(list(N), 1),
	if (Tm == 1) -> io:fwrite("~p la so toan chan~n", [N])
	;true -> io:fwrite("~p khong la so toan chan~n", [N])
end.