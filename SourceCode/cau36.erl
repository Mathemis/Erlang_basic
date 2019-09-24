-module(cau36).
-import(lists,[split/2]).
-export([chen/3]).

chen(X, K, L1) ->
	{L2, L3} = split(K-1, L1),
	L2 ++ [X] ++ L3.