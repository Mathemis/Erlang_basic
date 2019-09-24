-module(cau49).
-export([main/0, read/1, tach/1, layma/1, laydiem/1, laytengiai/1, laysogiai/1, xuatDS/2, xuat/2]).

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

layma([Ma|_]) ->
	Ma.

laydiem([_|[_|[_|Diem]]]) ->
	[X|_] = Diem,
	list_to_integer(X).

laytengiai([Tengiai|_]) ->
	Tengiai.

laysogiai([_|Sogiai]) ->
	[X|_] = Sogiai,
	list_to_integer(X). 

xuatDS([], _) -> [];
xuatDS(L, 0) -> L;
xuatDS([H|T], N) ->
	io:fwrite("~p, ", [layma(H)]),
	xuatDS(T, N - 1).

xuat(_, []) -> "";
xuat([], _) -> "";
xuat(Danhsach, [Hgiai|Tgiai]) ->
	io:fwrite("~p: ", [laytengiai(Hgiai)]),
	DS = xuatDS(Danhsach, laysogiai(Hgiai)),
	io:fwrite("~n"),
	xuat(DS, Tgiai).

main() ->
	{ok, File} = file:open("khachhang.txt", [read]),
	[_|Danhsach] = read(File),
	file:close(File),
	Danhsachsx = lists:sort(fun(A, B) -> laydiem(A) > laydiem(B) end, Danhsach),
	{ok, FileGiaiThuong} = file:open("giaithuong.txt", [read]),
	[_|Giaithuong] = read(FileGiaiThuong),
	file:close(FileGiaiThuong),
	Giaithuongsx = lists:sort(fun(A, B) -> laytengiai(A) < laytengiai(B) end, Giaithuong),
	xuat(Danhsachsx, Giaithuongsx).