-module(cau48).
-export([main/0, read/1, tach/1, layhoten/1, layHT/1, dao/1, layten/1, layten/2, laydiem/1, top3/2]).

tach([]) -> [];
tach([H|T]) ->
	case H of
		$  -> tach(T);
		$, -> tach(T);
		$\n -> [];
		_ -> {X, Y} = lists:splitwith(
						fun(A) ->
							if A /= $,, A /= $\n
								-> true;
							true
								-> false
							end
						end, [H|T]),
			[X] ++ tach(Y)
	end.

read(File) ->
	case file:read_line(File) of
		{ok, Data} -> [tach(Data) | read(File)];
		eof		   -> []
	end.

dao([]) -> [];
dao(L) ->
	[H|T] = L,
	if H == $  ->
		dao(T) ++ " ";
	true ->
		{X, Y} = lists:splitwith(fun(A) -> A /= $  end, L),
		dao(Y) ++ X
	end.

layten(HoTen) ->
	{Ten, _} = lists:splitwith(fun(A) -> A /= $  end, dao(HoTen)),
	Ten.

layten([], _) -> [];
%layten(_, 0) -> [];
layten([H|T], I) ->
	[{layten(layhoten(H)), I} | layten(T, I + 1)].

layhoten([_|[HoTen|_]]) ->
	HoTen.

laydiem([_|[_|Diem]]) ->
	Diem.

layHT([]) -> [];
%layHT(_, 0) -> [];
layHT([H|T]) ->
	[layhoten(H) | layHT(T)].

top3([], _) -> "";
top3(_, 0) -> "";
top3([H|T], I) ->
	io:fwrite("~p~n", [H]),
	top3(T, I - 1).

main() ->
	{ok, File} = file:open("input.txt", [read]),
	[_|Danhsach] = read(File),
	file:close(File),
	Danhsach,
	DShoten = layHT(Danhsach),
	io:fwrite("Cau a:~n"),
	io:fwrite("~p~n", [lists:sort(fun(A, B) -> layten(A) < layten(B) end, DShoten)]),
	DSten = layten(Danhsach, 1),
	Mapten = maps:from_list(DSten),
	io:fwrite("Cau b:~n"),
	io:fwrite("~p~n", [maps:keys(Mapten)]),
	io:fwrite("Cau c:~n"),
	top3(lists:sort(fun(A, B) -> laydiem(A) > laydiem(B) end, Danhsach), 3).