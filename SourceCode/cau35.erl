-module(cau35).
-export([tim/3, itnhat/1]).

tim([], _, Val) -> Val;
tim(Lst, CurLen, CurVal) ->
	[D|_] = Lst,
	{Ht,Cl} = lists:partition(fun(A) -> A == D end, Lst),
	[H|_] = Ht,
	NewLen = length(Ht),
	if 
		NewLen < CurLen -> tim(Cl, NewLen, H)
		;true			-> tim(Cl, CurLen, CurVal)
	end.

itnhat(L) ->
	Min = tim(L,987654321,0),
	io:fwrite("~p xuat hien it nhat~n", [Min]).