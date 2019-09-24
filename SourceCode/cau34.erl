-module(cau34).
-import(lists,[sort/1, reverse/1]).
-export([layduong/1, layam/1, lay0/1, sapxep/1]).

layduong([]) -> [];
layduong([H|T]) ->
	if 
		H > 0 -> layduong(T) ++ [H]
		;true -> layduong(T)
	end.

layam([]) -> [];
layam([H|T]) ->
	if 
		H < 0 -> layam(T) ++ [H]
		;true -> layam(T)
	end.


lay0([]) -> [];
lay0([H|T]) ->
	if 
		H == 0 -> lay0(T) ++ [H]
		;true -> lay0(T)
	end.

sapxep(A) ->
	Sx = lay0(A) ++ reverse(sort(layduong(A))) ++ sort(layam(A)),
	Sx.