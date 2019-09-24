-module(cau30).
-export([inbit/2, nhiphan/1]).

inbit(_, -1) -> io:fwrite("~n");
inbit(X, I) ->
	io:fwrite("~p", [((X bsr I) band 1)]),
	inbit(X, I - 1).

nhiphan(X) ->
	inbit(X, 15).