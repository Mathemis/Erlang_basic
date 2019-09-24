-module(cau02).
-export([vttuongdoi/3]).
vttuongdoi(Rn,Rl,D) ->
if
	D > Rn+Rl ->
		io:fwrite("Tach roi\n")
	;D == Rn+Rl ->
		io:fwrite("Tiep xuc ngoai\n")
	;Rn == Rl, D == 0 ->
		io:fwrite("Chong khop len nhau\n")
	;Rl-Rn == D ->
		io:fwrite("Tiep xuc trong\n")
	;D+Rn < Rl ->
		io:fwrite("Bao nhau\n")
	;Rn+Rl > D ->
		io:fwrite("Giao nhau\n")
end.