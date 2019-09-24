-module(cau21).
-export([lon_thu_k/2]).

lon_thu_k(A,K) ->
	L = lists:reverse(lists:usort(A)),
	Len = length(L),
	if Len < K -> io:fwrite("khong co phan tu lon thu ~p~n",[K])
		;true -> lists:nth(K,L)
	end.
