-module(cau22).
-import(maps, [get/2, from_list/1]).
-export([tinhkeyvalue/2, min/2, tinh1/6, tinh2/4, vitri/2]).

tinhkeyvalue([], _) -> [];
tinhkeyvalue([H|T], I) -> 
	[{H,I}] ++ tinhkeyvalue(T, I+1).

min({Val1, I1, J1}, {Val2, I2, J2}) ->
	if
		Val1 < Val2 -> {Val1, I1, J1}
		;true		-> {Val2, I2, J2}
	end.

tinh1(X, [], Val, I, Map, AD) -> 
	if
		AD > 0 -> J = get(Val-X, Map)
		;true  -> J = get(-Val-X, Map)
	end,
	{Val, I, J};
tinh1(X, [H|T], CurVal, I, Map, AD) ->
	NewVal = erlang:abs(X+H),
	NAD = X+H,
	if
		NewVal < CurVal -> tinh1(X, T, NewVal, I, Map, NAD)
		;true			-> tinh1(X, T, CurVal, I, Map, AD)
	end.

tinh2([], _, _, _) -> {987654, 0 ,0};
tinh2([H|T], B, I, Map) ->
	{X, Y, Z} = tinh1(H, B, 987654, I, Map, 0),
	{M, N, P} = erlang:min({X, Y, Z}, tinh2(T, B, I+1, Map)),
	{M, N, P}.

vitri(A, B) ->
	Map = from_list(tinhkeyvalue(B, 1)),
	{_, I, J} = tinh2(A, B, 1, Map),
	io:fwrite("~p ~p~n", [I, J]).