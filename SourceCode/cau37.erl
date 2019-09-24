-module(cau37).
-export([laysochan/1, xuly/1]).

laysochan([]) -> [];
laysochan([H|T]) ->
	if 
		H rem 2 == 0 -> laysochan(T) ++ [H]
		;true -> laysochan(T)
	end.

xuly(A) ->
	Chan = length(laysochan(A)),
	if
		Chan == 0 ->	
		io:fwrite("Mang toan so le~n")
		;true -> io:fwrite("Mang khong toan so le~n")
	end.