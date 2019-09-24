-module(cau08).
-export([chu_so/1, ktle/2, co_le/1]).

chu_so(0) -> [];
chu_so(N) -> [N rem 10 | chu_so(N div 10)].

ktle(_, 0) -> 0;
ktle([], 1) -> 1;
ktle([H|T], 1) ->
	if (H rem 2 == 1) -> K = 0
		;true	 -> K = 1
	end,
	ktle(T, K).

co_le(N) ->
	Tmp = ktle(chu_so(N), 1), 
	if (Tmp == 0) -> io:fwrite("~p ton tai chu so le~n", [N])
	;true -> io:fwrite("~p khong ton tai chu so le~n", [N])
end.