-module(cau01).
-export([tamgiac/3]).
tamgiac(A,B,C) ->
if
	A + B =< C; B + C =< A; A + C =< B ->
		io:fwrite("Khong phai tam giac\n")
	;A == B, B == C ->
		io:fwrite("Tam giac deu\n")
	;A == B; B == C; C == A ->
		io:fwrite("Tam giac can\n")
	;A*A + B*B == C*C, A*A == B*B; B*B + C*C == A*A, B*B == C*C; C*C + A*A == B*B, C*C == A*A ->
		io:fwrite("Tam giac vuong can\n")
	;A*A + B*B == C*C; B*B + C*C == A*A; C*C + A*A == B*B ->
		io:fwrite("Tam giac vuong\n")
	;true ->
		io:fwrite("Tam giac thuong\n")
end.