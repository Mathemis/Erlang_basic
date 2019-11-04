cd("/Erlang_project")

% Lấy vị trí của một phần tử trong list:
	string:str(List, [Element]).

% Kiểm tra số nguyên tố:
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

% Đổi cột thành hàng trong matrix:
	transpose([[]|_]) -> [];
	transpose(M) ->
  		[lists:map(fun hd/1, M) | transpose(lists:map(fun tl/1, M))].


