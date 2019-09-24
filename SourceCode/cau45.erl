-module(cau45).
-export([transpose/1,sort_aRow/1,sortbyCol/1]).

transpose([[]|_]) -> [];
transpose(M) ->
  [lists:map(fun hd/1, M) | transpose(lists:map(fun tl/1, M))].

sort_aRow([]) -> [];
sort_aRow([H|T]) ->
	H1 = lists:reverse(lists:sort(H)),
	[H1] ++ sort_aRow(T).

sortbyCol(M) ->
	Lol = transpose(M),
	transpose(sort_aRow(Lol)).