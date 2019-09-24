-module(cau39).
-export([list/1, kttoanle/2,listToanle/1,demToanle/1]).

list(0) -> [];
list(N) -> [N rem 10 | list(N div 10)].

kttoanle(_, 0) -> 0;
kttoanle([], 1) -> 1;
kttoanle([H|T], 1) ->
	if (H rem 2 == 0) -> K = 0
		;true -> K = 1
	end,
	kttoanle(T, K).

listToanle([]) -> [];
listToanle([H|T]) -> 
	Ch = kttoanle([H],1),
	if Ch == 1 -> [H] ++ listToanle(T)
		;true -> listToanle(T)
	end.

demToanle(N) ->
	L = lists:append(N),
	length(listToanle(L)).