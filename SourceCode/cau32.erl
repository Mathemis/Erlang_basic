-module(cau32).
-export([tinhF/1]).

tinhF(1) -> 1;
tinhF(2) -> 2;
tinhF(N) ->
	N * N / (N-1) * tinhF(N-1).
