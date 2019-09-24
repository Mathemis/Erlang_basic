-module(cau06).
-export([dao/1, gtri/1, daoNguoc/1]).

dao(0) -> [];
dao(N) -> [N rem 10 | dao(N div 10)].

gtri([]) -> 0;
gtri([H|T]) -> gtri(T) * 10 + H.

daoNguoc(N) ->
	gtri(lists:reverse(dao(N))).