-module(cau27).
-export([layptu/1, xuly/1]).

layptu([]) -> [];
layptu([H|T]) ->
	if 
		H rem 10 == 6, H rem 6 == 0 -> layptu(T) ++ [H]
		;true -> layptu(T)
	end.

xuly(A) ->
	io:format("~p phan tu tan cung la 6, chia het cho 6~n", [length(layptu(A))]).