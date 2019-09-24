-module(cau20).
-export([tinhkeyvalue/2, maxa/2, tinh/4, tim/2]).

tinhkeyvalue([], _) -> [];
tinhkeyvalue([H|T], I) ->
	[{H, I}] ++ tinhkeyvalue(T, I + 1).

maxa({Ai1, I1, J1}, {Ai2, I2, J2}) ->
	if Ai1 > Ai2 ->
		{Ai1, I1, J1};
	true ->
		{Ai2, I2, J2}
	end.

tinh([], _, _, _) -> {-123456, 0, 0};
tinh([H|T], I, K, Map) ->
	J = maps:get(K - H, Map, -1),
	if J == -1 ->
		tinh(T, I + 1, K, Map);
	true ->
		maxa({H, I, J}, tinh(T, I + 1, K, Map))
	end.

tim(L, K) ->
	Map = maps:from_list(tinhkeyvalue(L, 1)),
	{_, I, J} = tinh(L, 1, K, Map),
	io:fwrite("~p ~p~n", [I, J]).