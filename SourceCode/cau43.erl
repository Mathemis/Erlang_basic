-module(cau43).
-export([xoa/2]).

xoa([], _) -> [];
xoa([H|T], X) ->
	{A, B, C} = H,
	P = A + B + C,
	if
		P >= X -> [{A, B, C}] ++ xoa(T, X)
		;true		   -> xoa(T, X)
	end.