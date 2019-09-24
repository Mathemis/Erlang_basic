-module(cau38).
-export([tinh/1, tongAm/1]).

tinh([]) -> 0;
tinh([H|T]) ->
	if H < 0 -> tinh(T) + H
		;true -> tinh(T)
	end.

tongAm(N) ->
	L = lists:append(N),
	tinh(L).