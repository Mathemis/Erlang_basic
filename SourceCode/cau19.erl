-module(cau19).
-export([isPrime/1, prime/2,takePrime/1,locate_MaxPrime/1]).

% Ham ktra so nguyen to
prime(N,A)
	when A*A > erlang:abs(N) -> true;
prime(N,M)->
  	Du = N rem M,
  	if Du == 0 -> false
    	;true -> prime(N,M+1)
  	end.
isPrime(-1)-> false;  	
isPrime(0)-> false;
isPrime(1)-> false;
isPrime(2)-> true;
isPrime(N) -> prime(N,2).

takePrime([]) -> [];
takePrime([H|T]) ->
	Check = isPrime(H),
	if Check == true -> takePrime(T) ++ [H]
		;true -> takePrime(T)
	end.

% main
locate_MaxPrime(List) ->
	Len = length(takePrime(List)),
	if Len < 1 -> -1
		;true ->
			L = lists:usort(takePrime(List)),
			S = lists:last(L),
			string:str(List,[S])
	end.
