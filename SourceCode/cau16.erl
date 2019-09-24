-module(cau16).
-import(lists,[member/2]).
-export([thuocAkoB/2]).

thuocAkoB([], _) -> io:fwrite("");
thuocAkoB([H|T], B) ->
	Status = member(H, B),
   	if 
   		Status == true -> thuocAkoB(T, B)
   		;true 		   -> io:fwrite("~p~n", [H]), thuocAkoB(T, B)
   	end.