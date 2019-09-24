-module(cau10).
-export([tinh1/3, tinh/2]).

tinh1([], _, _) -> 0;
tinh1([H|T], X, Mu) -> 
	H * math:pow(X,Mu) + tinh1(T, X, Mu+1).

tinh(A, X) ->
	S = tinh1(A, X, 0),
	S.