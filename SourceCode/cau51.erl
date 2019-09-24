-module(cau51).
-import(rand,[uniform/1]).
-export([sotrungthuong/0]).

sotrungthuong() ->
	S1 = uniform(45),
	S2 = uniform(45),
	S3 = uniform(45),
	S4 = uniform(45),
	S5 = uniform(45),
	S6 = uniform(45),
	io:fwrite("~p ~p ~p ~p ~p ~p~n", [S1, S2, S3, S4, S5, S6]).