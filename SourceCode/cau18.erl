-module(cau18).
-import(lists, [reverse/1, splitwith/2]).
-export([dao/1]).

dao([]) -> [];
dao(L) ->
	[H|T] = L,
	if H == $  ->
		" " ++ dao(T);
	true ->
		{X, Y} = splitwith(fun(A) -> A /= $  end, L),
		reverse(X) ++ dao(Y)
	end.
