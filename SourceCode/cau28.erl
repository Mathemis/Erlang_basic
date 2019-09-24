-module(cau28).
-export([isPrime/1,prime/2,takePrime/1,tinh/1]).

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

% Lay danh sach cac so nguyen to
takePrime([]) -> [];
takePrime([H|T]) ->
	Check = isPrime(H),
	if Check == true -> takePrime(T) ++ [H]
		;true -> takePrime(T)
	end.

tinh(L) ->
	L1 = takePrime(L),
	Len = length(L1),
	if Len < 1 -> 0
		;true -> lists:sum(L1) / Len
	end.