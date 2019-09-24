-module(cau11).
-export([min/2, tinh1/3, tinh2/3]).

min(X, Y) ->
	if X < Y -> X;
		true -> Y
	end.

tinh1(_, [], _) -> 123456789;
tinh1(X, [H|T], Q) ->
	if X + H > Q -> S = X + H;
		true -> S = 123456789
	end,
	min(S, tinh1(X, T, Q)).

tinh2([], _, _) -> 123456789;
tinh2([H|T], L, Q) ->
	min(tinh1(H, L, Q), tinh2(T, L, Q)).