-module(cau26).
-export([isPrime/1, prime/2,delPrime/1]).

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

delPrime([]) -> [];
delPrime([H|T]) ->
	L = [H|T],
	Check = isPrime(H),
	if Check == true -> delPrime(lists:delete(H,L))
		;true -> [H]++delPrime(T)
	end.
