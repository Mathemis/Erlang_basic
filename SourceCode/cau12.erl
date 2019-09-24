-module(cau12).
-export([max/2, tinh1/4, tinh2/2]).

max(A, B) ->
	if 
		(A < B) -> B
		;true   -> A
	end.

tinh1([], [], _, _) -> 0;
tinh1([Dau|Duoi], [H|T], X, Y) ->
	Kc = math:sqrt((X-Dau)*(X-Dau) + (Y-H)*(Y-H)),
	max(Kc, tinh1(Duoi, T, X, Y)).

tinh2([], []) -> 0;
tinh2([Dau|Duoi], [H|T]) ->
	max(tinh1(Duoi, T, Dau, H), tinh2(Duoi, T)).