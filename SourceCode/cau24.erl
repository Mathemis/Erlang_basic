-module(cau24).
-import(lists, [reverse/1, splitwith/2]).
-export([viet/1, viethoadau/1]).

viethoadau([H|T]) ->
	if $a =< H, H =< $z ->
		[H + $A - $a] ++ T;
	true ->
		[H|T]
	end. 

viet([]) -> [];
viet(L) ->
	[H|T] = L,
	if H == $  ->
		" " ++ viet(T);
	true ->
		{X, Y} = splitwith(fun(A) -> A /= $  end, L),
		viethoadau(X) ++ viet(Y)
	end.
