-module(cau40).
-export([tim/3, nhieunhat/1]).

tim([], _, Val) -> Val;
tim(Lst, CurLen, CurVal) ->
	[D|_] = Lst,
	{Ht,Cl} = lists:partition(fun(A) -> A == D end, Lst),
	[H|_] = Ht,
	NewLen = length(Ht),
	if 
		NewLen > CurLen -> tim(Cl, NewLen, H)
		;true			-> tim(Cl, CurLen, CurVal)
	end.

nhieunhat(N) ->
	L=lists:append(N),
	Max = tim(L,0,0),
	io:fwrite("~p xuat hien nhieu nhat~n", [Max]).