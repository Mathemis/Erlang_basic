-module(cau25).
-export([isPrime/1,prime/2,takeNonPrime/1,trich/2]).

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

takeNonPrime([]) -> [];
takeNonPrime([H|T]) ->
	Check = isPrime(H),
	if Check == false -> [H]++takeNonPrime(T)
		;true -> takeNonPrime(T)
	end.

trich(A,B) ->
	L = takeNonPrime(A),
	L++B.
	