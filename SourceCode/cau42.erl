-module(cau42).
-export([trongdoan/3]).

trongdoan([], _, _) -> [];
trongdoan([H|T], X, Y) ->
	{A, B, C} = H,
	P = A + B + C,
	if
		P >= X, P =< Y -> [{A, B, C}] ++ trongdoan(T, X, Y)
		;true		   -> trongdoan(T, X, Y)
	end.