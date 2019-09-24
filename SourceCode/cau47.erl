-module(cau47).
-export([tangdan/3, kiemtratang/2, kiemtra/1]).

tangdan(_, 0, _) -> 0;
tangdan(_, _, 1) -> 1;
tangdan([H|[D|T]], State, Curlen) ->
	{A, B, C} = H,
	P1 = A + B + C,
	{X, Y, Z} = D,
	P2 = X + Y + Z,
	if
		P1 > P2 -> tangdan([D|T], 0, Curlen)
		;true	-> NewLen = length([D|T]), tangdan([D|T], State, NewLen)
	end.

kiemtratang(_, 1) -> 1;
kiemtratang([], 0) -> 0;
kiemtratang([H|T], State) ->
	Curlen = length(H),
	Status = tangdan(H, 1, Curlen),
	if
		Status == 1 -> kiemtratang(T, 1)
		;true		-> kiemtratang(T, State)
	end.

kiemtra(A) ->
	Status = kiemtratang(A, 0),
	if
		Status == 1 ->
				 io:fwrite("Ma tran co ton tai dong co chu vi tang dan~n")
		;true -> io:fwrite("Ma tran khong ton tai dong co chu vi tang dan~n")
	end.