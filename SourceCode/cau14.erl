-module(cau14).
-export([ktra/3,find/3]).

ktra([],_,_) -> io:fwrite("khong co so nao thoa dieu kien~n");
ktra([H|T],X,Y) ->
	if H =< Y,H >= X -> H
	;true -> ktra(T,X,Y)
	end.

find(L,X,Y) -> 
	L1 = lists:usort(L),
	ktra(L1,X,Y).