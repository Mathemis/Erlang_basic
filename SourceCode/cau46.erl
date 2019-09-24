-module(cau46).
-export([chuvi/1,tSR/1,toLol/1,transpose/1,find/3,main/1]).

chuvi({H,T}) -> 2 * (H + T). 

tSR([]) -> [];
tSR([H|T]) -> [chuvi(H)] ++ tSR(T).

toLol([]) -> [];
toLol([H|T]) -> [tSR(H)] ++ toLol(T).

transpose([[]|_]) -> [];
transpose(M) ->	[lists:map(fun hd/1, M) | transpose(lists:map(fun tl/1, M))].

find(LL,N1,N2) ->
	L = toLol(LL), % matrix chu vi HCN
	Lt = transpose(L),
	Cn2 = lists:nth(N2,Lt), % cot N2 	
	SoDong = length(Cn2),
	if N1 > SoDong -> []
	;true ->
		Rn1 = lists:nth(N1,L), % dong N1
		SoCot = length(Rn1),
		K = lists:nth(N2,Rn1), % phan tu thu N2 cua dong thu N1 (ban dau)
		MaxR = lists:max(Rn1),
		if K == MaxR ->  % neu max tren dong 
			Do1 = 0,
			MinC = lists:min(Cn2),
			if K == MinC -> Do2 = 0 % neu min tren cot -> stop
			;true -> Do2 = 1 % ko min -> continue
			end
		;true -> Do1 = 1,Do2 = 1  % ko max -> continue
		end,
		if Do1 == 0,Do2 == 0 -> 
			Key = lists:nth(N2,lists:nth(N1,LL)), % thoa max tren dong, min tren cot -> in ra
			if N2 < SoCot -> [Key] ++ find(LL,N1,N2+1)
			;true -> [Key] ++ find(LL,N1+1,1)  
			end
		;true ->
			if N2 < SoCot -> find(LL,N1,N2+1) % chua het dong -> xet tiep tren dong
			;true ->find(LL,N1+1,N2) % het dong -> xet dong tiep theo
			end
		end
	end.

main(N) -> find(N,1,1).
