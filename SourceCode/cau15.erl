-module(cau15).
-export([sochuso/1, pow/2, tinh/2, isAmstrong/1]).

sochuso(N) ->
	if 0 =< N, N =< 9
		-> 1;
	true
		-> 1 + sochuso(N div 10)
	end.

pow(_, 0) -> 1;
pow(X, Y) ->
	T = pow(X, Y div 2),
	if Y rem 2 /= 0
		-> T * T * X;
	true
		-> T * T
	end.

tinh(0, _) -> 0;
tinh(X, Y) ->
	pow(X rem 10, Y) + tinh(X div 10, Y).

isAmstrong(X) ->
	case tinh(X, sochuso(X)) of
		X -> io:fwrite("~p la so Amstrong~n", [X]);
		_ -> io:fwrite("~p ko la so Amstrong~n", [X])
	end.