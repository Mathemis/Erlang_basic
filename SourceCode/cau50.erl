-module(cau50).
-import(rand,[uniform/1]).
-export([sotrungthuong/0]).

sotrungthuong() ->
	S1 = uniform(10) - 1,
	S2 = uniform(10) - 1,
	S3 = uniform(10) - 1,
	S4 = uniform(10) - 1,
	S5 = uniform(10) - 1,
	S6 = uniform(10) - 1,
	io:fwrite("~p~p~p~p~p~p~n", [S1, S2, S3, S4, S5, S6]).