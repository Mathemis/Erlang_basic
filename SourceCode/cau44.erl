-module(cau44).
-export([tangdan/3, kiemtratang/1]).

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

kiemtratang(A) ->
	Curlen = length(A),
	State = tangdan(A, 1, Curlen),
	if
		State == 1 -> io:fwrite("Chu vi tang dan~n")
		;true	   -> io:fwrite("Chu vi khong tang dan~n")
	end.