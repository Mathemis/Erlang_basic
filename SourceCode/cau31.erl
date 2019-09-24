-module(cau31).
-export([thapphan/1]).

gtri(0, _) -> 0;
gtri(X, I) ->
	(X rem 10) * (1 bsl I) + gtri(X div 10, I + 1).

thapphan(X) ->
	T = X rem 1000000000000000,
	-(X div 1000000000000000) * (1 bsl 15) + gtri(T, 0).